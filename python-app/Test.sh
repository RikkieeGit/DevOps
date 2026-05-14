#!/bin/bash

for i in {1..5}; do
	echo "Container $i response:"
	curl -s http://localhost:800$i
done
