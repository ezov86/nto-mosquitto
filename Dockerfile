FROM eclipse-mosquitto

ARG NTO_MOSQUITTO_USER
ARG NTO_MOSQUITTO_PASSWORD

RUN mkdir -p /mosquitto/password && touch /mosquitto/password/password.txt
COPY mosquitto.conf /mosquitto_config.conf
RUN mosquitto_passwd -b /mosquitto/password/password.txt ${NTO_MOSQUITTO_USER} ${NTO_MOSQUITTO_PASSWORD}

CMD ["/usr/sbin/mosquitto", "-v", "-c", "/mosquitto_config.conf"]
