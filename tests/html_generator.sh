function test_generate_html_without_class {
    local test_statement="Should genereate html without class attribute."
    local tag=li
    local class=""
    local content=red
    local expected_output="<li>red</li>"

    local actual_output=`generate_html "${tag}" "${class}" "${content}"`

    assert_expectation "${actual_output}" "${expected_output}" "${test_statement}"
}

function test_generate_html_with_class {
    local test_statement="Should genereate html with class."
    local tag=li
    local class="colors"
    local content=red
    local expected_output="<li class=\"colors\">red</li>"

    local actual_output=`generate_html "${tag}" "${class}" "${content}"`

    assert_expectation "${actual_output}" "${expected_output}" "${test_statement}"
}

function test_generate_html_with_multiple_class {
    local test_statement="Should genereate html with multiple class."
    local tag=li
    local class="colors rainbow"
    local content=red
    local expected_output="<li class=\"colors rainbow\">red</li>"

    local actual_output=`generate_html "${tag}" "${class}" "${content}"`

    assert_expectation "${actual_output}" "${expected_output}" "${test_statement}"
}

function test_generate_li {
    local test_statement="Should genereate li tag."
    local class="colors"
    local content=red
    local expected_output="<li class=\"colors\">red</li>"

    local actual_output=`generate_li "${class}" "${content}"`

    assert_expectation "${actual_output}" "${expected_output}" "${test_statement}"
}

function test_generate_anchor {
    local test_statement="Should genereate anchor with link."
    local link="www.colors.com"
    local content=red
    local expected_output="<a href=www.colors.com>red</a>"

    local actual_output=`generate_anchor "${link}" "${content}"`

    assert_expectation "${actual_output}" "${expected_output}" "${test_statement}"
}


function generate_html_test_cases {
    test_generate_html_without_class
    test_generate_html_with_class
    test_generate_html_with_multiple_class
    test_generate_li
    test_generate_anchor
}