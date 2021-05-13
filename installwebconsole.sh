#!/bin/bash
centosversion=$(rpm --eval '%{centos_ver}')
if [$centosversion < 7]; then
        echo "Operating System Not Supported"
else
  echo "Proceeding with Operation..."
  #remove existing era.war file
  rm /root/eset_installers/era.war
  #retrieve latest era.war file
  wget -O /root/eset_installers/era.war https://download.eset.com/com/eset/apps/business/era/webconsole/latest/era.war
  #install openjdk
  yum install java-1.8.0-openjdk -y
  #install tomcat
  yum install tomcat -y
  #place era.war file in tomcat/webapps directory
  cp /root/eset_installers/era.war /var/lib/tomcat/webapps/

  systemctl restart tomcat
  #unzip contents of era.war file into the webapps directory
  unzip /var/lib/tomcat/webapps/era.war
  systemctl restart tomcat

  #now we need to restore server.xml and server.xml.rpmnew
  rm -f /etc/tomcat/server.xml
  rm -f /etc/tomcat/server.xml.rpmnew
  cp /root/server.xml /etc/tomcat
  cp /root/server.xml.rpmnew /etc/tomcat
  systemctl restart tomcat
fi
