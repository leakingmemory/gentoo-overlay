
EAPI=8

inherit cmake

DESCRIPTION="Terminal redirect and logger"
HOMEPAGE="https://github.com/leakingmemory/ptyredirect"
SRC_URI="https://github.com/leakingmemory/ptyredirect/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

