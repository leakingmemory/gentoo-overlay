
EAPI=8

inherit git-r3 cmake

DESCRIPTION="TheMaster: Unofficial software for eresept using sfm basisapi"
HOMEPAGE="https://github.com/leakingmemory/themaster"
EGIT_REPO_URI="https://github.com/leakingmemory/themaster.git"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=">=dev-cpp/cpprestsdk-2.10.18 >=dev-libs/openssl-1.1.1 >=dev-cpp/libsfmbasisapi-0.4.3 >=x11-libs/wxGTK-3.0.4[webkit] >=dev-cpp/nlohmann_json-3.11.3 >=dev-cpp/libjjwtid-0.1.0 >=dev-cpp/libmedfest-1.5.0"
RDEPEND=">=dev-cpp/cpprestsdk-2.10.18 >=dev-libs/openssl-1.1.1 >=dev-cpp/libsfmbasisapi-0.4.3 >=x11-libs/wxGTK-3.0.4[webkit] >=dev-cpp/libjjwtid-0.1.0 >=dev-cpp/libmedfest-1.5.0"

src_configure() {
	CMAKE_BUILD_TYPE=Release
	cmake_src_configure
}
