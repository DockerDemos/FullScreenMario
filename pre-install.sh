#!/bin/bash

/usr/bin/yum install -y --nogpgcheck httpd php git which \
rpm-build rpmdevtools redhat-rpm-config make gcc glibc-static

# Build the Runit RPM
RPMUSER="rpmbuilder"
RPMHOME="/home/$RPMUSER"
ARCH="$(arch)"

/usr/sbin/useradd $RPMUSER

/bin/mkdir -p $RPMHOME/rpmbuild/{BUILD,RPMS,SOURCES,SPECS,SRPMS}
/bin/chown -R $RPMUSER $RPMHOME 
/bin/echo '%_topdir %(echo $HOME)/rpmbuild' > $RPMHOME/.rpmmacros 

/bin/su -c '/usr/bin/git clone https://github.com/imeyer/runit-rpm.git' - rpmbuilder
/bin/su -c '/home/rpmbuilder/runit-rpm/build.sh' - rpmbuilder

/usr/bin/yum install -y /home/rpmbuilder/rpmbuild/RPMS/$ARCH/runit-2.1.1-6.el6.$ARCH.rpm

# Setup the Apache init
/bin/mkdir -p /etc/service/httpd

bin/cat << EOF > /etc/service/httpd/run
#!/bin/sh
exec /usr/sbin/httpd -DFOREGROUND
EOF
/bin/chown -R root.root /etc/service/
/bin/find /etc/service/ -exec /bin/chmod a+x {} \;

echo "SV:123456:respawn:/sbin/runsvdir-start" >> /etc/inittab

# Install FullScreenMario
echo "Downloading FullScreenMario from Github"
git clone https://github.com/Diogenesthecynic/FullScreenMario.git /var/www/html
chmod 755 /var/www/html



