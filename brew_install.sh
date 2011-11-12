exec < BREW_LIST
while read line
do
  brew install $line
done
