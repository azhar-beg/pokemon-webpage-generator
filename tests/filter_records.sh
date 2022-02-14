#! /bin/bash

function filter_records_for_specific_type () {
    local test_statement="Should filter records for specific type"
    local records=`echo -e "1|bulbasaur|grass,poison|45|45|64|49|49|69\n2|ivysaur|grass|45|45|64|49|49|69"`
    local type="poison"
    local expected_output="1|bulbasaur|grass,poison|45|45|64|49|49|69"
    
    local actual_output=`filter_records "${records}" ${type}`

    assert_expectation "${actual_output}" "${expected_output}" "${test_statement}"
}

function filter_records_for_all () {
    local test_statement="Should capture all the records when type is 'all'"
    local records=`echo -e "1|bulbasaur|grass,poison|45|45|64|49|49|69\n2|ivysaur|grass|45|45|64|49|49|69"`
    local type="all"
    local expected_output=`echo -e "1|bulbasaur|grass,poison|45|45|64|49|49|69\n2|ivysaur|grass|45|45|64|49|49|69"`
    
    local actual_output=`filter_records "${records}" ${type}`

    assert_expectation "${actual_output}" "${expected_output}" "${test_statement}"
}

function test_filter_records {
    filter_records_for_specific_type
    filter_records_for_all
}