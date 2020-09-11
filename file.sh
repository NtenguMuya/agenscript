#!/bin/bash
>etc_file
>etc_directory
for dir in $(ls -l /etc);

do

if [ -f /etc/${dir} ]; then 

echo "${dir}" >> etc_file

elif [ -d /etc/${dir} ];

 then 

 echo "${dir}" >> etc_directory
sleep 1
fi
done


