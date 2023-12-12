
EAPI=8

inherit cmake

DESCRIPTION="Libsfmbasisapi: Unofficial library for communicating with SFM BasisAPI, norwegian prescription api. (eresept)"
HOMEPAGE="https://github.com/leakingmemory/libsfmbasisapi"
SRC_URI="https://github.com/leakingmemory/libsfmbasisapi/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="AGPL"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_configure() {
    local mycmakeargs=(
        "-DCMAKE_BUILD_TYPE=Release"
    )

    cmake_src_configure
}