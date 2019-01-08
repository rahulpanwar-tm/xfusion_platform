#!/bin/sh
#!/usr/bin/env bash
#IFS=',' ;for itemp_ip in `echo "192.168.1.122,192.168.234.54,124.567.34.5"`;do IFS=',' ;for item_user in `echo "developer,admin,Ttpl"`;do echo $item_user $itemp_ip; done; done; echo ""
# To declare static Array  
# sh spider_data_node.sh '192.168.1.122 192.168.1.56 192.168.1.122' 'Ttpl@123 Ttpl@123 Ttpl@123' 'root root root' '3307 3307 3307' '192.168.1.55' 'xfusion_performance_data_node_1 xfusion_performance_data_node_2 xfusion_performance_data_node_1' 'srv_node1 srv_node2 srv_node3' 'Exicom' 'xfusion_auth_engine';
array_ip=($1); array_user=($3); array_Password=($2); array_port=($4); array_node=($6); array_server=($7); array_pro=($8);
echo "ID" "SERVER_IP"  "USER_NAME"  "Password"  "Port" "Pro_Server" "Data_node_name" "Node_server"
for ((i=0;i<=${#array_ip[@]}-1;i++)); do
echo "$i" "${array_ip[i]}" "${array_user[i]}" "${array_Password[i]}" "${array_port[i]}" "$5" "${array_node[i]}" "${array_server[i]}" "${array_pro[0]}" "${array_pro[1]}" "${array_pro[2]}" "${array_pro[3]}" "${array_pro[4]}" ;
done; echo ''
if [ "${array_pro[1]}" == "xfusion_performance_data" ]
then

  
#verisoning_table=($(mysql -u${array_user[i]} --port ${array_port[i]}  -p${array_Password[i]} -c -h $5 -BSe "show databases;"))
function in_array {
  ARRAY=$2
  for e in ${ARRAY[*]}
  do
    if [[ "$e" == "$1" ]]
    then
      return 0
    fi
  done
  return 1
}
verisoning_table=(Thanks to Stephane)
for ((m=0;m<=${#verisoning_table[@]}-1;m++)); do
if in_array "${array_node[m]}" "${verisoning_table[*]}"
  then
    echo "Data Node" "${array_node[m]}" "allready installed!!"
  else
echo "Data Node" "${array_node[m]}" "not installed!!"
# prepare sql script for current node
cat /home/ttpl/.jenkins/workspace/xfusion_data_node/xfusion_data_node_2019-01-03.sql > "${array_node[m]}".sql
#echo /home/ttpl/.jenkins/workspace/xfusion_data_node/xfusion_data_node_2019-01-03.sql >"${array_node[m]}".sql
#update script as per current node
sed -i "s/xfusion_performance_data_node_1/${array_node[m]}/g" /home/ttpl/.jenkins/workspace/xfusion_data_node/"${array_node[m]}".sql
# install data node and partition on particular server 
#mysql -u"${array_user[j]}" --port "${array_port[j]}"  -p"${array_Password[j]}" -c -h "$5" -e "show databases;";
# create server on spider node and config server
#mysql -u"${array_user[j]}" --port "${array_port[j]}"  -p"${array_Password[j]}" -c -h "$5" -e "show databases;";
echo "${array_pro[0]}" "${array_pro[1]}" "${array_ip[j]}" "${array_user[j]}" "${array_Password[j]}" "${array_port[j]}" "${array_pro[2]}" "${array_pro[3]}" "${array_pro[4]}"
echo "Rahul Panwar"
. ./jenkins_1.sh "${array_pro[0]}" "${array_pro[1]}" "${array_ip[j]}" "${array_user[j]}" "${array_Password[j]}" "${array_port[j]}" "${array_pro[2]}" "${array_pro[3]}" "${array_pro[4]}"
 
fi
done; echo ''
# for ((j=0;j<=${#array_ip[@]}-1;j++)); do
# . ./jenkins_1.sh "$8" "$9" "${array_ip[j]}" "${array_user[j]}" "${array_Password[j]}" "${array_port[j]}" "$10" "$11" "$12"
# mysql -u"${array_user[j]}" --port "${array_port[j]}"  -p"${array_Password[j]}" -c -h "$5" -e "show databases;";
# done; echo ''


if [ "${array_pro[1]}" == "xfusion_spider_platform" ]
then
  echo "Hello Patform deployement"
else
  echo "Both strings are different"
fi
#array_ip=$1; array_user=$3; array_Password=$2; array_port=$4; 
#for ((i=0;i<=${#array_ip[@]}-1;i++))
#do 
#	#mysql -u${array_user[i]} --port ${array_port[i]}  -p${array_Password[i]} -c -h $5 -e "show databases;"
 	
# done
