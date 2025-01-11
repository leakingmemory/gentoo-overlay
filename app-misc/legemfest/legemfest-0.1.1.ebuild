
EAPI=8

inherit cmake

DESCRIPTION="Legemfest: Tools for libmedfest FEST databases"
HOMEPAGE="https://github.com/leakingmemory/legemfest"
SRC_URI="https://github.com/leakingmemory/legemfest/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=">=dev-cpp/libmedfest-0.0.2"
RDEPEND=">=dev-cpp/libmedfest-0.0.1"

src_configure() {
	CMAKE_BUILD_TYPE=Release
	cmake_src_configure
}
