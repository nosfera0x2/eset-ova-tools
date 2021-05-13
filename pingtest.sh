#points to txt of ip addresses for modules update servers
#and uses grep regex to only iterate through ip addresses

modules_updates=$(curl -s -N https://support.eset.com/storage/IMAGES/en/6328_KB332/Download_Updates.txt | grep -oE "(\b([0-9]{1,3}\.){3}[0-9]{1,3})\b")

ping_servers() {
for i in $modules_updates
do
ping -q -c 1 $i
done
}

ping_servers | grep -i -B 1 "0 received" | tee zero-module-ping.txt 
#end
