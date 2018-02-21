#!/bin/bash

# Get the last build number that we downloaded
. lastbuild

# Set the URL for the build
BASEURL='https://ci.md-5.net/job/BungeeCord/lastStableBuild'

# Get the build number of the last stable build
LATESTBUILD=`curl -s $BASEURL/api/json | \
	 jq -r '.number'`

# Download the last stable build if there is a new one
if [[ "$LATESTBUILD" > "$LASTBUILD" ]]; then
	# Store the latest build number to check against next time we run the script
	echo LASTBUILD="$LATESTBUILD" > lastbuild
	echo New build available, downloading...

	# Create src folder if it doesn't exist
	if [[ ! -d src ]]; then
		mkdir src
	fi

	cd src

	# Save files in src directory
	for ROW in $(curl -s https://ci.md-5.net/job/BungeeCord/lastStableBuild/api/json | jq -r '.artifacts[] | .relativePath'); do
		curl -O ${BASEURL}/artifact/${ROW}
		echo Saved ${ROW}
	done
	echo BungeeCord is now up to date
else
	# Otherwise we're all up to date
	echo BungeeCord is up to date
fi