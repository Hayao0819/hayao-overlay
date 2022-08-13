# Copyright 2922 Hayao Yamada
# Distributed under the MIT License

EAPI=8

DESCRIPTION="GnuPG keyring of Alter Linux developer keys"
HOMEPAGE="https:/fascode.net"
SRC_URI="https://github.com/FascodeNet/${PN}/archive/refs/tags/${PV}.tar.gz"
LICENSE="GPL-2" # "GPL" for the Arch linux package
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

src_prepare() {
	default
}

src_install(){
	emake PREFIX='/usr' DESTDIR="${D}" install
}
