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
	rm -f Makefile
	eapply_user
}

src_install(){
	#make PREFIX='/usr' DESTDIR="${D}/" install

	run(){
		echo "$@"
		"$@"
	}

	run mkdir -p "${D}/usr/share/pacman/keyrings"
	for file in "alterlinux-revoked" "alterlinux-trusted" "alterlinux.gpg"; do
		run install  -m0644 "$file" "${D}/usr/share/pacman/keyrings/"
	done
}
