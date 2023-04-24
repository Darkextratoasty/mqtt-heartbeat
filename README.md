# mqtt-heartbeat
Program to send out a periodic "OK" message on the "heartbeat" topic for monitoring purposes. By default it sends the message every 15 seconds. Install and run scripts are provided, but the python file can be used on it's own if desired.

## Usage
Fill out `.rename` with desired credentials, rename the file to `.credentials`, then run `sudo ./install.sh` to install and configure Mosquitto MQTT Broker.

Run `./run.sh` to start the heartbeat message. To run the python script standalone, use `python3 heartbeat.py yourusername yourpassword &`. 