#/bin/zsh

# Lista de Opções
# -------------------

op_competition="competition"


# Tratamento de Exceções
# --------------------------

# Verifica se há argumentos

# Verifica Tipo de Projeto
function list_options() {
    echo "Options for <type>:"
    echo " - $op_competition"
}

if [ -z "$1" ]; then 
    list_options
    exit
fi

# Verifica o Nome do projeto
if [ -z "$2" ]; then
    echo "Error: <name> is missing"
    exit
fi



# Funções Geradoras de Projetos
# ---------------------------------

# Projeto da Competição
function genCompetitionProject() {
    parent=$(pwd)
    name="$1"

    project_folder="$parent/$name"

    mkdir "$project_folder"

    touch "$project_folder/main.cpp"

    echo    "#include <bits/stdc++.h>"     >> "$project_folder/main.cpp"
    echo    "using namespace std;"         >> "$project_folder/main.cpp"
    echo    ""                             >> "$project_folder/main.cpp"
    echo    "int main() {"                 >> "$project_folder/main.cpp"
    echo    ""                             >> "$project_folder/main.cpp"
    echo -e "\treturn 0;"                  >> "$project_folder/main.cpp"
    echo    "}"                            >> "$project_folder/main.cpp"

    touch "$project_folder/makefile"

    echo    "compile:"                      >> "$project_folder/makefile"
    echo -e "\tg++ main.cpp -o Main"        >> "$project_folder/makefile"
    echo    "run:"                          >> "$project_folder/makefile"
    echo -e "\t./Main"                      >> "$project_folder/makefile"

}


# Criar projeto
# -----------------

function createNewProject() {
    project_type="$1"
    project_name="$2"

    case $project_type in
        "$op_competition") genCompetitionProject "$project_name";;
    esac
}

# Programa
# ------------

# Argumentos
project_type="$1"
project_name="$2"

# Cria o projeto
createNewProject "$project_type" "$project_name"
