#! /bin/bash

source ../src/scripts/generate_site.sh
source ../src/scripts/generate_sidebar.sh
source ../src/scripts/generate_cards.sh
source ../src/scripts/library.sh

function declare_global_var (){
        RED="\033[1;31m"
        GREEN="\033[0;32m"
        WHITE="\033[1;37m"
        NORMAL="\033[0m"

        FAILED_RECORDS[0]=""
        TEST_COUNT=0
        FAIL_COUNT=0
        PASS="${GREEN}✔${NORMAL}"
}

function save_fail_records (){
        local FAIL_RECORD=$1
        local test_statement=$2

        FAIL_COUNT=$(( ${FAIL_COUNT} + 1 ))
        FAILED_RECORDS+=( "${RED}${TEST_COUNT}.\n${NORMAL}${FAIL_RECORD}" )
        echo -e "\t${RED}${TEST_COUNT}.${NORMAL}\t${test_statement}"
}

function assert_expectation (){
        local actual_output=$1
        local expected_output=$2
        local test_statement=$3

        TEST_COUNT=$(( ${TEST_COUNT} + 1 ))

        local outputs="  actual output:\n${actual_output}\n  expected output:\n${expected_output}"

        local test_result="✗"
        if [[ ! "${actual_output}" == "${expected_output}" ]] ; then
                save_fail_records "${outputs}" "${test_statement}"
                return
        fi

        test_result="${PASS}"
        echo -e "\t${test_result}\t${test_statement}"
}

function test_report (){
        echo -e "\nFAILING TESTS\n=>"

        for i in `seq 1 ${FAIL_COUNT}` ; do
                echo -e "\n${FAILED_RECORDS[$i]}"
        done

        echo -ne "\n\t${WHITE}Tests passes : ${GREEN}$(( ${TEST_COUNT}-${FAIL_COUNT} ))/${TEST_COUNT}${NORMAL}"
        echo -e "\t${WHITE}Tests failed : ${RED}${FAIL_COUNT}/${TEST_COUNT}\n"
}

function all_test_cases () {
    echo -e "\n${WHITE}Generate html${NORMAL}"
    source html_generator.sh
    generate_html_test_cases

    echo -e "\n${WHITE}Filter records${NORMAL}"
    source filter_records.sh
    test_filter_records

    echo -e "\n${WHITE}Get field${NORMAL}"
    source get_field.sh
    test_get_field

    echo -e "\n${WHITE}Get unique types${NORMAL}"
    source get_unique_types.sh
    test_get_unique_types

    echo -e "\n${WHITE}Capitalize first letter${NORMAL}"
    source capitalize_first_letter.sh
    test_capitalize_first_letter

    echo -e "\n${WHITE}Modify types${NORMAL}"
    source modify_types.sh
    test_modify_types
    
    echo -e "\n${WHITE}Create stats row${NORMAL}"
    source create_stats_row.sh
    test_create_stats_row
    
    echo -e "\n${WHITE}Create stats table${NORMAL}"
    source create_stats_table.sh
    test_create_stats_table
    
    echo -e "\n${WHITE}Create pokemon header${NORMAL}"
    source create_pokemon_header.sh
    test_create_pokemon_header

    echo -e "\n${WHITE}Generate poke image${NORMAL}"
    source generate_poke_image.sh
    test_generate_poke_image
    
    echo -e "\n${WHITE}Generate card${NORMAL}"
    source generate_card.sh
    test_generate_card
    
    echo -e "\n${WHITE}Generate cards${NORMAL}"
    source generate_cards.sh
    test_generate_cards
    
    echo -e "\n${WHITE}Generate sidebar${NORMAL}"
    source generate_sidebar.sh
    test_generate_sidebar
    
    echo -e "\n${WHITE}Generate page body${NORMAL}"
    source generate_page_body.sh
    test_generate_page_body
    
    echo -e "\n${WHITE}Generate page head${NORMAL}"
    source generate_page_head.sh
    test_generate_page_head

    echo -e "\n${WHITE}Generate pokemon html${NORMAL}"
    source generate_pokemon_html.sh
    test_generate_pokemon_html
    
}

declare_global_var