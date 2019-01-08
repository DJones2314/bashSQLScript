#!/bin/bash

sqlite3 /home/adminwa/sqlCommands/ba

ls ~/sqlCommands/ | grep .sql | egrep -o ^[0-9]+ | sort -n | tee list.txt

current=$(sqlite3 /home/adminwa/sqlCommands/babyNamer.db "SELECT versionID FROM version")

for i in list.txt
