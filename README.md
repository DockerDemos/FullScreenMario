FullScreenMario
===============

Docker container for running a Full Screen Mario server

Maintainer: Chris Collins \<collins.christopher@gmail.com\>

Updated: 2017-11-17

[![Master Build Status](https://travis-ci.org/DockerDemos/FullScreenMario.svg?branch=master)](https://travis-ci.org/DockerDemos/FullScreenMario.svg?branch=master)

## Building and Running

This is a [Docker](http://docker.com) container image.  You need to have Docker installed to build and run the container.

### Using Docker Compose

If you have [Docker Compose](https://docs.docker.com/compose/) installed, building and running the image is as simple as changing directories into the root of your git clone of this repository and running:

```
# Build the image
docker-compose build

# Run the container
docker-compose up
```

### Without Docker Compose

To build the image, change directories into the root of your git clone this repository, and run:

`docker build -t fsm .`

Note the period on the end of the line above.

Once it finishes building, you can run the container with:

`docker run -t -p 80:80 fsm`

Then, open your browser and navigate to [http://localhost:80](http://localhost:80) to start playing.


## Acknowledgements

Thanks to:

* Josh Goldberg [https://github.com/Diogenesthecynic](https://github.com/Diogenesthecynic/) for his FullScreenMario code on Github.

* Darin London, for troubleshooting issues with Docker v0.11 and adding the info for boot2docker.

## Copyright Information

DockerDemos/FullScreenMario docker container files are licensed as follows:

Copyright (C) 2015 Chris Collins

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program. If not, see http://www.gnu.org/licenses/.
