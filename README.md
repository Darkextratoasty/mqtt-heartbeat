# mqtt-heartbeat
Program to send out a periodic "OK" message on the "heartbeat" topic for monitoring purposes. By default it sends the message every 15 seconds. Install and run scripts are provided, but the python file can be used on it's own if desired.

## Usage
Fill out `.rename` with desired credentials, rename the file to `.credentials`.
Run `sudo ./install.sh` from within `mqtt-heartbeat/` folder, this installs, configures, and starts the heartbeat service.


`./run.sh` or even `python3 heartbeat.py yourusername yourpassword &` can be used to run the python script standalone.