#!/bin/bash

/usr/bin/yum clean all
/usr/bin/yum install -y --nogpgcheck httpd php git which tar \
rpm-build rpmdevtools redhat-rpm-config make gcc glibc-static

# Build the RPM
RPMUSER='rpmbuilder'
RPMHOME="/home/$RPMUSER"
ARCH="$(arch)"

/usr/sbin/useradd $RPMUSER

/bin/mkdir -p $RPMHOME/rpmbuild/{BUILD,RPMS,SOURCES,SPECS,SRPMS}
/bin/echo '%_topdir %(echo $HOME)/rpmbuild' > $RPMHOME/.rpmmacros
/bin/chown -R $RPMUSER $RPMHOME

f_build() {
	RPMSOURCE="$1"
	RPM="$2"
	/bin/su -c "/usr/bin/git clone $RPMSOURCE $RPM" - rpmbuilder
	/bin/su -c "/home/rpmbuilder/$RPM/build.sh $RPM 1>/dev/null" - rpmbuilder
}

BUILDPKGS='rpm-build rpmdevtools redhat-rpm-config make gcc glibc-static'

/usr/bin/yum clean all
/usr/bin/yum install -y $BUILDPKGS httpd php git which tar

f_build 'https://github.com/imeyer/runit-rpm.git' 'runit-rpm'

/usr/bin/yum install -y $RPMHOME/rpmbuild/RPMS/*/*.rpm

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



