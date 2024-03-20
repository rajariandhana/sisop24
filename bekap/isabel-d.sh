#!/bin/bash
#I just upload a photo to my repo and somehow this is how i can access it
url_levi="https://raw.githubusercontent.com/rajariandhana/sisop24/main/sasageyo.jpeg"
url_eren="https://raw.githubusercontent.com/rajariandhana/sisop24/main/freedom.jpeg"

Donlod()
{
    # echo "DOWNLOADING $i"
    yy=$(date +%Y)
    mm=$(date +%m)
    dd=$(date +%d)
    
    read -r siapa < siapa.txt
    if [[ "$siapa" == "levi" ]]; then
        fileName="levi_$yy$mm$dd.jpeg"
        curl -o "./$folderName/$fileName" "$url_levi"
        echo "eren" > siapa.txt
    elif [[ "$siapa" == "eren" ]]; then
        fileName="eren_$yy$mm$dd.jpeg"
        curl -o "./$folderName/$fileName" "$url_eren"
        echo "levi" > siapa.txt
    fi
    echo "$fileName"
}

Donlod