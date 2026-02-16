
EAPI=8

inherit git-r3 cmake

DESCRIPTION="Simplest crypto accounting cli tool for norwegian tax"
HOMEPAGE="https://github.com/leakingmemory/nocryptoaccounting"
EGIT_REPO_URI="https://github.com/leakingmemory/nocryptoaccounting.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-cpp/libxxptime"
RDEPEND="${DEPEND}"

