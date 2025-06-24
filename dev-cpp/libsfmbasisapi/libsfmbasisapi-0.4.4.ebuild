
EAPI=8

inherit cmake

DESCRIPTION="Libsfmbasisapi: Unofficial library for communicating with SFM BasisAPI, norwegian prescription api. (eresept)"
HOMEPAGE="https://github.com/leakingmemory/libsfmbasisapi"
SRC_URI="https://github.com/leakingmemory/libsfmbasisapi/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=dev-cpp/nlohmann_json-3.11.3"
RDEPEND=""

src_configure() {
	CMAKE_BUILD_TYPE=Release
	cmake_src_configure
}
