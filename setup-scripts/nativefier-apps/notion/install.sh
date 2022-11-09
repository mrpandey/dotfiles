#!/bin/sh

this_script_dir=$( dirname -- "$0"; )
installation_dir=~/.local/share
icon_dir=~/.icons/hicolor/48x48/apps
desktop_entry_dir=~/.local/share/applications

# check if nativefier is installed
if ! nativefier --version >/dev/null 2>&1
then
	echo "Nativefier not found. Exiting."
	exit
fi

# nativefier will remove the directory notion-linux-x64 if it already exists
nativefier --name notion --icon $this_script_dir/notion.png --background-color '#000000' --browserwindow-options '{ "webPreferences": { "spellcheck": false } }' https://www.notion.so/login $installation_dir
rm -rf $installation_dir/notion
mv $installation_dir/notion-linux-x64 $installation_dir/notion

# copy desktop entry and icon
mkdir -p $icon_dir $desktop_entry_dir
cp $this_script_dir/notion.png $icon_dir/
cp $this_script_dir/notion.desktop $desktop_entry_dir/
