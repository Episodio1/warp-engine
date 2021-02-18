#!/bin/bash

function elasticsearch_help_usage() {
    warp_message ""
    warp_message_info "Usage:"
    warp_message      " warp elasticsearch [options]"
    warp_message ""

    warp_message ""
    warp_message_info "Options:"
    warp_message_info   " -h, --help         $(warp_message 'display this help message')"
    warp_message ""

    warp_message_info "Available commands:"

    warp_message_info   " info               $(warp_message 'display info available')"
    warp_message_info   " ssh                $(warp_message 'connect to elasticsearch by ssh')"
    warp_message_info   " flush              $(warp_message 'Unlock and delete all indexes')"
    warp_message_info   " switch             $(warp_message 'Switch between ES versions.')"

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

elasticsearch-flush_help() {
    warp_message ""
    warp_message_info "Usage:"
    warp_message      " warp elasticsearch flush"
    warp_message ""

    warp_message ""
    warp_message_info "Help:"
    warp_message " For delete ES data purposes. Use it to fix a cluster_block_exception "
    warp_message " also called as FORBIDDEN/12/index read-only / allow delete (api)]"
    warp_message ""

    warp_message_info "Example:"
    warp_message " warp elasticsearch flush"
    warp_message " warp elasticsearch flush -h"
    warp_message ""
}

elasticsearch_switch_help () {
    warp_message ""
    warp_message_info "Usage:"
    warp_message      " warp elascticsearch switch [options]"
    warp_message ""

    warp_message ""
    warp_message_info "Options:"
    warp_message_info   " -h, --help         $(warp_message 'display this help message')"
    warp_message ""

    warp_message ""
    warp_message_info "Help:"
    warp_message " this command allows to change the ElasticSearch version"
    warp_message " you can check the available versions of ElasticSearch here: $(warp_message_info '[ https://hub.docker.com/r/summasolutions/elasticsearch/tags/ ]')"
    warp_message ""

    warp_message_info "Example:"
    warp_message " warp elasticsearch switch 7.6.2"
    warp_message " warp elasticsearch switch 5.6.8"
    warp_message " warp elasticsearch switch 6.4.2"
    warp_message ""    
}