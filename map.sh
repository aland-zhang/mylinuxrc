#!/bin/bash

declare -A files
e='abc def abc abc abc'
for f in $e;
do
	if [ ! ${files[$f]} ];
		then
		files+=([$f]=0)
	else
		((files[$f]++))
	fi
done

for ff in ${!files[@]};
do
	echo $ff ${files[$ff]}
done
declare -A animals
animals=( ["moo"]="cow" ["woof"]="dog")

echo "${animals[moo]}"

for sound in "${!animals[@]}"; do echo "$sound - ${animals[$sound]}"; done

