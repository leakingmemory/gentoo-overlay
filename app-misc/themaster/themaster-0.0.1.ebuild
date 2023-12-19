
EAPI=8

inherit cmake

DESCRIPTION="TheMaster: Unofficial software for eresept using sfm basisapi"
HOMEPAGE="https://github.com/leakingmemory/themaster"
SRC_URI="https://github.com/leakingmemory/themaster/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=">=dev-cpp/cpprestsdk-2.10.18 >=dev-libs/openssl-1.1.1 >=dev-cpp/libsfmbasisapi-0.0.5 >=x11-libs/wxGTK-3.0.4"
RDEPEND="${DEPEND}"

src_configure() {
	CMAKE_BUILD_TYPE=Release
	cmake_src_configure
}
