# StripchatRecorder
<p align="center">
  <img src="https://raw.githubusercontent.com/Kseen715/imgs/main/favicon.ico?token=GHSAT0AAAAAABZP3VEEX2RTOIF434CW37Q4Y4TPXMA" />
</p>

All credits to:
- @beaston02
- @ahsand97
- @Damianonymous

This is script to automate the recording of public webcam shows from stripchat.com (aka xhamsterlive.com). 

## Requirements

Requires python3.5 or newer. You can grab python3.5.2 from [here](https://www.python.org/downloads/release/python-352/).

To install required modules, run:
```
python -m pip install streamlink bs4 lxml gevent
```


Edit the config file (config.conf) to point to the directory you want to record to, where your "wanted" file is located, the interval between checks (checkInterval, in seconds) and max lenght of single video (duration, in seconds (default - 1 hour, to fit in 2Gb limit of Telegram upload)).

Add models to the "wanted.txt" file (only one model per line). The model should match the models name in their chatrooms URL (https://stripchat.com/{modelname}/). To clarify this, it should only be the "modelname" portion, not the entire url. You can use '#' symbol (or any other tbh) before name to comment-out model from the list.

To execute program, run:
```
python .\StripRunner.py
```


You can also run original part of program, but it will run until the end of stream and will produce one single giant file per model:
```
python .\StripchatRecorder.py
```


After the completion of record, use should transcode videos using, for example, [HandBrake](https://handbrake.fr/).




