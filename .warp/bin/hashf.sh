#!/bin/bash

: '
This shell script contains hash functions to compute hash according to
input parameters.
'

hashf() {
    # Check non empty args:
    if [ $# == 0 ]; then 
        warp_message_warn "Wrong input arguments for random_hash function." ; exit 1
    fi

    while [[ -n $1 ]]; do
        case "$1" in
            -a | --algorithm)
                shift
                case "$1" in
                    md5)
                    ALG_COMMAND=md5sum
                    shift
                    ;;
                    *)
                    warp_message_warn "Unknown algorithm for random_hash function." ; exit 1
                    ;;
                esac
                ;;
            -i | --input)
                shift
                case "${1::2}" in
                    r:)
                    # We have to calculate over a randon sequence.
                    RANDOM_VALUE=$((1 + $RANDOM % ${1:2:${#1}}))
                    shift
                    ;;
                    *)
                    # We have to calculate a hash file.
                    FILE_HASH_FLAG=1
                    FILE_PATH=$1
                    shift
                    ;;
                esac
                ;;
            -so | --short-output)
                # Output string length:
                shift
                OUTPUT_LENGTH=$1
                shift
                ;;
            *)
                warp_message_warn "Wrong input arguments for random_hash function." ; exit 1
                ;;
        esac
    done

    # Compute hash:
    if [[ $FILE_HASH_FLAG ]]; then
        RANDOM_HASH=$($ALG_COMMAND $FILE_PATH | awk '{print $1}' | tr -d '\n')
    else
        RANDOM_HASH=$(echo $RANDOM_VALUE | $ALG_COMMAND | awk '{print $1}' | tr -d '\n')
    fi

    if [[ -n $OUTPUT_LENGTH ]]; then
        RANDOM_HASH=${RANDOM_HASH::$OUTPUT_LENGTH}
    fi

    printf "$RANDOM_HASH\n"
}