import subprocess
import time
import os
import configparser
import sys
import keyboard

mainDir = sys.path[0]
Config = configparser.ConfigParser()
setting = {}


def cls():
    os.system('cls' if os.name == 'nt' else 'clear')


def readConfig():
    global setting

    Config.read(mainDir + '/config.conf')
    setting = {
        'save_directory': Config.get('paths', 'save_directory'),
        'wishlist': Config.get('paths', 'wishlist'),
        'interval': int(Config.get('settings', 'checkInterval')),
        'postProcessingCommand': Config.get('settings', 'postProcessingCommand'),
        'duration': int(Config.get('settings', 'duration')),
    }
    try:
        setting['postProcessingThreads'] = int(
            Config.get('settings', 'postProcessingThreads'))
    except ValueError:
        if setting['postProcessingCommand'] and not setting['postProcessingThreads']:
            setting['postProcessingThreads'] = 1

    if not os.path.exists(f'{setting["save_directory"]}'):
        os.makedirs(f'{setting["save_directory"]}')


if __name__ == "__main__":
    while True:
        readConfig()
        proc = subprocess.Popen(
            "python ./StripchatRecorder.py", shell=False)
        if setting['duration'] > 0:
            time.sleep(setting['duration'])
            proc.kill()
            cls()
            print("Restarting...                             ")
