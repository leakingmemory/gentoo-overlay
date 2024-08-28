
EAPI=8

inherit cmake

DESCRIPTION="Libmedfest: Norwegian medication, medical nourishment and disposables database."
HOMEPAGE="https://github.com/leakingmemory/libmedfest"
SRC_URI="https://github.com/leakingmemory/libmedfest/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND=">=dev-libs/expat-2.5.0 >=dev-libs/libzip-1.9.2"
DEPEND="${RDEPEND} >=dev-libs/boost-1.84.0"

src_prepare(){
	sed -i -e 's/LIBRARY DESTINATION lib/LIBRARY DESTINATION lib64/' CMakeLists.txt || die sed failed
	cmake_src_prepare
}

src_configure() {
	CMAKE_BUILD_TYPE=Release
	cmake_src_configure
}
