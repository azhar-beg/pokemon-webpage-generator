function test_create_pokemon_header {
    local test_statement="Should generate header tag with title and types"
    local expected_output='<header><h2>Bulbasaur</h2><div class="type"><div class=poison>Poison</div><div class=grass>Grass</div></div></header>'

    local actual_output=`create_pokemon_header "Bulbasaur" "<div class="poison">Poison</div><div class="grass">Grass</div>"`

    assert_expectation "${actual_output}" "${expected_output}" "${test_statement}"
}