#!/bin/bash

count_chars=0
count_lines=0
count_words=0
count_bytes=0
option_provided=0

while getopts "clwm:" opt; do
    case $opt in
        c)
            count_chars=1
            option_provided=1
            ;;
        l)
            count_lines=1
            option_provided=1
            ;;
        w)
            count_words=1
            option_provided=1
            ;;
        m)
            count_bytes=1
            option_provided=1
            ;;
        \?)
            echo "Invalid option: -$OPTARG" >&2
            exit 1
            ;;
    esac
done

shift $((OPTIND-1))

if [ $option_provided -eq 0 ]; then
    count_chars=1
    count_lines=1
    count_words=1
fi

perform_wc() {
    input="$1"
    var="$2"
    result=""
    if [ $count_lines -eq 1 ]; then
        result+=" $(wc -l < "$input")"
    fi
    if [ $count_words -eq 1 ]; then
        result+=" $(wc -w < "$input")"
    fi
    if [ $count_bytes -eq 1 ]; then
        result+=" $(wc -m < "$input")"
    fi
    if [ $count_chars -eq 1 ]; then
        result+=" $(wc -c < "$input")"
    fi

    if [ "$var" -eq 0 ]; then
        echo "$result $input"
    fi
    if [ "$var" -eq 1 ]; then
        echo "$result"
    fi
}

if [ -n "$1" ]; then
    if [ -f "$1" ]; then
        perform_wc "$1" 0
    else
        echo "File '$1' does not exist." >&2
        exit 1
    fi
else
    if [ -t 0 ]; then
        echo "No file or standard input provided. Usage: ccwc [-c|-l|-w|-m] <file>"
        exit 1
    else
        temp_file=$(mktemp)
        cat > "$temp_file"
        perform_wc "$temp_file" 1
        rm "$temp_file"
    fi
fi
