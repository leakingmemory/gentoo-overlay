
EAPI=8

inherit git-r3 cmake

DESCRIPTION="Libmedfest: Norwegian medication, medical nourishment and disposables database."
HOMEPAGE="https://github.com/leakingmemory/libmedfest"
EGIT_REPO_URI="https://github.com/leakingmemory/libmedfest.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND=">=dev-libs/expat-2.5.0 >=dev-libs/libzip-1.9.2"
DEPEND="${RDEPEND} >=dev-libs/boost-1.84.0"

CFLAGS+=" -g "
CXXFLAGS+=" -g "

src_prepare(){
	sed -i -e 's/LIBRARY DESTINATION lib/LIBRARY DESTINATION lib64/' CMakeLists.txt || die sed failed
	cmake_src_prepare
}

src_configure() {
	CMAKE_BUILD_TYPE=Debug
	cmake_src_configure
}
