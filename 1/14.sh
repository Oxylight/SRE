user=admini
host=${1}
folder=${2}

#create logs
for i in {1..5}; do
  touch "/var/log/vk-sre-${i}.log"
  echo "This is file ${i} for vk sre quest" > "/var/log/vk-sre-${i}.log"
done

#send logs to another host
scp /var/log/vk-sre-*.log ${user}@${host}:${folder}

#delete old logs
ssh ${user}@${host} find ${folder} -type f -name "vk-sre-*.log" -mtime +7 -delete