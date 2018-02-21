# BungeeCord Updater
A bash script that can be used to automatically keep BungeeCord up to date with the last stable build.

## Dependencies
- [curl](https://github.com/curl/curl) - for querying the Jenkins API and downloading the artifacts
- [jq](https://github.com/stedolan/jq) - for parsing the JSON response from Jenkins

## How to use
Simply run the script with `./download.sh` and it should download the last stable build from https://ci.md-5.net/job/BungeeCord/lastStableBuild into the `src` directory. You can then add a symlink to these files from the BungeeCord folder and set up a cron job to run this script automatically at whatever interval you like. Now you don't have to worry about being behind in updates.
