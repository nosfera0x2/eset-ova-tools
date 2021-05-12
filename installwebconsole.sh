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
  ##these commands are for testing, in case directories are not made correctly##
  #mkdir /var/lib/tomcat/webapps/era 
  #move tomcat webconsole files to tomcat/webapps/era directory
  #mv /var/lib/tomcat/error.html /var/lib/tomcat/webapps/era
  #mv /var/lib/tomcat/index.html /var/lib/tomcat/webapps/era
  #mv /var/lib/tomcat/META-INF /var/lib/tomcat/webapps/era
  #mv /var/lib/tomcat/NOTICE /var/lib/tomcat/webapps/era
  #mv /var/lib/tomcat/webconsole /var/lib/tomcat/webapps/era
  #mv /var/lib/tomcat/WEB-INF /var/lib/tomcat/webapps/era

  #now we need the new certificate, self sign it, and put it in server.xml
fi
