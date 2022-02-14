function test_capitalize_first_letter {
    local test_statement="Should capitalize first letter of the given word"
    local record="purple"
    local expected_output="Purple"

    local actual_output=`capitalize_first_letter "${record}"`

    assert_expectation "${actual_output}" "${expected_output}" "${test_statement}"
}