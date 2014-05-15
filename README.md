FullScreenMario
===============

Docker container for running a Full Screen Mario server

* [FullScreenMario](http://www.fullscreenmario.com/)
* [FullScreenMario Github Repo](https://github.com/Diogenesthecynic/FullScreenMario)

Maintainer: Chris Collins \<collins.christopher@gmail.com\>

Updated: 2014-05-08

##Building and Running##

This is a [Docker](http://docker.io) container image.  You need to have Docker installed to build and run the container.

To build the image, change directories into the root of this repository, and run:

`docker build -t fsm .`  <-- note the period on the end

Once it finishes building, you can run the container with:

`docker run -i -t -d -p 8080:80 fsm`

Then, open your browser and navigate to [http://localhost:8080](http://localhost:8080) to start playing.

To improve startup speed, this image will not update with the latest version of the FullScreenMario software automatically once the initial image is built.  When a new update is released, run the `docker build` command from above to get the newest version.

##Extra steps for Mac OS X##

Docker needs a bit of help to run on a Mac, and most folks appear to be using ["boot2docker"](http://boot2docker.io/) to accomplish it.  If you use boot2docker, there are a few preliminary steps you'll need to take for the networking stuff to work:

    boot2docker init
    f_s_m_port=8801
    VBoxManage modifyvm "boot2docker-vm" --natpf1 "tcp-port${f_s_m_port},tcp,,${f_s_m_port},,${f_s_m_port}"
    VBoxManage modifyvm "boot2docker-vm" --natpf1 "udp-port${f_s_m_port},udp,,${f_s_m_port},,${f_s_m_port}"
    boot2docker up

...and then continue with the `docker build` and `docker run` commands from above.

##Acknowledgements##

Thanks to:

* Josh Goldberg [https://github.com/Diogenesthecynic](https://github.com/Diogenesthecynic) for his FullScreenMario code on Github.

* Ian Meyer [https://github.com/imeyer](https://github.com/imeyer) for his Runit rpm spec file and build script for RHEL-based systems.

* Darin London, for troubleshooting issues with Docker v0.11 and adding the info for boot2docker.

##Copyright Information##

Full Scree Mario is licensed under the Creative Commons [Attribution Non-Commercial Share-Alike license](http://creativecommons.org/licenses/by-nc-sa/3.0/).  

DockerDemos/FullScreenMario docker container files are licensed as follows:

Copyright (C) 2014 Chris Collins

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program. If not, see http://www.gnu.org/licenses/.
