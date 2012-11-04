# Airstream

A command line tool for sending videos and images to airplay-compatible devices
(like AppleTV).

The airplay protocol can basically play videos in mpeg-4 format that are
accessible via http. Thus for sending a local file you will have to
use a local webserver, see below.

Local Images can be sent directly to an aiplay-device.

## Basic Usage

Use the output argument to specify the ip-adress of the remote device.

```shell
airstream http://example.com/sample.mp4 -o 192.168.1.8
```

```shell
airimg ~/Pictures/photo.png airimg http://example.com/photo.png -o 192.168.1.8
```

See the help for further command line options. To specify default options
use the configuration file initial generated in ~/.airstreamrc.

```shell
airimg ~/Pictures/photo.png airimg http://example.com/photo.png -o 192.168.1.8
```

## Advanced Usage

Install any kind of webserver, like apache and start. Most likely you don't
want to add all the parameters every time you send a file to the device. First
time using the tool, a configuration file will be generated in ~/.airstreamrc.

```shell
airstream
Initialized configuration file in /home/me/.airstreamrc
```

Set the local webserver informations in the configuration and you are ready to
play local files.

```
---
:reciever: 192.168.1.8
:use_local_httpd: true
:http_path: /var/www/html/airstream/
:http_url: http://192.168.1.2/airstream/
```

Now airstream will generate a hash of your filename and place the file in the
webservers path specified. The copies of your video files will remain in the
webserver, for now it is up to you to clean on demand.

## History

- v0.3.0
  - Added structure to sourcecode

- v0.2.2
  - Fix missing dependencies

- v0.2.0
  - Added sending images to airplay-device

- v0.1.0
  - Initial Release
  - Support playing remote files on airplay-device
  - Support playing local files via local webserver

## Thanks

Thanks to Bruno Aguirre (https://github.com/elcuervo) for rubys airplay gem and
Clément Vasseur for the Unofficial AirPlay Protocol Specification
(http://nto.github.com/AirPlay.html).
