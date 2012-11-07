# Airstream

A command line tool for sending videos and images to airplay-compatible devices
(like AppleTV).

The airplay protocol can basically play videos in mpeg-4 (mp4, mov, ts, m4v)
format that are accessible via http. Thus for sending a local file a webserver
will be created, see below.

Local images can be sent directly to an aiplay-device.

## Basic Usage

Use the output argument to specify the ip-adress of the remote device. Remote
files will be played directly, local files are hosted with a small webserver
(webrick). Check your firewall settings, port 7000 is used to host the file.

```shell
airstream http://example.com/sample.mp4 -o 192.168.1.8
airstream /home/me/sample.mp4 -o 192.168.1.8
airstream /home/me/*.mp4 -o 192.168.1.8
```

```shell
airimg http://example.com/photo.png -o 192.168.1.8
airimg ~/Pictures/photo.png
airimg ~/Pictures/*.png -n 8
```

See the help for further command line options. To specify default options
use the configuration file initial generated in ~/.airstreamrc.


## History

- v0.3.1
  - Minor Fixes
  - Changing format of progress bar

- v0.3.0
  - Hosting local file directly using webrick

- v0.2.3
  - Added structure to sourcecode

- v0.2.2
  - Fix missing dependencies

- v0.2.0
  - Added sending images to airplay-device

- v0.1.0
  - Initial release
  - Support playing remote files on airplay-device
  - Support playing local files via local webserver

## Thanks

Thanks to Bruno Aguirre (https://github.com/elcuervo) for rubys airplay gem and
Clément Vasseur for the Unofficial AirPlay Protocol Specification
(http://nto.github.com/AirPlay.html).
