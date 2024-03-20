#!/bin/bash
#I just upload a photo to my repo and somehow this is how i can access it
url="https://raw.githubusercontent.com/rajariandhana/sisop24/main/mingw.jpeg"

#Deletes all folder with folder_ prefix
ResetFolder()
{
    # echo "FUNCTION ResetFolder"
    for folder in folder_*; do
        for file in "$folder"/*; do
            rm "$file"
        done
        rmdir "$folder"
    done
}

#Find the last number on a folder name to be used as the new folder
FindFolderName()
{
    # echo "FUNCTION FindFolderName"
    lastNum=0
    for folder in folder_*; do
        cur=${folder#*_}
        if [[ $cur =~ ^[0-9]+$ ]]; then
            lastNum=$cur
        fi
    done
    ((lastNum++))
    mkdir "folder_$lastNum"
    #kayaknya harus ngikutin nama ayang juga deh
    echo "folder_$lastNum"
}

Donlod()
{
    # echo "FUNCTION Donlod"
    folderName=$(FindFolderName)
    for ((i=1; i<="$1"; i++)); do
        echo "DOWNLOADING $i"
        # url="example.com/fileName"
        fileName="foto_$i.jpeg"
        curl -o "./$folderName/$fileName" "$url"
        # if [ $? -eq 0 ]; then

        # fi
    done
}

NolNol()
{
    # echo "FUNCTION NolNol"
    Donlod 10
}

EvenOdd()
{
    # echo "FUNCTION EvenOdd"
    cur_hour=$(date +%H)
    cur_minute=$(date +%M)
    # if [ $cur_hour -eq 0 ]; then
    #     return
    if [ $((cur_hour%2)) -eq 0 ]; then
        Donlod 5
    else
        Donlod 3
    fi
}

if [ "$1" == "ResetFolder" ]; then
    ResetFolder
elif [ "$1" == "NolNol" ]; then
    NolNol
elif [ "$1" == "EvenOdd" ]; then
    EvenOdd
fi
# EvenOdd
# ResetFolder
# Donlod 3
# "$1" "$2"