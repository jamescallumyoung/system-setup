#! /bin/sh

# This script will install all the snaps in the given .list file

# The .list file should be a list of snaps

if [ -z $1 ] ; then
  echo "No file given for the snap list. exiting."
  exit 1
fi

echo "Adding $(./get-lines.sh $1 | wc -w) snaps..."
./get-lines.sh $1 | xargs -n 1 -I '{}' sudo snap install '{}'

echo "\nsnaps added!"
