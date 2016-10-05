# Helper file to build docker images

image:
	docker build --tag ryankurte/docker-native-dev .

run:
	docker run --rm -it ryankurte/docker-native-dev /bin/bash

