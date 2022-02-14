function generate_html {
    local tag=$1
    local class=$2
    local content=$3
    
    if [[ -n ${class} ]]
    then
        echo "<$tag class=\"${class}\">${content}</${tag}>"
        return
    fi

    echo "<$tag>${content}</${tag}>"
}

function generate_link () {
    echo \<link rel=\"stylesheet\" href=\"$1\"\>
}

function generate_anchor {
    local link=$1
    local content=$2
    
    echo "<a href=${link}>"${content}"</a>"
}

function generate_img () {
    local source=$1
    local alternative=$2

    echo "<img src=\"${source}\" alt=\"${alternative}\">"
}

function generate_title () {
    generate_html "title" "$1" "$2"
}

function generate_td {
    generate_html "td" "$1" "$2"
}

function generate_th {
    generate_html "th" "$1" "$2"
}

function generate_tr {
    generate_html "tr" "$1" "$2"
}

function generate_tbody {
    generate_html "tbody" "$1" "$2"
}

function generate_table {
    generate_html "table" "$1" "$2"
}

function generate_h2 {
    generate_html "h2" "$1" "$2"
}

function generate_header {
    generate_html "header" "$1" "$2"
}

function generate_section {
    generate_html "section" "$1" "$2"
}

function generate_figure {
    generate_html "figure" "$1" "$2"
}

function generate_article {
    generate_html "article" "$1" "$2"
}

function generate_li {
    generate_html "li" "$1" "$2"
}

function generate_ul {
    generate_html "ul" "$1" "$2"
}

function generate_div () {
    generate_html "div" "$1" "$2"    
}

function generate_nav () {
    generate_html "nav" "$1" "$2"
}

function generate_main () {
    generate_html "main" "$1" "$2"    
}

function generate_head () {
    generate_html "head" "$1" "$2"
}

function generate_body () {
    generate_html "body" "$1" "$2"
}

function get_field () {
    local records=$1
    local field_number=$2
    cut -d"|" -f${field_number} <<< "${records}"
}

function capitalize_first_letter {
    local word=$1
    local capitalized_type="`tr [:lower:] [:upper:] <<< "${word:0:1}"`"${word:1}""
    echo "${capitalized_type}"
}

function read_file (){
    local file=$1
    cat ${file}
}