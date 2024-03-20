#!/bin/bash

DeletesFolderZip()
{
    # echo "FUNCTION DeletesFolderZip"
    #careful bro barusan kedelete semua goblog

    for folder in folder_*; do
        # echo "FOLDER: $folder"
        if [[ -d "$folder" ]]; then
            rm -r "$folder"/*
            rmdir "$folder"
        fi
    done
    for ayang in ayang_*; do
        # echo "AYANG: $ayang"
        if [[ -f "$ayang" && "${ayang##*.}" == "zip" ]]; then
            rm "$ayang"
        fi
    done

}

DeletesFolderZip