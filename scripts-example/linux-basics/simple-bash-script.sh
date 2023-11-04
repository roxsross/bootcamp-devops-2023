#! /bin/bash

DIR="./foo/"
if [ -d "$DIR" ]; then
	  # Take action if $DIR exists
	    rm -r ${DIR}
fi

TEXT='Que me gusta la bash!!!!'

# $1 is the first commandline argument
if [ $# -gt 1 ]; then
  echo "Error: the number of passed parameters is greater than one!"
  exit 1
fi

if [[ $# == 1 && "$1" != '' ]]; then
	   # Variables must be double quoted to be expanded when comparing strings
	   # Take action if "$1" is not empty
	   TEXT=$1
fi

# commands from exercise 1 & 2
mkdir -p foo/dummy foo/empty
cd foo/dummy
echo $TEXT > file1.txt
touch file2.txt
echo "$(cat file1.txt)" > file2.txt
mv file2.txt ../empty/
cat file1.txt
cat ../empty/file2.txt