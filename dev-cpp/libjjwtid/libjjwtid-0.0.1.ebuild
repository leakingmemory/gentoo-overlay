
EAPI=8

inherit cmake

DESCRIPTION="Libjjwtid: Collection of C++ code to deal with JWTs, oidc and signatures."
HOMEPAGE="https://github.com/leakingmemory/libjjwtid"
SRC_URI="https://github.com/leakingmemory/libjjwtid/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=">=dev-cpp/cpprestsdk-2.10.18 >=dev-libs/openssl-1.1.1 >=dev-cpp/nlohmann_json-3.11.2"
RDEPEND=">=dev-cpp/cpprestsdk-2.10.18 >=dev-libs/openssl-1.1.1"

src_prepare(){
	sed -i -e 's/LIBRARY DESTINATION lib/LIBRARY DESTINATION lib64/' CMakeLists.txt || die sed failed
	cmake_src_prepare
}

src_configure() {
	CMAKE_BUILD_TYPE=Release
	cmake_src_configure
}
