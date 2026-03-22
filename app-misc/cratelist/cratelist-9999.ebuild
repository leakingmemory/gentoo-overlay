# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
adler2@2.0.1
anstream@1.0.0
anstyle@1.0.14
anstyle-parse@1.0.0
anstyle-query@1.1.5
anstyle-wincon@3.0.11
cfg-if@1.0.4
clap@4.6.0
clap_builder@4.6.0
clap_derive@4.6.0
clap_lex@1.1.0
colorchoice@1.0.5
crc32fast@1.5.0
equivalent@1.0.2
flate2@1.1.9
hashbrown@0.16.1
heck@0.5.0
indexmap@2.13.0
is_terminal_polyfill@1.70.2
itoa@1.0.18
memchr@2.8.0
miniz_oxide@0.8.9
once_cell_polyfill@1.70.2
proc-macro2@1.0.106
quote@1.0.45
serde@1.0.228
serde_core@1.0.228
serde_derive@1.0.228
serde_json@1.0.149
serde_spanned@1.0.4
simd-adler32@0.3.8
strsim@0.11.1
syn@2.0.117
toml@1.0.7+spec-1.1.0
toml_datetime@1.0.1+spec-1.1.0
toml_parser@1.0.10+spec-1.1.0
toml_writer@1.0.7+spec-1.1.0
unicode-ident@1.0.24
utf8parse@0.2.2
windows-link@0.2.1
windows-sys@0.61.2
winnow@1.0.0
zmij@1.0.21
"

inherit cargo git-r3 systemd

DESCRIPTION="List dependencies from Cargo.lock for various packaging"
EGIT_REPO_URI="https://github.com/leakingmemory/cratelist.git"
SRC_URI="${CARGO_CRATE_URIS}"
HOMEPAGE="https://github.com/leakingmemory/cratelist"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DOCS=(README.md SECURITY.md)
CONFIG_CHECK="~TUN"
RUST_MIN_VER="1.85.0"

src_unpack() {
	git-r3_src_unpack
	cargo_src_unpack

	pushd "${S}" >/dev/null || die
	cargo_gen_config
	popd >/dev/null || die
}

src_install() {
	export INSTALL_PREFIX="${D}"
	export DESTDIR=/
	./install.sh
}

