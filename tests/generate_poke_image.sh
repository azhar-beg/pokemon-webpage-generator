function test_generate_poke_image {
    local test_statement="Should generate pokemon image tag within figure tag"
    local expected_output='<figure class="pokemon-img"><img src="images/bulbasaur.png" alt="bulbasaur"></figure>'

    local actual_output=`generate_poke_image "bulbasaur"`

    assert_expectation "${actual_output}" "${expected_output}" "${test_statement}"
}