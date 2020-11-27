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
    ES_HOST2CONTAINER_PORT=$(docker inspect --format='{{(index (index .NetworkSettings.Ports "9200/tcp") 0).HostPort}}' $(warp docker ps -q elasticsearch))

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
        [[ -n $ES_HOST2CONTAINER_PORT ]] && warp_message "Ports (container):          $(warp_message_info "$ES_HOST2CONTAINER_PORT <-- 9200")"
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

elasticsearch_clear_all() {
    : '
    This function unlocks and delete all indexes.
    '

    # Parsing ES dynamic binded port:
    ES_HOST2CONTAINER_PORT=$(docker inspect --format='{{(index (index .NetworkSettings.Ports "9200/tcp") 0).HostPort}}' $(warp docker ps -q elasticsearch))
    # Unlocking indexes:
    ACK=$(curl --no-progress-meter -X PUT -H "Content-Type: application/json" http://localhost:$ES_HOST2CONTAINER_PORT/_all/_settings -d '{"index.blocks.read_only_allow_delete": null}')
    if [[ $(echo "$ACK" | grep '{"acknowledged":true}') ]]; then
        warp_message "* Unlocking indexes... $(warp_message_ok [ok])"
        # Deleting indexes:
        ACK=$(curl --no-progress-meter -X DELETE "localhost:$ES_HOST2CONTAINER_PORT/_all")
        if [[ $(echo "$ACK" | grep '{"acknowledged":true}') ]]; then
            warp_message "* Deleting indexes... $(warp_message_ok [ok])"
        else
            warp_message_error "Delete process fail"
            exit 1
        fi
    else
      warp_message_error "Unlock process fail"
      exit 1
    fi
}

function elasticsearch_main()
{
    case "$1" in
        # NO LE VEO MUCHO SENTIDO AL SIGUIENTE CASE:
        elasticsearch)
		    shift 1
            elasticsearch_command $*  
        ;;
        # ES INGRESAR warp elasticsearch elasticsearch

        --clear-all)
            shift
            elasticsearch_clear_all
        ;;

        info)
            elasticsearch_info
        ;;

        -h | --help)
            elasticsearch_help_usage
        ;;

        *)
		    elasticsearch_help_usage
        ;;
    esac
}