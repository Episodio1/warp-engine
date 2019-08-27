#!/bin/bash

    # IMPORT HELP

    . "$PROJECTPATH/.warp/bin/selenium_help.sh"

#######################################
# Start the server and all of its
# components
# Globals:
#   None
# Arguments:
#   None
# Returns:
#   None
#######################################
function start() {
  if [ "$1" = "-h" ] || [ "$1" = "--help" ]
  then
      selenium_start_help 
      exit 1
  fi;

  warp_check_selenium_is_installed

  warp start --selenium  
}

function stop() {
  if [ "$1" = "-h" ] || [ "$1" = "--help" ]
  then
      selenium_stop_help 
      exit 1
  fi;

  warp stop $*
}

function selenium_info()
{

    warp_message ""
    warp_message_info "* SELENIUM"
    warp_message "Selenium files:             $(warp_message_info $PROJECTPATH/.warp/docker/selenium)"
    warp_message ""
}

function ssh() {    
  
    if [ "$1" = "-h" ] || [ "$1" = "--help" ]
    then
        selenium_ssh_help 
        exit 1
    fi;

    warp_check_selenium_is_installed

    if [ $(warp_check_selenium_is_running) = false ]; then
        warp_message_error "The containers of selenium is not running"
        warp_message_error "please, first run: warp stop & warp selenium start"

        exit 1;
    fi

    warp_message_warn "entering to selenium container, to exit please run: exit";

    docker-compose -f $DOCKERCOMPOSEFILE exec selenium bash -c "export COLUMNS=`tput cols`; export LINES=`tput lines`; exec bash"
}

function setup() {
    if [ "$1" = "-h" ] || [ "$1" = "--help" ]
    then
        selenium_setup_help 
        exit 1
    fi;

    warp_message_info "* Starting setup Selenium"
    warp_message ""

    . "$WARPFOLDER/setup/selenium/selenium.sh"
}

function selenium_main()
{
    case "$1" in
        start)
          shift 1
          start $*
        ;;

        stop)
          shift 1
          stop $*
        ;;

        info)
            selenium_info
        ;;

        ssh)
          shift 1
          ssh $*
        ;;

        setup)
          shift 1
          setup $*
        ;;

        *)
          selenium_help_usage
        ;;
    esac
}
