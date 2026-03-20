# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
anstream@1.0.0
anstyle@1.0.14
anstyle-parse@1.0.0
anstyle-query@1.1.5
anstyle-wincon@3.0.11
clap@4.6.0
clap_builder@4.6.0
clap_derive@4.6.0
clap_lex@1.1.0
colorchoice@1.0.5
equivalent@1.0.2
hashbrown@0.16.1
heck@0.5.0
indexmap@2.13.0
is_terminal_polyfill@1.70.2
memchr@2.8.0
once_cell_polyfill@1.70.2
proc-macro2@1.0.106
quote@1.0.45
serde@1.0.228
serde_core@1.0.228
serde_derive@1.0.228
serde_spanned@0.6.9
strsim@0.11.1
syn@2.0.117
toml@0.8.23
toml_datetime@0.6.11
toml_edit@0.22.27
toml_write@0.1.2
unicode-ident@1.0.24
utf8parse@0.2.2
windows-link@0.2.1
windows-sys@0.61.2
winnow@0.7.15
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

DOCS=()
CONFIG_CHECK="~TUN"

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

