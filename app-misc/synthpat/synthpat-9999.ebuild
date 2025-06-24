
EAPI=8

inherit git-r3 cmake

DESCRIPTION="Synthpat: For creating patients in testsys"
HOMEPAGE="https://github.com/leakingmemory/synthpat"
EGIT_REPO_URI="git@github.com:leakingmemory/synthpat.git"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=dev-cpp/cpprestsdk-2.10.18 >=dev-libs/openssl-1.1.1 >=x11-libs/wxGTK-3.0.4 >=dev-db/soci-4.0.3[oracle] >=net-libs/gsoap-2.8.130-r1"
RDEPEND="${DEPEND}"

