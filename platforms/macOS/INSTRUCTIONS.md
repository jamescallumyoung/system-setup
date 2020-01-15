# 

Set up a new macOS system, just how I like it :)


## Install Homebrew
*The missing package manager for macOS (or Linux)*

We use [homebrew](https://brew.sh), to download and manage packages on the mac. Since this isn't already installed, we need to install it with:

```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

**Don't use sudo**

The install script should explain what it's doing, then pause to let you confirm it. There's no need to change any of the settings; we like the defaults.

We can test it installed correctly with `brew -v`.


## Install packages

Once we have homebrew installed, we can install our usual packages with brewfiles (like a package.json for brew).

### Packages Brewfile

First, install the packages brewfile *mac.brewfile*.

This includes common GNU/Linux packages, replacement for the outdated packages macOS ships with, and our own prefered packages (like pass!).

Install the packages brewfile with:

```
brew bundle --file=mac.brewfile
```

#### Alias GNU Packages

Lots of the packages we just installed are GNU packages that will be prefixed with a "g" since macOS
already ships with those packages (and we can't overwrite them any more). Our dotfiles automatically
alias the prefixed versions but we'll want to do it manually if not using them.

### Apps Brewfile (optional)

Next, install the apps brewfile *mac-apps.brewfile*.

This includes common apps we want on most systems, like Firefox and Insomnia.

We can skip this and install these from their respecive sites too, if we like. 

Install the apps brewfile with:

```
brew bundle --file=mac-apps.brewfile
```


## Generate a new ssh key

We use a unique ssh key per device. This is used to access things like git (on both gitlab and github).

Generate a key with: 

```
ssh-keygen
```

Save the key in a file like *device-name_rsa* rather than the default *id_rsa*.

When prompted for a password, enter one that's easily memorised (like the device's lockscreen password) since we'll have to enter it manually from time to time.

*See: https://www.ssh.com/ssh/keygen/ for a good guide if needed.*

### Upload the new key to gitlab

Log into gitlab on another device (where we have the password stored) and use the Yubikey for 2fa.

Once logged in, go to *https://gitlab.com/profile/keys* and upload the public part fo our new ssh key. (*device-name_rsa.pub*, not *device-name_rsa*!)


## Set up our dotfiles

We use chezmoi for dotfile management. This allows us to create templates for custom dotfiles for each manchine. This is great since it lets us keep secrets off machines that don't need it, and also gets rid of any *if-else-fi* logic in the dotfiles themselves.

We installed chezmoi in the "Install Packages" step earlier.

### Fetch our dotfiles

Simply run:

```
chezmoi init git@gitlab.com:jych/dotfiles.git
```

This will download our dotfiles repo from gitlab to *~/.local/share/chezmoi*.

### Apply the dotfiles

Simply run:

```
chezmoi apply
```

This will generate the dotfiles from the chezmoi templates, and place them in the correct locations in the system. File ownership and permissions should be handled automatically.


## Set zsh as the default shell

To make sure macOS uses zsh as the login shell (the default shell to use in every teminal), do the following:

[Apple Icon] > System Preferences > Users & Groups > *right click the user icon* > Advanced Options > *set Login shell to /bin/zsh*.

