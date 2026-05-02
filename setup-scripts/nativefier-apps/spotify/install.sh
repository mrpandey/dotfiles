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

# nativefier will remove the directory spotify-linux-x64 if it already exists
nativefier --name spotify --icon $this_script_dir/spotify.png --background-color '#000000' https://open.spotify.com $installation_dir --widevine --inject $this_script_dir/spotify.js --inject $this_script_dir/spotify.css --user-agent firefox

# castLabs EVS Signing
pip3 install --upgrade castlabs-evs
python3 -m castlabs_evs.account reauth
python3 -m castlabs_evs.vmp sign-pkg $installation_dir/spotify-linux-x64

rm -rf $installation_dir/spotify
mv $installation_dir/spotify-linux-x64 $installation_dir/spotify

# copy desktop entry and icon
mkdir -p $icon_dir $desktop_entry_dir
cp $this_script_dir/spotify.png $icon_dir/
cp $this_script_dir/spotify.desktop $desktop_entry_dir/
