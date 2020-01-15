#! /bin/sh

# This util script invokes each of the install-* scripts, passing the default args.
# This script will fail if the given dir does not contain each of the required lists.

if [ -z $1 ] ; then
  echo "No directory given. The directory that contains the lists should be provided."
  exit 1
fi

../install-snaps.sh $1/snaps.list
../install-packages.sh $1/apt-ppas.list $1/apt-packages.list
../install-appimages.sh $1/appimages.list

# should add a way to run each manual installer too


