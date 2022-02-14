function test_get_unique_types {
    local test_statement="Should give all the unique types"
    local record=`echo -e "1|1|purple,gold\n2|2|black,purple"`
    local expected_output=`echo -e "black\ngold\npurple"`

    local actual_output=`get_unique_types "${record}"`

    assert_expectation "${actual_output}" "${expected_output}" "${test_statement}"
}