function test_create_stats_table {
    local test_statement="Should create table for stats"
    local expected_output='<table class="stats"><tbody><tr><th>Weight</th><td>100</td></tr><tr><th>HP</th><td>20</td></tr><tr><th>Base_XP</th><td>45</td></tr><tr><th>Attack</th><td>60</td></tr><tr><th>Defence</th><td>29</td></tr><tr><th>Speed</th><td>75</td></tr></tbody></table>'

    local actual_output=`create_stats_table "100" "20" "45" "60" "29" "75"`

    assert_expectation "${actual_output}" "${expected_output}" "${test_statement}"
}