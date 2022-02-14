#! /bin/bash

source generate_cards.sh
source generate_sidebar.sh
source library.sh

function get_unique_types () {
    local records=$1
    local types=`get_field "${records}" 3`
    echo "${types}" | tr "," "\n" | sort | uniq
}

function filter_records () {
    local records=$1
    local type=$2

    if [[ ${type} == all ]]
    then
        echo "${records}"
        return
    fi

    grep "[^|]*|[^|]*|[^|]*${type}"  <<< "${records}"
}

function generate_page_head () {
    local head_content=`generate_title "" "Pokemon"`
    local head_content+=`generate_link "styles.css"`
    local pokemon_head=`generate_head "" "${head_content}"`
    echo "${pokemon_head}"
}

function generate_page_body () {
    local records=$1
    local types=$2
    local selected_type=$3

    local sidebar=`generate_sidebar "${types}" "${selected_type}"`
    sidebar=`generate_nav "sidebar" "${sidebar}"`

    local filtered_records=`filter_records "${records}" "${selected_type}"`
    local cards=`generate_cards "${filtered_records}"`
    cards=`generate_main "cards" "${cards}"`

    local page_body=`generate_body "" "${sidebar}${cards}"`
    
    echo "${page_body}"
}

function generate_pokemon_html () {
    local records=$1
    local types=$2
    local selected_type=$3

    local page_head=`generate_page_head`
    local page_body=`generate_page_body "${records}" "${types}" "${selected_type}"`

    generate_html "html" "" "${page_head}${page_body}"
}

function create_files () {
    local records=$1
    local target_directory=$2
    
    local types=`get_unique_types "${records}"`
    types=`echo -e "all\n${types}"`

    local type pokemon_page target_file

    for type in ${types}
    do
        echo "Creating ${type}.html file"
        pokemon_page=`generate_pokemon_html "${records}" "${types}" "${type}"`

        target_file="${target_directory}/${type}.html"
        echo "${pokemon_page}" > ${target_file}
    done
}

function arrange_sources () {
    local images_dir=$1
    local styles=$2
    local target_directory=$3

    rm -r ${target_directory} 2> /dev/null
    mkdir "${target_directory}"
    cp -r "${images_dir}" "${target_directory}"
    cp "${styles}" "${target_directory}"
}

function main () {
    local DATA_FILE=$1
    local TARGET_DIRECTORY="html"

    local DATA=`read_file ${DATA_FILE} | tail -n+2`

    create_files "${DATA}" "${TARGET_DIRECTORY}"
}