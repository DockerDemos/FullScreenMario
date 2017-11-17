### Extra steps for Mac OS X

Note: This may be outdated information

---

Docker needs a bit of help to run on a Mac, and most folks appear to be using ["boot2docker"](http://boot2docker.io/) to accomplish it.  If you use boot2docker, there are a few preliminary steps you'll need to take for the networking stuff to work:

    boot2docker init
    f_s_m_port=8801
    VBoxManage modifyvm "boot2docker-vm" --natpf1 "tcp-port${f_s_m_port},tcp,,${f_s_m_port},,${f_s_m_port}"
    VBoxManage modifyvm "boot2docker-vm" --natpf1 "udp-port${f_s_m_port},udp,,${f_s_m_port},,${f_s_m_port}"
    boot2docker up

...and then continue with the `docker build` and `docker run` commands from above.

