.PHONY: build run clean stop

include .env
export

build:
	docker build \
    	--build-arg NTO_MOSQUITTO_USER=${NTO_MOSQUITTO_USER} \
    	--build-arg NTO_MOSQUITTO_PASSWORD=${NTO_MOSQUITTO_PASSWORD} \
		. -t nto-mosquitto

run:
	docker compose up -d

clean:
	rm -rf volumes/

stop:
	docker stop nto-mosquitto
