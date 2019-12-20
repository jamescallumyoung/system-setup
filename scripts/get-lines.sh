#! /bin/sh

if [ -z "$1" ]
  then
    echo "No argument supplied..."
    exit 1
fi

awk '!/^ *#/ && NF' "$1"
