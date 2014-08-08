#!/bin/bash
# -polka-

# Get the current directory
DIR="$( cd "$(dirname "$0" )" && pwd )"

# Link dot files to $HOME
for dotfile in $(find $DIR -maxdepth 1 -type f -name ".*"); do
  if [[ $(uname) == 'Linux' && "$(basename $dotfile)" == '.tmux.linux.conf' ]]; then
    ln -fs $dotfile "${HOME}/.tmux.conf"
  elif [[ $(uname) == 'Darwin' && "$(basename $dotfile)" == '.tmux.osx.conf' ]]; then
    ln -fs $dotfile "${HOME}/.tmux.conf"
  elif [[ "$(basename $dotfile)" != ".tmux.osx.conf" && "$(basename $dotfile)" != ".tmux.linux.conf" ]]; then
    ln -fs $dotfile "${HOME}/$(basename $dotfile)"
  fi
done

# Link rc files in .bashrc.d
[ -d "${HOME}/.bashrc.d" ] || mkdir "${HOME}/.bashrc.d"
for dotfile in ${DIR}/.bashrc.d/*; do
    ln -fs $dotfile "${HOME}/.bashrc.d/$(basename $dotfile)"
done

# Link files in bin
[ -d "${HOME}/bin" ] || mkdir "${HOME}/bin"
for file in ${DIR}/bin/*; do
    [ -x $file ] || continue
    [[ $(uname) == 'Linux' && $(basename $file) == 'reattach-to-user-namespace' ]] && continue
    ln -fs $file "${HOME}/bin/$(basename $file)"
done

# Link files in lib
[ -d "${HOME}/lib" ] || mkdir "${HOME}/lib"
for file in ${DIR}/lib/*; do
    [ -x $file ] || continue
    ln -fs $file "${HOME}/lib/$(basename $file)"
done

[ -d "${HOME}/.vim/bundle" ] || mkdir -p "${HOME}/.vim/bundle"
[ -d "${HOME}/.vim/backups" ] || mkdir -p "${HOME}/.vim/backups"
[ -d "${HOME}/.vim/swaps" ]   || mkdir -p "${HOME}/.vim/swaps"
[ -d "${HOME}/.vim/undo" ]    || mkdir -p "${HOME}/.vim/undo"

# Preload vim-plug
[ -d "${HOME}/.vim/bundle/neobundle.vim" ] || git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
[ -d "${HOME}/.vim/autoload" ] || mkdir -p "${HOME}/.vim/autoload"
[ -d "${HOME}/.vim/autoload/plug.vim" ] || curl -fLo "${HOME}/.vim/autoload/plug.vim" \ https://raw.github.com/junegunn/vim-plug/master/plug.vim

# Remove broken symlinks
find -L "${HOME}" "${HOME}/.bashrc.d" "${HOME}/bin" "${HOME}/lib" -maxdepth 1 -type l | xargs rm 2>/dev/null

# execute scripts on install
(exec "${DIR}/bin/setup-gitconfig")
