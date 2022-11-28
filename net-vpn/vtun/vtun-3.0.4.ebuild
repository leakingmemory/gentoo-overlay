# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7


inherit linux-info

DESCRIPTION="Create tunnels over TCP/IP networks with shaping, encryption, and compression"
HOMEPAGE="http://vtun.sourceforge.net/"
SRC_URI="https://sourceforge.net/projects/vtun/files/vtun/3.0.4/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha amd64 ~ppc ~sparc ~x86"
IUSE="lzo socks5 ssl zlib"

RDEPEND="
        lzo? ( dev-libs/lzo:2 )
        socks5? ( net-proxy/dante )
        ssl? ( dev-libs/openssl:0= )
        zlib? ( sys-libs/zlib )"
DEPEND="${RDEPEND}"
BDEPEND="sys-devel/bison"

DOCS=( ChangeLog Credits FAQ README README.Setup README.Shaper TODO )
CONFIG_CHECK="~TUN"

PATCHES=(
		"${FILESDIR}"/${PN}-libssl-ctx.patch
		"${FILESDIR}"/${P}-includes.patch
		"${FILESDIR}"/${P}-naughty-inlines.patch
		"${FILESDIR}"/${P}-autoconf-fork-not-working.patch
)

src_configure() {
        econf \
                $(use_enable ssl) \
                $(use_enable zlib) \
                $(use_enable lzo) \
                $(use_enable socks5 socks) \
                --enable-shaper
}

src_install() {
        default
        newinitd "${FILESDIR}"/vtun.rc vtun
        insinto /etc
        doins "${FILESDIR}"/vtund-start.conf
        rm -r "${ED}"/var || die
}

