Dot-Files
=========

My collection of various shell scripts and dot files that should be
modular enough for others to extend with their own scripts.  This
is heavily biased toward bash.


Installation
------------

    ./install.sh

This will create a `~/bin` and `~/etc` directory if they do not currently
exist.  Then all corresponding files within the project bin and etc
directories will be linked if possible.

Note, this will link to files in the project so you'll want to keep the
project hanging around.  Consider cloning to something like ~/.dotfiles.

Also, the installation script is careful not to overwrite any existing
files or directories and it should be safe enough to run multiple times.


Customization
------------

All `*.sh` files within `~/etc/profile.d` and `~/etc/aliases.d`
directories will be sourced into the ~/.bashrc.


### Host-Specific Customization

A file matching ~/etc/hosts.d/`hostname -s`.sh will be sourced into the
.bashrc as well.  This will be sourced in after everything else so you can
override anything you want from there.


Furthermore
-----------

I hope that others find this useful enough to utilize themselves.  I'll be
adding updates so please watch!

I'm in no way a shell-guru.  If you have any suggestions or corrections,
just let me know!
