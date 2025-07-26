# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	adler2-2.0.1
	bitflags-2.9.1
	block-padding-0.3.3
	blowfish-0.9.1
	byteorder-1.5.0
	cc-1.2.29
	cfg-if-1.0.1
	cipher-0.4.4
	crc32fast-1.5.0
	crypto-common-0.1.6
	deranged-0.4.0
	dns-lookup-2.0.4
	ecb-0.1.2
	errno-0.3.13
	flate2-1.1.2
	foreign-types-0.3.2
	foreign-types-shared-0.1.1
	generic-array-0.14.7
	inout-0.1.4
	itoa-1.0.15
	libc-0.2.174
	md5-0.8.0
	miniz_oxide-0.8.9
	num-conv-0.1.0
	once_cell-1.21.3
	openssl-0.10.73
	openssl-macros-0.1.1
	openssl-sys-0.9.109
	pkg-config-0.3.32
	powerfmt-0.2.0
	proc-macro2-1.0.95
	quote-1.0.40
	rust-lzo-0.6.2
	serde-1.0.219
	serde_derive-1.0.219
	shlex-1.3.0
	signal-hook-0.3.18
	signal-hook-registry-1.4.5
	socket2-0.5.10
	syn-2.0.104
	time-0.3.41
	time-core-0.1.4
	time-macros-0.2.22
	typenum-1.18.0
	unicode-ident-1.0.18
	vcpkg-0.2.15
	version_check-0.9.5
	windows-sys-0.48.0
	windows-sys-0.52.0
	windows-sys-0.60.2
	windows-targets-0.48.5
	windows-targets-0.52.6
	windows-targets-0.53.2
	windows_aarch64_gnullvm-0.48.5
	windows_aarch64_gnullvm-0.52.6
	windows_aarch64_gnullvm-0.53.0
	windows_aarch64_msvc-0.48.5
	windows_aarch64_msvc-0.52.6
	windows_aarch64_msvc-0.53.0
	windows_i686_gnu-0.48.5
	windows_i686_gnu-0.52.6
	windows_i686_gnu-0.53.0
	windows_i686_gnullvm-0.52.6
	windows_i686_gnullvm-0.53.0
	windows_i686_msvc-0.48.5
	windows_i686_msvc-0.52.6
	windows_i686_msvc-0.53.0
	windows_x86_64_gnu-0.48.5
	windows_x86_64_gnu-0.52.6
	windows_x86_64_gnu-0.53.0
	windows_x86_64_gnullvm-0.48.5
	windows_x86_64_gnullvm-0.52.6
	windows_x86_64_gnullvm-0.53.0
	windows_x86_64_msvc-0.48.5
	windows_x86_64_msvc-0.52.6
	windows_x86_64_msvc-0.53.0
"

inherit linux-info cargo git-r3 autotools

DESCRIPTION="Create tunnels over TCP/IP networks with shaping, encryption, and compression"
EGIT_REPO_URI="git@github.com:leakingmemory/vtun-ng.git"
SRC_URI="${CARGO_CRATE_URIS}"
HOMEPAGE="https://github.com/leakingmemory/vtun-ng"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~ppc ~sparc ~x86"
IUSE="socks5"

RDEPEND="
	socks5? ( net-proxy/dante )
	dev-libs/openssl:0=
	dev-libs/libbsd"
DEPEND="${RDEPEND}"
BDEPEND="
	app-alternatives/lex
	app-alternatives/yacc
"
CARGO_WORKSPACE_MEMBERS="rust/linkfd"

DOCS=( ChangeLog Credits FAQ README README.Setup README.Shaper TODO )
CONFIG_CHECK="~TUN"

src_unpack() {
	git-r3_src_unpack
	cargo_src_unpack

	pushd "${S}/rust/linkfd" >/dev/null || die
	cargo_gen_config
	popd >/dev/null || die
}

src_prepare() {
	default
	eautoreconf
	sed -i -e '/^LDFLAGS/s|=|+=|g' Makefile.in || die
	sed -i 's:$(BIN_DIR)/strip $(DESTDIR)$(SBIN_DIR)/vtund::' Makefile.in || die
}

src_configure() {
	econf \
		$(use_enable socks5 socks)

	pushd rust/linkfd >/dev/null || die
	cargo_src_configure --offline
	popd >/dev/null || die
}

src_compile() {
	export VTUN_STAT_DIR=/var/log/vtunngd
	export VTUN_LOCK_DIR=/var/lock/vtunngd
	export ENABLE_NAT_HACK=1
	pushd rust/linkfd >/dev/null || die
	cargo_src_compile
	popd >/dev/null || die

	default
}

src_install() {
	default
	newinitd "${FILESDIR}"/vtunng.rc vtunng
	insinto /etc
	doins "${FILESDIR}"/vtunngd-start.conf
	rm -r "${ED}"/var || die
}

src_test() { :; }
