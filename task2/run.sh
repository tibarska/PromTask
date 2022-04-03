#!/bin/bash
directory_path=$1 #~/Tatiana/bash_ex/test_dir2
ftype=.$2 #cpp
dir_name=$3 #my
archive_name=$4 #my_arch.tar.gz
directory=$(basename $directory_path)

find_file=$(find $directory_path -name "*$ftype" 2>/dev/null)
if [ -z "$find_file" ]
then 
    mkdir $dir_name
else
    subdirs=$(find $directory_path -name "*$ftype" 2>/dev/null|sed -r 's|/[^/]+$||' |sort -u| sed 's/.*\($directory\)/\1/g')
    
    for sub in $subdirs
    do
        subdir_path=$directory"${sub#*/$directory}" # $("$directory${sub#*/$directory}")
        mkdir -p $dir_name/$subdir_path
        cp $(find $sub -maxdepth 1 -type f -name "*$ftype") $dir_name/$subdir_path
        
    done
fi
tar -cf $archive_name $dir_name # >/dev/null 2>/dev/null
echo "done"
