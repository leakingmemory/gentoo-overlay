
EAPI=8

inherit cmake

DESCRIPTION="TheMaster: Unofficial sfm basisapi fake for testing purposes"
HOMEPAGE="https://github.com/leakingmemory/sfmbasisfaker"
SRC_URI="https://github.com/leakingmemory/sfmbasisfaker/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=">=dev-cpp/cpprestsdk-2.10.18 >=dev-libs/openssl-1.1.1 >=dev-cpp/libsfmbasisapi-0.1.3 >=dev-cpp/libjjwtid-0.0.6"
RDEPEND="${DEPEND}"

src_configure() {
	CMAKE_BUILD_TYPE=Release
	cmake_src_configure
}
