# Install applications on a new system
#	Uses apt and snap, and also includes some custom installs
# 
# Usage:
#	Ensure readlist is in the path and then do either:
#	`make <command>` or `make <command> -C path/to/list/files`
# 
# Commands:
# (basic)
#	list:			list packages and snaps to be installed
#	install:		install packages and snaps
# (advanced)
#	install-packages:	install packages (after adding the PPAs)
#	install-snaps:		install snaps*
# 
# Notes:
#	*: To install snaps, snapd must be installed with apt first.
#		This is usually not an issue since `install` installs
#		snapd before the `install-snaps` step.

# List files for each install type
PPAFILE := apt-ppas.list
APTFILE := apt-packages.list
SNAPFILE := snaps.list
SNAPCLASSICFILE := snaps-classic.list

# Default target:
none:
	@echo "Usage: You need to choose a command!"

# Basic targets:
list:
	@tput setaf 2;echo "APT PACKAGES:"; tput sgr0
	@readlist ${APTFILE}
	@tput setaf 2;echo "SNAPS:"; tput sgr0
	@readlist ${SNAPFILE}
	@readlist ${SNAPCLASSICFILE}

install: install-packages install-snaps

# Advanced targets:
install-packages: pt-prepare-apt pt-install-ppas pt-install-apts

install-snaps: pt-install-regular-snaps pt-install-classic-snaps

# The following should not be run directly
# (they are part of other targets)

pt-prepare-apt:
	@sudo apt-get update && sudo apt-get upgrade -y

pt-install-ppas:
	@echo "Adding PPAs..."
	@readlist ${PPAFILE} | xargs -n 1 -I '{}' sudo add-apt-repository '{}'
	@echo "...done!"

pt-install-apts:
	@echo "Adding packages..."
	@readlist ${APTFILE} | xargs -n 1 -I '{}' sudo apt install -qq -y '{}'
	@echo "...done!"

pt-install-regular-snaps:
	@echo "Adding snaps..."
	@readlist ${SNAPFILE} | xargs -n 1 -I '{}' sudo snap install '{}'
	@echo "...done!"

pt-install-classic-snaps:
	@echo "Adding snaps..."
	@readlist ${SNAPCLASSICFILE} | xargs -n 1 -I '{}' sudo snap install '{}' --classic
	@echo "...done!"

