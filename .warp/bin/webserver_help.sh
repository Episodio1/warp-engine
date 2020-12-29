#!/bin/bash

webserver-help_usage() {
    warp_message ""
    warp_message_info "Usage:"
    warp_message      " warp nginx [options]"
    warp_message ""

    warp_message ""
    warp_message_info "Options:"
    warp_message_info   " -h, --help         $(warp_message 'display this help message')"
    warp_message ""

    warp_message_info "Available commands:"

    warp_message_info   " info               $(warp_message 'display info available')"
    warp_message_info   " ssh                $(warp_message 'connect to nginx by ssh')"
}

webserver_help() {
    warp_message_info   " nginx              $(warp_message 'NGinx web service')"
}

webserver-ssh_help() {

    warp_message ""
    warp_message_info "Usage:"
    warp_message      " warp nginx ssh [options]"
    warp_message ""

    warp_message ""
    warp_message_info "Options:"
    warp_message_info   " -h, --help         $(warp_message 'display this help message')"
    warp_message_info   " --nginx            $(warp_message 'inside web server container as nginx user')"
    warp_message_info   " --root             $(warp_message 'inside web server as root user')"
    warp_message ""

    warp_message ""
    warp_message_info "Help:"
    warp_message " Connect to web server by ssh "
    warp_message ""

    warp_message_info "Example:"
    warp_message " warp nginx ssh"
    warp_message " warp nginx ssh --root"
    warp_message " warp nginx ssh -h"
    warp_message " warp nginx ssh --help"
    warp_message ""
}
