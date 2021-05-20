#!/bin/bash

function install_lynx(){
	if yum list installed "lynx" >/dev/null 2>&1; then
		echo "lynx already installed"
	else
		yum install lynx
	fi
	}
#run lynx function
install_lynx()
#lynx pulls up server status.html file
lynx /var/log/eset/RemoteAdministrator/Server/status.html
