# Polka

Development configuration for Luckie & Co. This is a very opinionated setup, strongly believing in mac osx, vim, ruby on rails, and the [solarized](http://ethanschoonover.com/solarized) color scheme.

##WARNING!##

If you are not comfortable with the idea that polka completely nukes and rebuilds your dotfiles, walk quickly away, and continue to live a normal, uninteresting life. If you are not afraid, this isn't your first rodeo, and you're ready for the best terminal experience of your life, read on…

Polka *will* nuke your current dotfiles, so first make sure to back up any macros, settings, and configurations you want to keep.

###To install:###

1. Clone the project, preferably to a folder in your home directory entitled ~/Projects/. (I'm not sure, the project used to depend on that folder name, need to decouple.)

2. Run ./install.sh. This will do a lot of magic very quickly, so here are the important bits:
    - It's going to create new .bashrc, .bash_profile, and .vimrc files (among others), as well as a new .vim folder and a ~/bin folder. The files will all actually live in your ~/Projects/polka folder, and be symlinked to their proper places. This way you can keep them tied to the git repo, and update them with a simple git pull.
    - BASH: If you check out your .bashrc, you're going to see something very different from what you are used to. Do not panic, it's the beginning of a bright new world for you. All your configurations, aliases, macros, and rvm loads now live in a bright and shiny new .bashrc.d folder. Each file is executable, linked back to the one in polka, and is numbered in order of execution. Feel free to add new files for your custom bindings, but leave the polka ones alone unless you intend to fork and you know what you are doing.
    - VIM: Luckie believes strongly in pathogen, and in using vim as opposed to mvim, but feel free to modify and change at your leisure. If you aren't familiar with pathogen, take a look at your .vim folder. Instead of the usual menagerie, you are going to see a bundles folder, containing all the plugins we think are awesome. If you want to add your favorites to the list, modify the ~/bin/vim-bundle file with a new line, where the two arguments are the username and name of a git repository containing the plugin. Then run vim-bundle, and you are done. All your plugins will be updated and kept happy and safe. Read [tpope's documentation](https://github.com/tpope/vim-pathogen) for more details.
    - BREW: we rely on brew for updating, and especially for a couple of crucial updates. For most of the program we use, just run ./brew_install.sh to run through the list. You should also make sure you update Bash to version 4.2 (this [guide here](http://od-eon.com/blogs/stefan/upgrading-bash-os-x/) is excellent) as well as follow [this guide](http://blog.jerodsanto.net/2011/08/brew-install-vim/) for the latest version of vim with ruby support.

### Dependencies

* OSX 10.6
* Homebrew
* Git
* Bash ~> 4.2

## Setup Guides

* [Vim](http://blog.jerodsanto.net/2011/08/brew-install-vim/)
* [Bash 4.*](http://od-eon.com/blogs/stefan/upgrading-bash-os-x/)
* [Pathogen](https://github.com/tpope/vim-pathogen)

## TODO (if you want to contribute)
* I'd really like to see a fork without all the mac specific features, for all *nix users.
* More detailed (read professional) documentation on the bash rebuild magic.
