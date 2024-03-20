#!/bin/bash

# format ngezip is like dis
# zip -r targetName.zip targetFolder
# -r is to recursively add all files init
# zip -r "nama.zip" "namaDirAtauFile.extensi"

ZipsFolder()
{
    # echo "FUNCTION ZipsFolder"
    for folder in folder_*; do
        # echo "FOLDER: $folder"
        if [[ -d "$folder" ]]; then
            curNum=${folder#*_}
            echo "$curNum"
            zip -r "ayang_$curNum.zip" "./$folder"
        fi
    done
}

ZipsFolder