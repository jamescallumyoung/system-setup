# system-setup
*Instructions, scripts, etc., to set up a new system.*

Install scripts and package lists to set up a new system with our regular tooling.

What this project does:

- Installs/updates packages (from package managers or custom scripts)
- Adds new package managers where needed(e.g. homebrew, or snap)

What this project doesn't do:

- Doesn't touch dotfiles
- Doesn't keep packages up-to-date

Installs should^ be indempotent (although they can still take ages).

## How to use

`cd` to the directory for your platform (under platforms/) and check the README.md there.

Each platform has slightly different instructions as the installation will leverage the
platform's package manager and these have varying functionality.

In general, we use `make` to install the packages so this may need to be manually installed
in advance. (Although, `make` is already installed on most platforms.)

