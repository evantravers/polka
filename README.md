# ⛔️ Deprecated: Polka

The maintainers of this project have moved on to other methods. Some are using [stow](https://www.gnu.org/software/stow/).

---

Development configuration for the fishbowl. This is a opinionated setup, strongly believing in linux, vim, and utilizes the [base16](https://github.com/chriskempson/base16) color scheme.

It's to be considered as a really quick setup script to help you manage your dotfiles easily. You can fork the repo, modify the setup, add your own dotfiles.

##WARNING!##

If you are not comfortable with the idea that polka completely nukes and rebuilds your dotfiles, walk quickly away, and continue to live a normal, uninteresting life. If you are not afraid, this isn't your first rodeo, and you're ready for the best terminal experience of your life, read on…

Polka *will* nuke your current dotfiles, so first make sure to back up any macros, settings, and configurations you want to keep.

###To install:###

1. Clone the project, preferably to a folder in your home directory entitled ~/projects/.

2. Run ./install.sh. This will do a lot of magic very quickly, so here are the important bits:
    - It's going to create new .bashrc, .bash_profile, and .vimrc files (among others), as well as a new .vim folder and a ~/bin folder. The files will all actually live in your polka folder, and be symlinked to their proper places. This way you can keep them tied to the git repo, and update them with a simple git pull.
    - BASH: If you check out your .bashrc, you're going to see something very different from what you are used to. Do not panic, it's the beginning of a bright new world for you. All your configurations, aliases, macros, and ruby loads now live in a bright and shiny new .bashrc.d folder. Each file is executable, linked back to the one in polka, and is numbered in order of execution. Feel free to add new files for your custom bindings, but leave the polka ones alone unless you intend to fork and you know what you are doing.
    - VIM: The fishbowl believes strongly in using vim as opposed to mvim, but feel free to modify and change at your leisure. If you aren't familiar with neobundle, take a look at your .vim folder. Instead of the usual menagerie, you are going to see a bundle folder, containing all the plugins we think are awesome. If you want to add your favorites to the list, fork the repo and add NeoBundle lines to it just like the ones in .vimrc, and you are done. All your plugins will be updated and kept happy and safe. Read [shougo's documentation](https://github.com/Shougo/neobundle.vim) for more details.
    - BREW: we rely on brew for updating, and especially for a couple of crucial updates. For most of the programs we use, just run ./brew_install.sh to run through the list. You should also ruby sure you update Bash to version 4.2 (this [guide here](http://od-eon.com/blogs/stefan/upgrading-bash-os-x/) is excellent) as well as follow [this guide](http://blog.jerodsanto.net/2011/08/brew-install-vim/) for the latest version of vim with ruby support.

### Dependencies

* OSX 10.6 (sort of, it's pretty linux compatible)
* Homebrew (also not required, but we use it.)
  Formulas we recommend:

- bash
- reattach-to-user-namespace (for tmux)
- ack
- bash-completion
- nethack

* Git
* Bash ~> 4.2

## Setup Guides

* [Bash 4.*](http://stackoverflow.com/a/11704224)
* [Pathogen](https://github.com/tpope/vim-pathogen)

## TODO
* Start versioning polka.
* Add comment to the top of every file to identify what version of polka it orginates from.
* Add uninstall script that safely removes polka.
* Package polka into a subdirectory named `.polka` in your home directory.
* Document how to setup external dependencies.
* Remove links to external resources.
* Add update script.
