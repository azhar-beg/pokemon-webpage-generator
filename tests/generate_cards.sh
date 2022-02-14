#! /bin/bash

function test_generate_cards () {
    local test_statement="Should generate multiple cards"
    local records=`echo -e "1|bulbasaur|grass,poison|45|45|64|49|49|69\n2|ivysaur|grass|45|45|64|49|49|69"`
    
    local expected_output='<article class="pokemon-card"><figure class="pokemon-img"><img src="images/bulbasaur.png" alt="bulbasaur"></figure><section class="information"><header><h2>Bulbasaur</h2><div class="type"><div class="grass">Grass</div><div class="poison">Poison</div></div></header><table class="stats"><tbody><tr><th>Weight</th><td>69</td></tr><tr><th>HP</th><td>45</td></tr><tr><th>Base_XP</th><td>64</td></tr><tr><th>Attack</th><td>49</td></tr><tr><th>Defence</th><td>49</td></tr><tr><th>Speed</th><td>45</td></tr></tbody></table></section></article><article class="pokemon-card"><figure class="pokemon-img"><img src="images/ivysaur.png" alt="ivysaur"></figure><section class="information"><header><h2>Ivysaur</h2><div class="type"><div class="grass">Grass</div></div></header><table class="stats"><tbody><tr><th>Weight</th><td>69</td></tr><tr><th>HP</th><td>45</td></tr><tr><th>Base_XP</th><td>64</td></tr><tr><th>Attack</th><td>49</td></tr><tr><th>Defence</th><td>49</td></tr><tr><th>Speed</th><td>45</td></tr></tbody></table></section></article>'

    local actual_output=`generate_cards "${records}"`
    assert_expectation "${actual_output}" "${expected_output}" "${test_statement}"
}