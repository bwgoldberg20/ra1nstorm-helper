#!/bin/sh
# (C) 2019 Ronsor Labs, the ra1nstorm contributors, et al.

# Fixes internationalization woes
export LANG=C
ID="$(id -u)"
if [ "$ID" != 0 ]; then
	echo "ra1nstorm must be run as root"
	which sudo 2>&1 >/dev/null && exec sudo $0
	echo "passwerd"
	exec su -c $0
fi
echo "Checking if zenity and gawk are installed..."
which gawk 2>&1 >/dev/null || apt install -y gawk
which zenity 2>&1 >/dev/null || apt install -y zenity
echo "Launching setup..."
gawk -f main.awk 2>&1 | tee -a /tmp/ra1nstorm.log

