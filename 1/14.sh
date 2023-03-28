user=admini
host=${1}

#create logs
for i in {1..5}; do
  touch "/var/log/vk-sre-${i}.log"
  echo "This is file ${i} for vk sre quest" > "/var/log/vk-sre-${i}.log"
done

#send logs to another host
scp /var/log/vk-sre-*.log admini@${host}:/var/log/

#delete old logs
ssh admini@${host} find /var/log/ -type f -name "vk-sre-*.log" -mtime +7 -delete