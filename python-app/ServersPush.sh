#!/bin/bash

for i in 1 2 3 4 5; do
	docker run -d -p 800$i:8000 --name python-contianer-$i my-python-image
done
