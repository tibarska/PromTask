#!/bin/bash

directory_path=$1
directory=$(basename $directory_path)
ftype=.$2
dir_name=$3
archive_name=$4
all_dirs=$(find $directory -name "*$ftype")
mkdir $dir_name
cp --parent $all_dirs $dir_name/ >/dev/null 2>/dev/null
tar -cf $archive_name $dir_name >/dev/null 2>/dev/null
echo "done"