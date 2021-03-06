# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-base/gwenview/gwenview-4.6.5.ebuild,v 1.3 2011/08/15 19:22:54 maekke Exp $

EAPI=4

KDE_SCM="git"
KMNAME="kdegraphics"
kde_eclass="kde4-meta"

inherit ${kde_eclass}

DESCRIPTION="KDE image viewer"
KEYWORDS="amd64 ~ppc ~ppc64 x86 ~amd64-linux ~x86-linux"
IUSE="debug kipi semantic-desktop"

# tests hang, last checked for 4.2.96
RESTRICT=""

# $(add_kdebase_dep kdelibs 'semantic-desktop=')
DEPEND="
	>=media-gfx/exiv2-0.18
	virtual/jpeg
	kipi? ( $(add_kdebase_dep libkipi) )
"
RDEPEND=""
#RDEPEND="${DEPEND}"

src_configure() {
	mycmakeargs=(
		$(cmake-utils_use_with semantic-desktop Soprano)
		$(cmake-utils_use_with kipi)
	)

	if use semantic-desktop; then
		mycmakeargs+=(-DGWENVIEW_SEMANTICINFO_BACKEND=Nepomuk)
	else
		mycmakeargs+=(-DGWENVIEW_SEMANTICINFO_BACKEND=None)
	fi

	${kde_eclass}_src_configure
}

pkg_postinst() {
	${kde_eclass}_pkg_postinst

	echo
	elog "For SVG support, emerge -va kde-base/svgpart"
	echo
}

if [[ ${PV} != *9999 ]]; then
src_install() {
	kde4-meta_src_install

	# why, oh why?!
	rm "${ED}/usr/share/apps/cmake/modules/FindKSane.cmake" || die
}
fi
