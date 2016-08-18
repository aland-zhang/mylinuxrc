i=0; 
while true; 
do date --rfc-3339 ns >> /home/pao/size.log; 
sleep 4; 
i=$[$i+1];
done
