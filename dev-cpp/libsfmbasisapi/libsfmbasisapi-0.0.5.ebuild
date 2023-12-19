
EAPI=8

inherit cmake

DESCRIPTION="Libsfmbasisapi: Unofficial library for communicating with SFM BasisAPI, norwegian prescription api. (eresept)"
HOMEPAGE="https://github.com/leakingmemory/libsfmbasisapi"
SRC_URI="https://github.com/leakingmemory/libsfmbasisapi/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=">=dev-cpp/cpprestsdk-2.10.18 >=dev-libs/openssl-1.1.1"
RDEPEND="${DEPEND}"

src_prepare(){
	sed -i -e 's/LIBRARY DESTINATION lib/LIBRARY DESTINATION lib64/' CMakeLists.txt || die sed failed
	cmake_src_prepare
}

src_configure() {
	CMAKE_BUILD_TYPE=Release
	cmake_src_configure
}
