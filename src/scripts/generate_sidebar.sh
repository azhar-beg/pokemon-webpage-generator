#! /bin/bash

source library.sh

function generate_sidebar () {
    local types=$1
    local selected_type=$2
    local type anchor class list
    
    for type in `echo "${types}"`
    do
        anchor=`generate_anchor "${type}.html" "${type}"`
        class=""
        if [[ "${type}" == "${selected_type}" ]]
        then
            class="${selected_type} selected"
        fi
        list+=`generate_li "${class}" "${anchor}"`
    done

    generate_ul "" "${list}"
}