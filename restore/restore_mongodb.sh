#!/bin/bash
RED='\033[0;31m'
Black='\033[0;30m'
Dark_Gray='\033[1;30m'
Light_Red='\033[1;31m'
Green='\033[0;32m'
Light_Green='\033[1;32m'
Brown_Orange='\033[0;33m'
Yellow='\033[1;33m'
Blue='\033[0;34m'
Light_Blue='\033[1;34m'
Purple='\033[0;35m'
Light_Purple='\033[1;35m'
Cyan='\033[0;36m'
Light_Cyan='\033[1;36m'
Light_Gray='\033[0;37m'
White='\033[1;37m'
NC='\033[0m' # No Color
DIR="/opt/mongobackups/"
valid=true

function INFORMAR_DATA_BASE() {
    while [ $valid ]
    do
        echo -e "${Light_Blue}Infome o nome do banco de dados:${NC}"
        read dataBaseName
        if [[ -z "$dataBaseName" ]]
        then
            echo -e "${RED}Você não informou o nome do banco de dados!"
        else
            break
        fi
    done
}

function INFORMAR_DATA() {
    while [ $valid ]
    do
        echo -e "${Light_Blue}Infome a data de restauração (YY-MM-DD):${NC}"
        read dataBaseDate
        if [[ -z "$dataBaseDate" ]]
        then
            echo -e "${RED}Você não informou a data de restauração!"
        else
            break
        fi
    done
}

function VERIFICAR_DIRETORIO () {
    echo "Verificando diretório $1..."
    if [ -d $1 ]
    then
        echo "${YELLOW}Diretório $1 existe.${NC}"
    else
        echo -e "${RED}Diretório $1 não existe.${NC}"
        exit 1
    fi
}

function RESTAURAR() {
    mongorestore --gzip --db $1 --drop --verbose --stopOnError "${DIR}$2/$1/"
    echo -e "${Green}Restauração com sucesso!: ${DIR}$2/$1${NC}"
}

if [ "$#" -eq 1 ]; then
    echo -e "${RED}É necessário informar 2 parâmetros: o nome do banco de dados e a data de restauração (YY-MM-DD)${NC}"
    exit 1
fi

if [ "$#" -eq 2 ]; then
    echo "Total de argumentos: $#"
    echo "1st Argument = $1"
    echo "2st Argument = $2"
    VERIFICAR_DIRETORIO "${DIR}$2/$1/";
    RESTAURAR $1 $2
else
    INFORMAR_DATA_BASE;
    INFORMAR_DATA;
    VERIFICAR_DIRETORIO "${DIR}${dataBaseDate}/${dataBaseName}/";
    RESTAURAR ${dataBaseName} ${dataBaseDate}
fi

