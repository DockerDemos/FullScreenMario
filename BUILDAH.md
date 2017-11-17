Building with Buildah
=====================

[Buildah](https://github.com/projectatomic/buildah) is a cool tool written by the good folks over at [Project Atomic](https://www.projectatomic.io/), and a great alternative to Docker for building container images, even Docker-formatted images.  Included in this repository is a "Buildahfile"* - in this case just a simple bash script - that will build a Full Screen Mario image from a scratch base image.

Buildah is extremely flexible and lets you use a variety of tools for building images.  In this case it uses `dnf` on the host machine to install nginx and clone the FSM repo, which results in an image about 100M smaller.  More space savings could be had by using a smaller webserver, or compiling Nginx on our own rather than using the RPM packages.

A caveat - this Buildahfile is designed for use with Fedora 26.  If you have another Linux distro, you'll need to adjust it accordingly (probably mostly by replacing `dnf` with your distro's package management software).

\* Buildahfiles aren't a thing - I just named it that for convenience.
