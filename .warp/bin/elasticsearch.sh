#!/bin/bash

    # IMPORT HELP

    . "$PROJECTPATH/.warp/bin/elasticsearch_help.sh"

function elasticsearch_info()
{

    if ! warp_check_env_file ; then
        warp_message_error "file not found $(basename $ENVIRONMENTVARIABLESFILE)"
        exit
    fi; 

    ES_HOST="elasticsearch"
    ES_VERSION=$(warp_env_read_var ES_VERSION)
    ES_MEMORY=$(warp_env_read_var ES_MEMORY)
    if [ $(warp_check_is_running) = true ] && [[ -n $ES_VERSION ]]; then
        ES_HOST2CONTAINER_PORT=$(docker inspect --format='{{(index (index .NetworkSettings.Ports "9200/tcp") 0).HostPort}}' $(warp docker ps -q elasticsearch))
    fi

    MODE_SANDBOX=$(warp_env_read_var MODE_SANDBOX)

    if [ "$MODE_SANDBOX" = "Y" ] || [ "$MODE_SANDBOX" = "y" ] ; then
        ES_HOST=$ES_SBHOST
        ES_VERSION=$ES_SBVER
        ES_MEMORY=$ES_SBMEM
    fi

    if [ ! -z "$ES_VERSION" ]
    then
        warp_message ""
        warp_message_info "* Elasticsearch"
        warp_message "Version:                    $(warp_message_info $ES_VERSION)"
        warp_message "Host:                       $(warp_message_info $ES_HOST)"
        [[ -n $ES_HOST2CONTAINER_PORT ]] && warp_message "Ports (container):          $(warp_message_info "$ES_HOST2CONTAINER_PORT --> 9200")"
        warp_message "Data:                       $(warp_message_info $PROJECTPATH/.warp/docker/volumes/elasticsearch)"
        warp_message "Memory:                     $(warp_message_info $ES_MEMORY)"

        warp_message ""
    fi

}

function elasticsearch_command()
{

    if [ "$1" = "-h" ] || [ "$1" = "--help" ]
    then
        elasticsearch_help_usage 
        exit 1
    fi;

}

elasticsearch-simil_ssh() {
    : '
    This function provides a bash pipe as root or elasticsearch user.
    It is called as SSH in order to make it better for developers ack
    but it does not use Secure Shell anywhere.
    '

    # Check for wrong input:
    if [[ $# -gt 1 ]]; then
        elasticsearch-ssh_wrong_input
        exit 1
    else
        if [[ $1 == "--root" ]]; then
            # Check if warp is running:    
            if [ $(warp_check_is_running) = false ]; then
                warp_message_error "The containers are not running"
                warp_message_error "please, first run warp start"
                exit 1
            fi
            docker-compose -f $DOCKERCOMPOSEFILE exec -u root elasticsearch bash
        elif [[ -z $1 || $1 == "--elasticsearch" ]]; then
            # Check if warp is running:    
            if [ $(warp_check_is_running) = false ]; then
                warp_message_error "The containers are not running"
                warp_message_error "please, first run warp start"
                exit 1
            fi
            # It is better if defines elasticsearch user as default ######################
            docker-compose -f $DOCKERCOMPOSEFILE exec -u elasticsearch elasticsearch bash
        elif [[ $1 == "-h" || $1 == "--help" ]]; then
            elasticsearch-ssh_help
            exit 0
        else
            elasticsearch-ssh_wrong_input
        fi
    fi
}

elasticsearch-flush() {
    : '
    This function unlocks and delete all indexes.
    '

    if [[ $* == "-h" || $* == "--help" ]]; then
        elasticsearch-flush_help
        exit 0
    elif [[ -z $* ]]; then
        # Check if warp is running:    
        if [ $(warp_check_is_running) = false ]; then
            warp_message_error "The containers are not running"
            warp_message_error "please, first run warp start"
            exit 1
        fi
        # Parsing ES dynamic binded port:
        ES_HOST2CONTAINER_PORT=$(docker inspect --format='{{(index (index .NetworkSettings.Ports "9200/tcp") 0).HostPort}}' $(warp docker ps -q elasticsearch))
        if [[ -n $(curl --silent -X GET http://localhost:$ES_HOST2CONTAINER_PORT/_cat/indices) ]]; then
            # Unlocking indexes:
            ACK=$(curl --silent -X PUT -H "Content-Type: application/json" http://localhost:$ES_HOST2CONTAINER_PORT/_all/_settings -d '{"index.blocks.read_only_allow_delete": null}')
            if [[ $(echo "$ACK" | grep '{"acknowledged":true}') ]]; then
                warp_message "* Unlocking indexes... $(warp_message_ok [ok])"
                # Deleting indexes:
                ACK=$(curl --silent -X DELETE "localhost:$ES_HOST2CONTAINER_PORT/_all")
                if [[ $(echo "$ACK" | grep '{"acknowledged":true}') ]]; then
                    warp_message "* Deleting indexes...  $(warp_message_ok [ok])"
                else
                    warp_message_error "Delete process fail"
                    exit 1
                fi
            else
                warp_message_error "Unlock process fail"
                exit 1
            fi
        else
            warp_message_warn "ES database is empty. Nothing to do."
        fi
    else
        elasticsearch-flush_wrong_input
    fi
}

function elasticsearch_main()
{
    case "$1" in
        elasticsearch)
		    shift 1
            elasticsearch_command $*  
        ;;

        flush)
            shift
            elasticsearch-flush $*
        ;;

        info)
            shift
            elasticsearch_info
        ;;

        ssh)
            shift
            elasticsearch-simil_ssh $*
        ;;

        -h | --help)
            elasticsearch_help_usage
        ;;

        *)
		    elasticsearch_help_usage
        ;;
    esac
}

elasticsearch-ssh_wrong_input() {
    warp_message_error "Wrong input."
    elasticsearch-ssh_help
    exit 1
}

elasticsearch-flush_wrong_input() {
    warp_message_error "Wrong input."
    elasticsearch-flush_help
    exit 1
}