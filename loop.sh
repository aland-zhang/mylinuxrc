read -ra arr1 <<<"$A"
read -ra arr2 <<<"$B"

echo "len arr1" ${#arr1[@]}
if [ ${#arr1[@]} -eq 4 ]
then
	echo "match"
fi

for i in ${!arr1[*]}
do
	echo $i
	echo ${arr1[i]} ${arr2[i]}
done