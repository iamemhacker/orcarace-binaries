# orcarace-binaries

# Installation & Setup

## Prerequisites

1. `brew install glib gobject-introspection`
1. `brew install gstreamer gst-plugins-base`
1. `brew install supervisord`
1. From the project root direcotory: `mkdir logs`


## Structure
Package structure:
├── camera-module
│   └── race-package.tar.gz
├── LICENSE
└── README.md

The tarball has the following internal structure:
```
supervisor/supervisord.conf
utils/
utils/list_devices.sh
utils/discover2.sh
scripts/camsync.lua
frame-producer-module/clocksync
frame-producer-module/racestreamer
frame-producer-module/demuxer
clock-module/clock
clock-module/app_config.json
frame-producer-module/app-config.json
bus-module/bus
```

## installation

From the tarball:

`tar xzf race-package.tar.gz`


## Package configuraion
Pacakage configuration is done in the following files:

1. `supervisor/supervisord.conf`

* Add configuration to match the number of installed cameras.
* In each cameras configuration section, under the `environment` section,
fill out the **un**, **pwd** and **camera_ip** variables to match the 'orcavision' stream on your camera.

1. `clock-module/app_config.json`

* **num_lanes** # of lanes in the pool.
* **pool_length** Length of the pool.
* **clock_ip** the IP of hostname of the Swiss Quantum machine that runs 'sports in a box'.
* **clock_port** PORT number for the clock connection.
* **lane_lo** Lane number for the lowest lane. 
* **lane_hi** Lane number for the highest lane.
* **iface** Network interface name on which the connection with the clock is held.

1. `frame-producer-module/app-config.json`

* **evnet_id** - the name of the Auzre container configured for this event.
* **camera_ip** IP of a the left camera (if not overidden by supervisord.conf).
* **gw_ip** - IP of the GW machine to receive the incoming video stream.
* **iface** Name of the network interface on which the IP is communicating with host.


