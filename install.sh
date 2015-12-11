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

# Link config directory
[ -d "${HOME}/.config" ] || mkdir "${HOME}/.config"
for dotfile in ${DIR}/.config/*; do
    ln -fs $dotfile "${HOME}/.config/$(basename $dotfile)"
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

[ -d "${HOME}/.config/nvim/bundle" ] || mkdir -p "${HOME}/.config/nvim/bundle"
[ -d "${HOME}/.config/nvim/backups" ] || mkdir -p "${HOME}/.config/nvim/backups"
[ -d "${HOME}/.config/nvim/swaps" ]   || mkdir -p "${HOME}/.config/nvim/swaps"
[ -d "${HOME}/.config/nvim/undo" ]    || mkdir -p "${HOME}/.config/nvim/undo"

# Preload vim-plug
[ -d "${HOME}/.config/nvim/autoload" ] || mkdir -p "${HOME}/.config/nvim/autoload"
echo "Loading Plug.vim for NeoVim..."
[ -d "${HOME}/.vim/autoload/plug.vim" ] || curl -fLo "${HOME}/.config/nvim/autoload/plug.vim" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Remove broken symlinks
find -L "${HOME}" "${HOME}/.bashrc.d" "${HOME}/bin" "${HOME}/lib" -maxdepth 1 -type l | xargs rm 2>/dev/null

# execute scripts on install
(exec "${DIR}/bin/setup-gitconfig")
