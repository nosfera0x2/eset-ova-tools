view server.html

#!/bin/bash

function install_lynx{
	if yum list installed "lynx" >/dev/null 2>&1; then
	echo "lynx already installed"
	else
	yum install lynx
	fi
	}
	
install_lynx()

lynx /var/log/eset/RemoteAdministrator/Server/status.html


	