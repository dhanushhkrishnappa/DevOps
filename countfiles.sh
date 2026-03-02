#!/bin/bash
countfiles(){
    local dir="$1"
    local count=0
    for item in "$dir"/*
    do
        if [ -f "$item" ]; then
            count=$((count + 1))
        elif [ -d "$item" ]; then
            subcount=$(countfiles "$item")
            count=$((count + subcount))
        fi
    done
    echo "$count"
}

echo "enter current path"
read directory

if [ -d "$directory" ]; then 
    total=$(countfiles "$directory")
    echo "Total files in $directory in sub-directory is $total"
else
    echo "Invalid directory"
fi
