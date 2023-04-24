#**************************
# sends out an "OK" message on the "heartbeat" channel every 15 seconds for monitoring the state of the mqtt broker
# version 0.1 updated 2/24/2023
#**************************
import paho.mqtt.client as mqtt #import the client1
import time
import sys

wait_time = 15 # wait 15 seconds between each message
print('starting')
username = sys.argv[1] #grab username from command line
password = sys.argv[2] #grab password from command line
broker_address="localhost" #localhost or IP address of mqtt broker
client = mqtt.Client("heartbeat_pub") #create new instance
client.username_pw_set(username, password) #set username and password

n = True
while n == True:
    try:
        client.connect(broker_address) #connect to broker
        client.publish("heartbeat","OK") #publish message
        print('OK')
        time.sleep(wait_time)
    except KeyboardInterrupt:
        n = False
    except ConnectionRefusedError:
        print('mqtt broker not found, trying again in 15 seconds...')
        time.sleep(15)
print('exiting')