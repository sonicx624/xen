#!/bin/bash
for (( i=1; i<=32; i=$i*2 )); do
	file="CPU$i"
	for (( j=1; j<=10; j++ )); do
		if [ "$j" != "1" ]; then
			sysbench cpu --cpu-max-prime=15000 --num-threads=$i run >> "$file.test"
		else 
			sysbench cpu --cpu-max-prime=15000 --num-threads=$i run > "$file.test"
		fi
	done
	grep "total time" "$file.test" > "short$file.test"
done
