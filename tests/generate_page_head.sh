function test_generate_page_head {
    local test_statement="Should generate pokemon head tag with desired contents"
    local expected_output='<head><title>Pokemon</title><link rel="stylesheet" href="styles.css"></head>'

    local actual_output=`generate_page_head`

    assert_expectation "${actual_output}" "${expected_output}" "${test_statement}"
}