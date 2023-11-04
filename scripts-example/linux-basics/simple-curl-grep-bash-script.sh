#! /bin/bash

if [ $# != 1 ]; then 
  echo "Usage: $0 text_that_you_are_looking_for"
  exit 1
fi

# $1 is the first commandline argument
if [ "$1" == "" ]; then
	echo "Error: the parameter passed in is empty!"
	exit 1
fi

GREP_PATTERN=$1

