#!/bin/bash
#remove tomcat and tomcat directories
centosversion=$(rpm --eval '%{centos_ver}')

if [$centosversion < 7]; then
        echo "Operating System Not Supported"
else
        echo "Proceeding with Operation"

        #loop to remove tomcat applications
        tomcat=$(rpm -qa | grep -i tomcat)
        for i in $tomcat
        do
        rpm -e $i
        done

        #remove openjdk
        openjdk=$(rpm -qa | grep -i openjdk)
        yum remove $openjdk -y
        #remove tomcat directories
        rm -rf /var/lib/tomcat
        rm -rf /var/log/tomcat
fi
