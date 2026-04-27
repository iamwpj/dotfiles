#!/usr/bin/env python

from pathlib import Path
import configparser
import os
import json
import subprocess

config_file = Path(os.environ.get('KDECONNECT_DEVICES', f"{os.environ['HOME']}/.config/kdeconnect/trusted_devices"))

def parse_config() -> str:

    connected_devices = (subprocess.run(
        [
            "kdeconnect-cli",
            "--list-available",
            "--name-only"
        ],
        capture_output=True,
        text=True,
    ).stdout).split('\n')
    
    connected_devics = list(filter(None, connected_devices))
    # We just parse a text file since it's easier to deal with.
    config = configparser.ConfigParser()
    config.read(config_file)

    for connection in config.sections():
        
        print(json.dumps({
            "alt": config[connection]['type'] if config[connection]['name'] in connected_devices else 'disconnected',
            "text": config[connection]['name'],
            "class": 'connected' if config[connection]['name'] in connected_devics else 'disconnected' 
        }))

parse_config()
