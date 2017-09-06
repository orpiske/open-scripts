#!/bin/bash

conf_file=$HOME/.notify-pushover/notify-pushover.conf
conf_sample=$HOME/.notify-pushover/notify-pushover.conf.sample

function load_settings() {
	if [[ -f "$conf_file" ]] ; then
		source "$conf_file"
	else
		mkdir -p $(dirname $conf_sample)
		printf '#Application token\napp_token=my_scripts_token\n\n#User token/key\nuser_token=my_personal_token\n' > $conf_sample

		echo "You must configure the application. A sample configuration file was created on $conf_sample"
		exit 3
	fi
}


function send() {
	if [[ -z "$1" ]] ; then
		echo "The message must not be blank"
		exit 4
	fi

	curl -s \
		--form-string "token=$app_token" \
		--form-string "user=$user_token" \
		--form-string "message=$1" \
		  https://api.pushover.net/1/messages.json
}


function check_settings() {
	if [[ -z $app_token ]] ; then
		echo "You must configure the application token in your $conf_file" ;
		exit 1
	fi

	if [[ -z $user_token ]] ; then
		echo "You must configure the user token in your $conf_file" ;
		exit 2
	fi
}

load_settings
check_settings

send "$@"
