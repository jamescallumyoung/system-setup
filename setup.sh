#! /bin/sh

# This script just provides a switch that invokes the given platform's installer

case $1 in
  "--help")
    echo "cat the setup file to see what it can do. real help docs coming later."
    ;;
  "install")
    case $2 in
      "elementaryOS")
        echo "Now trying the elementaryOS setup..."
        cd ./platforms/elementaryOS
        make install
	;;
      "macOS")
        echo "Now trying the macOS setup..."
	cd ./platforms/macOS
	. install-brew
	brew bundle
        ;;
      *)
        echo "Invalid or missing platform name.\nName must be one of:\n - macOS\n - elementaryOS"
        ;;
    esac
    ;;
  *)
    echo "Invalid or missing command.\nCommand must be one of:\n - install"
    ;;
esac
