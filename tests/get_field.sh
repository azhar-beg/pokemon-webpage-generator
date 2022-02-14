function test_get_field {
    local test_statement="Should capture the given field"
    local record="red|blue|green|yellow"
    local field=3
    local expected_output="green"

    local actual_output=`get_field "${record}" "${field}"`

    assert_expectation "${actual_output}" "${expected_output}" "${test_statement}"
}