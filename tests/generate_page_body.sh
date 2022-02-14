function test_generate_page_body () {
    local test_statement="Generate page body tag with required content"
    local records=`echo -e "1|bulbasaur|grass,poison|45|45|64|49|49|69"`
    local types=`echo -e "grass\npoison"`

    local expected_output='<body><nav class="sidebar"><ul><li><a href=grass.html>grass</a></li><li class="poison selected"><a href=poison.html>poison</a></li></ul></nav><main class="cards"><article class="pokemon-card"><figure class="pokemon-img"><img src="images/bulbasaur.png" alt="bulbasaur"></figure><section class="information"><header><h2>Bulbasaur</h2><div class="type"><div class="grass">Grass</div><div class="poison">Poison</div></div></header><table class="stats"><tbody><tr><th>Weight</th><td>69</td></tr><tr><th>HP</th><td>45</td></tr><tr><th>Base_XP</th><td>64</td></tr><tr><th>Attack</th><td>49</td></tr><tr><th>Defence</th><td>49</td></tr><tr><th>Speed</th><td>45</td></tr></tbody></table></section></article></main></body>'
   
    local actual_output=`generate_page_body "${records}" "${types}" "poison"`
    assert_expectation  "${actual_output}" "${expected_output}" "${test_statement}"
}