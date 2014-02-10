# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit user systemd

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="x86? ( https://repo.lottspot.com/dist-sources/btsync-bin-1.2.82_x64.tar.gz )
amd64? ( https://repo.lottspot.com/dist-sources/btsync-bin-1.2.82_x64.tar.gz )
arm? ( https://repo.lottspot.com/dist-sources/btsync-bin-1.2.82_arm.tar.gz )"
QA_PREBUILT="usr/libexec/btsync/btsync"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_unpack() {
	mkdir -p ${S}
	cd ${S}
	if [ "${A}" != "" ]; then
	  unpack ${A}
	fi
}


src_compile(){
	true
}

pkg_preinst(){
	enewuser btsync
	enewgroup btsync
}

src_install(){
	dodir /var/lib/btsync/data
	fowners btsync:btsync /var/lib/btsync/data
	exeinto /usr/libexec/btsync
	insinto /usr/share/btsync
	doexe btsync
	newexe "${FILESDIR}/config_check.sh" config_check.sh
	newins "${FILESDIR}/btsync.conf.user" btsync.conf
	insinto /etc/btsync
	newins "${FILESDIR}/btsync.conf.system" btsync.conf
	systemd_dounit ${FILESDIR}/btsync.service
	systemd_newunit ${FILESDIR}/btsync-user.service 'btsync@.service'
}

