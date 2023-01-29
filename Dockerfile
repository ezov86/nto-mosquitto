FROM eclipse-mosquitto

ARG MOSQUITTO_USER
ARG MOSQUITTO_PASSWORD

RUN mkdir -p /mosquitto/password && touch /mosquitto/password/password.txt
COPY mosquitto.conf /mosquitto_config.conf
RUN mosquitto_passwd -b /mosquitto/password/password.txt ${MOSQUITTO_USER} ${MOSQUITTO_PASSWORD}

CMD ["/usr/sbin/mosquitto", "-v", "-c", "/mosquitto_config.conf"]
