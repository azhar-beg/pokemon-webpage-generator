#! /bin/bash

source library.sh

function get_pokemon_name () {
    get_field $1 2
}

function get_types () {
    get_field $1 3
}

function get_speed () {
    get_field $1 4
}

function get_hp () {
    get_field $1 5
}

function get_base_xp () {
    get_field $1 6
}

function get_attack () {
    get_field $1 7
}

function get_defence () {
    get_field $1 8
}

function get_weight () {
    get_field $1 9
}

function modify_types {
    local types=$1
    local type capitalized_type modified_types

    for type in ${types}
    do
        capitalized_type=`capitalize_first_letter "${type}"`
        modified_types+=`generate_div "${type}" "${capitalized_type}"`
    done
    echo "${modified_types}"
}

function create_stats_row () {
    local stat_header=$1
    local stat_value=$2

    local row_content=`generate_th "" "${stat_header}"`
    row_content+=`generate_td "" "${stat_value}"`

    local stat_row=`generate_tr "" "${row_content}"`
    echo "${stat_row}"
}

function create_stats_table () {
    local weight=$1
    local hp=$2
    local base_xp=$3
    local attack=$4
    local defence=$5
    local speed=$6
    local table_content

    local stat_header=( Weight HP Base_XP Attack Defence Speed )
    local stats=( "${weight}" "${hp}" "${base_xp}" "${attack}" "${defence}" "${speed}" )
    local last_index=$(( ${#stats[@]} - 1 ))

    for index in `seq 0 ${last_index}`
    do
        table_content+=`create_stats_row "${stat_header[${index}]}" "${stats[${index}]}"`
    done

    table_content=`generate_tbody "" "${table_content}"`
    local stats_table=`generate_table "stats" "${table_content}"`
    echo "${stats_table}"
}

function create_pokemon_header () {
    local title=$1
    local types=$2
    local header_content
    
    header_content=`generate_h2 "" "${title}"`
    header_content+=`generate_div "type" "${types}"`
    local pokemon_header=`generate_header "" "${header_content}"`

    echo "${pokemon_header}"
}

function generate_poke_image () {
    local pokemon_name=$1
    
    local pokemon_image=`generate_img "images/${pokemon_name}.png" "${pokemon_name}"`
    pokemon_image=`generate_figure "pokemon-img" "${pokemon_image}"`

    echo "${pokemon_image}"
}

function generate_card () {
    local record=$1

    local pokemon_name=`get_pokemon_name ${record}`
    local header=`capitalize_first_letter ${pokemon_name}`
    local types=`get_types ${record} | tr "," "\n"`
    local modified_types=`modify_types "${types}"`
    local weight=`get_weight ${record}`
    local hp=`get_hp ${record}`
    local base_xp=`get_base_xp ${record}`
    local attack=`get_attack ${record}`
    local defence=`get_defence ${record}`
    local speed=`get_speed ${record}`

    local pokemon_image=`generate_poke_image "${pokemon_name}"`

    local pokemon_header=`create_pokemon_header "${header}" "${modified_types}"`
    local stats_table=`create_stats_table "${weight}" "${hp}" "${base_xp}" "${attack}" "${defence}" "${speed}"`
    local pokemon_information=`generate_section "information" "${pokemon_header}${stats_table}"`

    local card=`generate_article "pokemon-card" "${pokemon_image}${pokemon_information}"`

    echo "${card}"
}

function generate_cards () {
    local records=$1
    local card

    for pokemon_record in ${records}
    do
        cards+=`generate_card ${pokemon_record}`
    done
    echo -n "${cards}"
}