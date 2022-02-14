function test_modify_types {
    local test_statement="Should add 'div tags' for given types"
    local record=`echo -e "purple\nblack"`
    local expected_output='<div class="purple">Purple</div><div class="black">Black</div>'

    local actual_output=`modify_types "${record}"`

    assert_expectation "${actual_output}" "${expected_output}" "${test_statement}"
}