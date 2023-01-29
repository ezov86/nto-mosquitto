.PHONY: build run clean

include .env
export

build:
	docker build \
    	--build-arg MOSQUITTO_USER=${MOSQUITTO_USER} \
    	--build-arg MOSQUITTO_PASSWORD=${MOSQUITTO_PASSWORD} \
		. -t mosquitto_configured

run:
	docker compose up -d

clean:
	rm -rf volumes/