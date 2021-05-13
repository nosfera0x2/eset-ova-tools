#!/bin/bash
#remove tomcat and tomcat directories
centosversion=$(rpm --eval '%{centos_ver}')

if [$centosversion < 7]; then
        echo "Operating System Not Supported"
else
        echo "Proceeding with Operation"
        sleep2
        echo "Backing up server.xml..."
        sleep2
        cp /etc/tomcat/server.xml /root/

        #loop to remove tomcat applications
        tomcat=$(yum list installed | grep -i tomcat)
        for i in $tomcat
        do
        yum remove $i -y 
        done

        #remove openjdk
        openjdk=$(rpm -qa | grep -i openjdk)
        yum remove $openjdk -y
        #remove tomcat directories
        rm -rf /var/lib/tomcat
        rm -rf /var/log/tomcat
        echo "Tomcat is now gone!"
fi
