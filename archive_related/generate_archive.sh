#!/bin/sh

FIND_PATH="/xxx"
export FIND_PATH

FILE_LIST=$FIND_PATH/archive.list
export FILE_LIST

DAYS="50"
export DAYS

function generate_archive_list(){
	PATH_LEN=`echo ${#FIND_PATH}`
	REMOVE_LEN=`expr $PATH_LEN + 2`

	if  [[ -f $FILE_LIST ]]; then
		echo "error"
		exit 1
	else
		find $FIND_PATH -ctime +$DAYS -type f |xargs ls -l|awk '{ print $9 }'|cut -c $REMOVE_LEN- >> $FILE_LIST
	fi
}

generate_archive_list