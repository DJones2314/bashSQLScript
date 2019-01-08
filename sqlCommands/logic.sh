#!/bin/bash

current=$(sqlite3 /home/adminwa/folder/test1.db "SELECT versionID FROM version")

ls ~/sqlCommands/ | grep .sql | egrep  ^[0-9]+ | tee fList.txt

file="/home/adminwa/sqlCommands/fList.txt"
new=$(cat fList.txt | egrep -o ^[0-9]+| tail -n 1)

if [ "$new" -gt "$current" ]
then
	echo "Game needs Patching"
	while IFS= read -r line 
	do
		echo "$line"
		echo "$current"
		number=$(echo "$line" | egrep -o ^[0-9])
		echo "$number"

		if [ "$number" -lt "$current" ]
		then
			sqlite3 /home/adminwa/folder/test1.db "UPDATE version SET versionID = $number WHERE versionID < $number"
			
		sqlite3 /home/adminwa/sqlCommands/babyNamer.db > /home/adminwa/sqlCommands/$line 

		fi
	done <"$file"
else 
	echo "Game is up-to-date"
fi
