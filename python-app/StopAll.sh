#!/bin/bash

for i in {1..5}; do
	docker stop python-contianer-$i
done
