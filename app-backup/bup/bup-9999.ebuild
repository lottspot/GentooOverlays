# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

EGIT_REPO_URI="git://github.com/apenwarr/${PN}.git
	http://github.com/apenwarr/${PN}.git"
inherit git-2 eutils

DESCRIPTION="It backs things up based on the git packfile format"
HOMEPAGE="http://github.com/apenwarr/bup"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS=""

DEPEND="|| (
			dev-lang/python:2.4
			dev-lang/python:2.5
			dev-lang/python:2.6
			dev-lang/python:2.7
		)
		dev-vcs/git
		app-arch/par2cmdline
		dev-python/fuse-python
		dev-python/pyxattr
		dev-python/pylibacl"
RDEPEND="${DEPEND}"

src_prepare() {
	EPATCH_OPTS="-p1" epatch "${FILESDIR}/${PN}-python2.patch"
	epatch_user
}

src_configure() {
	echo "Nothing to configure..."
}

src_compile() {
	emake CFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS}"
}

src_install() {
	emake install DESTDIR="${D}"
	rm -r "${D}/usr/share/doc/${PN}/" || die

}

src_test() {
	emake test
}
