function test_create_stats_row {
    local test_statement="Should create row in table for stats"
    local expected_output='<tr><th>Power</th><td>100</td></tr>'

    local actual_output=`create_stats_row "Power" "100"`

    assert_expectation "${actual_output}" "${expected_output}" "${test_statement}"
}