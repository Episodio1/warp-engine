#!/bin/bash

function elasticsearch_help_usage() {
    warp_message ""
    warp_message_info "Usage:"
    warp_message      " warp elasticsearch [options]"
    warp_message ""

    warp_message ""
    warp_message_info "Options:"
    warp_message_info   " --clear-all        $(warp_message 'Unlock and delete all indexes')"
    warp_message_info   " -h, --help         $(warp_message 'display this help message')"
    warp_message ""

    warp_message_info "Available commands:"

    warp_message_info   " info               $(warp_message 'display info available')"
    warp_message_info   " ssh                $(warp_message 'connect to elasticsearch by ssh')"

    warp_message ""
    warp_message_info "Help:"
    warp_message " elasticsearch service uses ports 9200 and 9300 inside the containers"
    warp_message " to use this service you must modify localhost:9200 by elasticsearch:9200 in the project"
    warp_message ""
}

function elasticsearch_help()
{
    warp_message_info   " elasticsearch      $(warp_message 'service of elasticsearch')"
}

elasticsearch-ssh_help() {

    warp_message ""
    warp_message_info "Usage:"
    warp_message      " warp elasticsearch ssh [options]"
    warp_message ""

    warp_message ""
    warp_message_info "Options:"
    warp_message_info   " -h, --help         $(warp_message 'display this help message')"
    warp_message_info   " --elasticsearch    $(warp_message 'inside container elasticsearch as elasticsearch user')"
    warp_message_info   " --root             $(warp_message 'inside container elasticsearch as root user')"
    warp_message ""

    warp_message ""
    warp_message_info "Help:"
    warp_message " Connect to elasticsearch by ssh "
    warp_message ""

    warp_message_info "Example:"
    warp_message " warp elasticsearch ssh"
    warp_message " warp elasticsearch ssh --root"
    warp_message " warp elasticsearch ssh -h"
    warp_message " warp elasticsearch ssh --help"
    warp_message ""
}