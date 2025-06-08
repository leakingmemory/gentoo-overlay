
EAPI=8

inherit git-r3 cmake

DESCRIPTION="nnscproxy: scproxy impl for smartcard login"
HOMEPAGE="https://github.com/leakingmemory/nnscproxy"
EGIT_REPO_URI="git@github.com:leakingmemory/nnscproxy.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE="systemd"

PATCHES=(
	"${FILESDIR}/nnscproxy-systemd.patch"
)

DEPEND=">=dev-cpp/cpprestsdk-2.10.18 >=dev-libs/openssl-1.1.1 >=sys-apps/pcsc-lite-2.3.3 >=app-crypt/ccid-1.5.5"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		-DWITH_SYSTEMD="$(usex systemd)"
	)
	cmake_src_configure
}

