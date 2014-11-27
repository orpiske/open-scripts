#!/bin/bash

conf_file=$HOME/.orpiske/notify-pushover/notify-pushover.conf

sample_conf_file=/etc/orpiske/notify-pushover/notify-pushover.conf.sample

function load_settings() { 
	if [[ -f "$conf_file" ]] ; then
		source "$conf_file"
	else
		echo "You must configure the application. Copy the sample configuration file from $sample_conf_file to $conf_file" 
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
