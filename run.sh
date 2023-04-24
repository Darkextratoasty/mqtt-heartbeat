#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source $SCRIPT_DIR/.credentials
#launch heartbeat python script
/usr/bin/python3 $SCRIPT_DIR/heartbeat.py $USERNAME $PASSWORD
