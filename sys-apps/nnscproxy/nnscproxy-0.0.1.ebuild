
EAPI=8

inherit cmake

DESCRIPTION="nnscproxy: scproxy impl for smartcard login"
HOMEPAGE="https://github.com/leakingmemory/nnscproxy"
SRC_URI="https://github.com/leakingmemory/nnscproxy/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
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

