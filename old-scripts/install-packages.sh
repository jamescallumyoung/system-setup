#! /bin/sh

# This script will install all the apt packages in the given .list file

# The script accepts two arguments; the first, a .list file, should be a list of ppas
#  whilst the second, another .list, should be a list of package names

if [ -z $1 ] ; then
  echo "No file given for the ppas. exiting."
  exit 1
fi

if [ -z $2 ] ; then
  echo "No file given for the packages. exiting."
  exit 2
fi

# pt 1 ; ppas

echo "Adding $(./get-lines.sh $1 | wc -w) ppas..."
./get-lines.sh $1 | xargs -n 1 -I '{}' sudo add-apt-repository '{}'

echo "ppas added!"

# pt 2 ; update package list

sudo apt update

# pt 3 ; packages

echo "Adding $(./get-lines.sh $2 | wc -w) packages..."
./get-lines.sh $2 | xargs -n 1 -I '{}' sudo apt install '{}' -y

echo "packages added!"

