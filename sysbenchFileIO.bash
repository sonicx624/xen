#!/bin/bash
MB="MB"
for (( i=128; i<=8192; i=$i*2 )) do
	for (( j=1; j<=10; j++ )) do
		sysbench fileio --file-total-size="$i$MB" prepare >> /dev/null
		if [ "$j" != "1" ]; then
			sysbench fileio --file-total-size="$i$MB" --file-test-mode=rndrw --time=300 --max-requests=0 run >> "FileIO$i$MB.test"
		else
			sysbench fileio --file-total-size="$i$MB" --file-test-mode=rndrw --time=300 --max-requests=0 run > "FileIO$i$MB.test"
		fi
		sysbench fileio --file-total-size="$i$MB" cleanup >> /dev/null
	done
	grep "total time" "FileIO$i$MB.test" > "shortFileIO$i$MB.test"
done
