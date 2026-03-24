# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
adler2@2.0.1
aead@0.5.2
ahash@0.8.12
android_system_properties@0.1.5
autocfg@1.5.0
base64@0.22.1
base64ct@1.8.0
bitvec@1.0.1
block-buffer@0.10.4
bson@3.1.0
bumpalo@3.19.0
cc@1.2.32
cfg-if@1.0.4
chacha20@0.9.1
chacha20poly1305@0.10.1
chrono@0.4.44
cipher@0.4.4
const-oid@0.9.6
core-foundation-sys@0.8.7
cpufeatures@0.2.17
crc32fast@1.5.0
crypto-common@0.1.7
darling@0.21.3
darling_core@0.21.3
darling_macro@0.21.3
der@0.7.10
deranged@0.5.5
digest@0.10.7
dyn-clone@1.0.20
equivalent@1.0.2
flate2@1.1.9
fnv@1.0.7
funty@2.0.0
generic-array@0.14.7
getopts@0.2.24
getrandom@0.2.16
getrandom@0.3.4
hashbrown@0.12.3
hashbrown@0.16.1
hex@0.4.3
iana-time-zone@0.1.64
iana-time-zone-haiku@0.1.2
ident_case@1.0.1
indexmap@1.9.3
indexmap@2.12.1
inout@0.1.4
itoa@1.0.15
js-sys@0.3.83
lazy_static@1.5.0
libc@0.2.183
libm@0.2.15
log@0.4.28
memchr@2.7.5
miniz_oxide@0.8.9
num-bigint-dig@0.8.6
num-conv@0.1.0
num-integer@0.1.46
num-iter@0.1.45
num-traits@0.2.19
once_cell@1.21.3
opaque-debug@0.3.1
pem-rfc7468@0.7.0
pkcs1@0.7.5
pkcs8@0.10.2
poly1305@0.8.0
powerfmt@0.2.0
ppv-lite86@0.2.21
proc-macro2@1.0.103
quote@1.0.42
r-efi@5.3.0
radium@0.7.0
rand@0.8.5
rand@0.9.2
rand_chacha@0.3.1
rand_chacha@0.9.0
rand_core@0.6.4
rand_core@0.9.3
ref-cast@1.0.25
ref-cast-impl@1.0.25
rsa@0.9.10
rustversion@1.0.22
ryu@1.0.20
schemars@0.9.0
schemars@1.1.0
serde@1.0.228
serde_bytes@0.11.19
serde_core@1.0.228
serde_derive@1.0.228
serde_json@1.0.145
serde_with@3.16.1
serde_with_macros@3.16.1
sha2@0.10.9
shlex@1.3.0
signature@2.2.0
simd-adler32@0.3.8
simdutf8@0.1.5
smallvec@1.15.1
spin@0.9.8
spki@0.7.3
strsim@0.11.1
subtle@2.6.1
syn@2.0.111
tap@1.0.1
thiserror@2.0.17
thiserror-impl@2.0.17
time@0.3.44
time-core@0.1.6
time-macros@0.2.24
typenum@1.19.0
unicode-ident@1.0.22
unicode-width@0.2.2
universal-hash@0.5.1
uuid@1.18.1
version_check@0.9.5
wasi@0.11.1+wasi-snapshot-preview1
wasip2@1.0.1+wasi-0.2.4
wasm-bindgen@0.2.106
wasm-bindgen-macro@0.2.106
wasm-bindgen-macro-support@0.2.106
wasm-bindgen-shared@0.2.106
windows-core@0.62.2
windows-implement@0.60.2
windows-interface@0.59.3
windows-link@0.2.1
windows-result@0.4.1
windows-strings@0.5.1
wit-bindgen@0.46.0
wyz@0.5.1
zerocopy@0.8.30
zerocopy-derive@0.8.30
zeroize@1.8.2
"

inherit cargo git-r3 systemd

DESCRIPTION="Create mesh VPNs"
EGIT_REPO_URI="https://github.com/leakingmemory/meshroute.git"
SRC_URI="${CARGO_CRATE_URIS}"
HOMEPAGE="https://github.com/leakingmemory/meshroute"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="systemd"

DOCS=()
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
	systemd_newunit "${S}"/scripts/meshroute.service.systemd meshroute@.service
}

