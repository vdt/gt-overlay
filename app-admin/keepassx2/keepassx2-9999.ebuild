# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

LANGS=""
inherit kde4-base git

DESCRIPTION="Qt password manager compatible with its Win32 and Pocket PC versions."
HOMEPAGE="http://keepassx.sourceforge.net/"
EGIT_REPO_URI="git://gitorious.org/keepassx/keepassx.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="debug pch"

DEPEND="x11-libs/qt-core:4[qt3support]
	x11-libs/qt-gui:4[qt3support]
	x11-libs/qt-xmlpatterns:4"
RDEPEND="${DEPEND}"

#src_configure() {
#	cp ${FILESDIR}/${PN}.pro ${S}/

	# Emulate what the Makefile does, so that we can get the correct
	# compiler used.
#	eqmake4 ${PN}.pro -o ${PN}.mak || die "eqmake4 failed"
#}

#src_compile() {
#	emake -f ${PN}.mak || die "emake failed" 
#	lupdate ${PN}.pro || die "lupdate failed"
#}

#src_install() {
#	emake DESTDIR="${D}" install || die "make install failed"
#	dodoc README
#}
