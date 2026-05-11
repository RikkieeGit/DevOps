#!/bin/bash

echo "--- for loop ---"
for num in 1 2 3 4 5; do
	echo "Number: $num"
done

echo "--- while loop ---"
COUNT=1
while [ $COUNT -le 5 ]; do
	echo "Count: $count"
	COUNT=$((COUNT + 1))
done
