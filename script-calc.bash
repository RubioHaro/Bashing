

echo -n "Uso de CPU: "
top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1"%"}'

awk '/MemTotal/ {total=$2} /MemFree/ {free=$2} END {printf "MemFree: %.2f%%\n", (free/total)*100}' /proc/meminfo

printf "Uso de Disk: \n"
df -h /dev/sdc

printf "Procesos TOP por CPU: \n"
top -b -n 1 -o %CPU | awk '$1+0 && ++n<=5'

printf "Procesos TOP por MEM: \n"
top -b -n 1 -o %MEM | awk '$1+0 && ++n<=5'