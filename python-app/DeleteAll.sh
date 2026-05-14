#!/bin/bash

for i in {1..5}; do
	docker rm python-contianer-$i
done
