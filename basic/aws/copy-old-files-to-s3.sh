#!/bin/bash
LOCATION=./../test-folder

list_old_files()
{
  old_files=`find $LOCATION -type f -mmin +360`
  list=($old_files)
  for i in "${list[@]}"
    do
      echo "File is: " $i
    done
}

copy_old_files() 
{
  
  NOW=$(date +"%m-%d-%Y")
  old_files=`find $LOCATION -type f -mmin +360`
  mkdir $NOW
  for i in "${list[@]}"
    do  
      cp $i ./$NOW/
    done
  tar -cvzf old_files.$NOW.tar.gz $NOW  
  rm -rf $NOW
}

list_old_files
copy_old_files

