#!/bin/bash

#sqlite3 test1.db 
#sqlite3 .mode csv
#sqlite3 .output testy1.csv
#sqlite3 select * from version;
#sqlite3 .output stdout
#sqlite3 .exit

version=$(sqlite3 /home/spider/Documents/exercise1/test1.db "SELECT * FROM version")

echo "$version"

ls /home/spider/Documents/exercise1/[0-9]*[!0-9]*.sql | egrep -o [0-9]+ | sort -n | tee list.txt
file="/home/spider/Documents/exercise1/list.txt"

new=$(cat list.txt | tail -n 1)

if [ "$new" -gt "$version" ]
then
    echo "result was larger"
    #looper = 1;
    #latest=$(cat list.txt)
    while IFS= read -r line 
    do
        echo "$line"
        if [ "$line" -gt "$version" ]
        then
            sqlite3 /home/spider/Documents/exercise1/test1.db "UPDATE version SET versionID = $line WHERE versionID < $line"
    
        fi
    done <"$file"
fi
