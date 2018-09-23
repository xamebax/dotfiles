#!/bin/bash

SOURCE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
echo "source: $SOURCE"
DESTINATION="/tmp/dot"

files_to_symlink=(\
"aliases" \
"atom/config.cson" \
"atom/init.coffee" \
"atom/keymap.cson" \
"atom/snippets.cson" \
"atom/styles.less" \
"bash_profile" \
"bashrc" \
"exports" \
"gitconfig"
)

mkdir -p $DESTINATION/.atom

# TODO: Move files to a backup in /tmp in case we make a mistake lol

for dotfile in "${files_to_symlink[@]}"
do
  if [ -f "${DESTINATION}/.${dotfile}" ]
    then
      echo "Removing original [.${dotfile}] file from ${DESTINATION}/"
      rm "${DESTINATION}/.${dotfile}"
  fi
  echo "Symlinking [${dotfile}]..."
  ln -s ${SOURCE}/${dotfile} "${DESTINATION}/.${dotfile}"
done
