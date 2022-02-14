#! /bin/bash

function test_generate_sidebar () {
    test_statement="Generate sidebar for given types."
    types=`echo -e "grass\npoison"`
    expected_output='<ul><li><a href=grass.html>grass</a></li><li class="poison selected"><a href=poison.html>poison</a></li></ul>'
    actual_output=`generate_sidebar "${types}" "poison"`

    assert_expectation  "${actual_output}" "${expected_output}" "${test_statement}"
}