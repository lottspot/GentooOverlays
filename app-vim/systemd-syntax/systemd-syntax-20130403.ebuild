# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

#VIM_PLUGIN_VIM_VERSION="7.0"
inherit vim-plugin

DESCRIPTION="vim plugin: Systemd unit file syntax"
HOMEPAGE="http://fedorapeople.org/cgit/wwoods/public_git/vim-scripts.git/tree/syntax/systemd.vim"
LICENSE="vim"
KEYWORDS="amd64 x86"
SRC_URI="https://repo.lottspot.com/dist-sources/${P}.tar.bz2"
IUSE=""

VIM_PLUGIN_HELPFILES=""
VIM_PLUGIN_HELPTEXT="\
This plugin provides syntax for Systemd unit files."
VIM_PLUGIN_HELPURI=""
VIM_PLUGIN_MESSAGES=""

