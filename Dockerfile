FROM hypriot/rpi-node:7.6.0

MAINTAINER Humberto Sales

USER root

# Install dependencies
RUN apt-get -yqq update && \
    apt-get -yqq --no-install-recommends install git build-essential python-rpi.gpio bluetooth bluez libbluetooth-dev libudev-dev bluez-tools rfkill && \
    apt-get -yqq autoremove && \
    apt-get -yqq clean && \
    rm -rf /var/lib/apt/lists/* /var/cache/* /tmp/* /var/tmp/*

RUN ln /usr/local/bin/node /usr/bin/node

RUN usermod -a -G bluetooth root && \
    setcap cap_net_raw+eip /usr/local/bin/node

	
RUN git clone https://github.com/espruino/EspruinoHub /var/espruinohub

WORKDIR /var/espruinohub

RUN npm install && \
    npm cache clean
	

#Run other commands for start BLE...
COPY src/cmd.sh /var/espruinohub/cmd.sh
RUN chmod +x /var/espruinohub/cmd.sh

CMD /var/espruinohub/cmd.sh

