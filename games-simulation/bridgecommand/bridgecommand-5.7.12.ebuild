
EAPI=8

inherit cmake

DESCRIPTION="Interactive 3d ship & radar simulator"
HOMEPAGE="https://github.com/bridgecommand/bc"
SRC_URI="https://github.com/bridgecommand/bc/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}/bc-${PV}/src"

PATCHES=(
	"${FILESDIR}/${P}-system-irrlicht.patch"
	"${FILESDIR}/${P}-irr-missing-vscrollbar.patch"
	"${FILESDIR}/${P}-cmakefiles.patch"
	"${FILESDIR}/${P}-bcterr-heightmap.patch"
)

src_prepare(){
	cmake_src_prepare
}

src_configure() {
	CMAKE_BUILD_TYPE=Release
	cmake_src_configure
}

src_install() {
	cmake_src_install
	mkdir -p "${D}/usr/share/bridgecommand"
	cd "${WORKDIR}/bc-${PV}/bin" && cp -rvp LICENSE Models README Scenarios Sounds World controller editor iniEditor media multiplayerHub repeater shaders tidalData.m "${ED}/usr/share/bridgecommand"
	cd "${WORKDIR}/bc-${PV}/bin" && cp -vp *.ini *.txt "${ED}/usr/share/bridgecommand"
}
