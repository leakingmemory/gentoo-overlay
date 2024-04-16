
EAPI=8

inherit cmake

DESCRIPTION="TheMaster: Unofficial software for eresept using sfm basisapi"
HOMEPAGE="https://github.com/leakingmemory/themaster"
SRC_URI="https://github.com/leakingmemory/themaster/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=">=dev-cpp/cpprestsdk-2.10.18 >=dev-libs/openssl-1.1.1 >=dev-cpp/libsfmbasisapi-0.1.4 >=x11-libs/wxGTK-3.0.4[webkit] >=dev-cpp/nlohmann_json-3.11.2 >=dev-cpp/libjjwtid-0.0.6 >=dev-cpp/libmedfest-0.0.15"
RDEPEND=">=dev-cpp/cpprestsdk-2.10.18 >=dev-libs/openssl-1.1.1 >=dev-cpp/libsfmbasisapi-0.1.4 >=x11-libs/wxGTK-3.0.4[webkit] >=dev-cpp/libjjwtid-0.0.6 >=dev-cpp/libmedfest-0.0.15"

src_configure() {
	CMAKE_BUILD_TYPE=Release
	cmake_src_configure
}
