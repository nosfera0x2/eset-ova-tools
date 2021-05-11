rm /root/eset_installers/era.war
wget -O /root/eset_installers/era.war https://download.eset.com/com/eset/apps/business/era/webconsole/latest.era.war
#adding and organizing components

yum install java-1.8.0-openjdk tomcat
cp /root/eset_installers/era.war /var/lib/tomcat/webapps/

systemctl restart tomcat

unzip /var/lib/tomcat/webapps/era.war
mkdir /var/lib/tomcat/webapps/era 

#move tomcat webconsole files to tomcat/webapps/era directory
mv /var/lib/tomcat/error.html /var/lib/tomcat/webapps/era
mv /var/lib/tomcat/index.html /var/lib/tomcat/webapps/era
mv /var/lib/tomcat/META-INF /var/lib/tomcat/webapps/era
mv /var/lib/tomcat/NOTICE /var/lib/tomcat/webapps/era
mv /var/lib/tomcat/webconsole /var/lib/tomcat/webapps/era
mv /var/lib/tomcat/WEB-INF /var/lib/tomcat/webapps/era

#now we need the new certificate, self sign it, and put it in server.xml
