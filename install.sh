#!/bin/bash
#install mosquitto mqtt broker
echo "install mosquitto"
apt-get update
apt-get install mosquitto mosquitto-clients -y
systemctl enable mosquitto.service

#set up username/password
echo "configure username/password"
source .credentials
mosquitto_passwd -c -b /etc/mosquitto/passwd $USERNAME $PASSWORD
#force use of username/password
touch /etc/mosquitto/conf.d/default.conf
echo "allow_anonymous false" >> /etc/mosquitto/conf.d/default.conf
echo "password_file /etc/mosquitto/passwd" >> /etc/mosquitto/conf.d/default.conf

#restart mosquitto service
echo "restart mosquitto"
systemctl restart mosquitto.service

#create heartbeat.service
echo "setup service"
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
rm /etc/systemd/system/heartbeat.service
touch /etc/systemd/system/heartbeat.service
echo "[Unit]
Descirption=MQTT Heartbeat Message
After=multi-user.target

[Service]
Type=simple
Restart=always
ExecStart=$SCRIPT_DIR/run.sh

[Install]
WantedBy=multi-user.target" >> /etc/systemd/system/heartbeat.service
#configure heartbeat.service to run automatically on reboot
systemctl daemon-reload
systemctl enable heartbeat.service
#start heartbeat.service without rebooting
systemctl start heartbeat.service
