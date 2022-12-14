# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools xdg-utils

DESCRIPTION="A modern, minimalist taskbar for Xfce"
HOMEPAGE="https://gitlab.xfce.org/panel-plugins/xfce4-docklike-plugin/"
_BASEVERSION="${PV%.0}"

if [[ ${PV} == 9999 ]]; then
	EGIT_REPO_URI="${HOMEPAGE}.git"
	inherit git-r3
else
	#SRC_URI="$HOMEPAGE/-/archive/$P/$PN-$P.tar.gz -> ${P}.tar.gz"
	SRC_URI="https://archive.xfce.org/src/panel-plugins/$PN/$_BASEVERSION/$P.tar.bz2 -> ${P}.tar.bz2"
fi

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm64 x86"
IUSE=""

RDEPEND="
	x11-libs/gtk+:3
	x11-libs/libX11
	x11-libs/libwnck:3
	>=xfce-base/libxfce4ui-4.12:=
	>=xfce-base/libxfce4util-4.12:=
	>=xfce-base/xfce4-panel-4.12:=
	>=xfce-base/xfconf-4.12:=
"
DEPEND="${RDEPEND}
	dev-util/intltool
	dev-util/xfce4-dev-tools
	sys-devel/gettext
	virtual/pkgconfig"

src_prepare() {
	# run xdt-autogen from xfce4-dev-tools added as dependency by EAUTORECONF=1 to
	# rename configure.ac.in to configure.ac while grabbing $LINGUAS and $REVISION values
	NOCONFIGURE=1 xdt-autogen || die

	default
}

src_install() {
	default
	find "${D}" -name '*.la' -delete || die
}

pkg_postinst() {
	xdg_icon_cache_update
}

pkg_postrm() {
	xdg_icon_cache_update
}
