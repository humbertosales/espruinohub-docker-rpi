FROM hypriot/rpi-node:7.6.0

MAINTAINER Humberto Sales

# Install dependencies
RUN apt-get -yqq update && \
    apt-get -yqq --no-install-recommends install git build-essential python-rpi.gpio bluetooth bluez libbluetooth-dev libudev-dev

#    apt-get -yqq autoremove && \
#    apt-get -yqq clean && \
#    rm -rf /var/lib/apt/lists/* /var/cache/* /tmp/* /var/tmp/*

RUN ln /usr/local/bin/node /usr/bin/node

#    sudo npm cache clean


RUN git clone https://github.com/espruino/EspruinoHub /var/espruinohub


WORKDIR /var/espruinohub

RUN npm install

CMD /var/espruinohub/start.sh

