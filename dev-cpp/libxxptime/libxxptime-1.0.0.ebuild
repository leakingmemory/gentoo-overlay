
EAPI=8

inherit cmake

DESCRIPTION="Mainly for interfacing with CSharp"
HOMEPAGE="https://github.com/leakingmemory/libxxptime"
SRC_URI="https://github.com/leakingmemory/libxxptime/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

