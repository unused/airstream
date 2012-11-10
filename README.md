# Airstream

A command line tool for sending videos and images to airplay-compatible devices
(like AppleTV).

The airplay protocol can basically play videos in mpeg-4 (mp4, mov, ts, m4v)
format that are accessible via http. Thus for sending a local file a webserver
will be created, see below.

Local or remote images can be sent directly to an aiplay-device.

Playing audio or offering a stream to an airplay device is not yet implemented
but is planned to. Do not hestitate to send me any ideas or bug informations.

## Basic Usage

Use the output argument to specify the ip-adress of the remote device. Remote
files will be played directly, local files are hosted with a small webserver
(webrick). Check your firewall settings, port 7000 is used to host the file.

```shell
airstream http://example.com/sample.mp4 -o 192.168.1.8
airstream /home/me/sample.mp4 -o 192.168.1.8
```
You can also use wildcards and handle files as usually...
```shell
airstream /home/me/*.mp4 -o 192.168.1.8
airstream /home/me/my-birthday-20{08,10,12}.mov -o 192.168.1.8
```
Use airimg to send images to the airplay device.
```shell
airimg http://example.com/photo.png -o 192.168.1.8
airimg ~/Pictures/photo.png
```
Use -n option to set the interval between switching to the next picture.
```shell
airimg ~/Pictures/*.png -n 8
```

See the help for further command line options. To specify default options
use the configuration file initial generated in ~/.airstreamrc.


## History

- v0.3.3
  - Extended Readme
  - Dependency fixes
- v0.3.2
  - Fixing GEM missing file
  - Minor Fixes
  - Changing format of progress bar
- v0.3.0
  - Hosting local file directly using webrick
- v0.1.0 - v0.2.3
  - Play remote files
  - Play local video files with local webserver
  - Sending Images
  - Bugfixes

## Thanks

Thanks to Bruno Aguirre (https://github.com/elcuervo) for rubys airplay gem and
Clément Vasseur for the Unofficial AirPlay Protocol Specification
(http://nto.github.com/AirPlay.html).
