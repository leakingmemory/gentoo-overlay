
EAPI=8

inherit git-r3 cmake xdg-utils

DESCRIPTION="Linux Audit Manager, and AppArmor profiler"
HOMEPAGE="https://github.com/leakingmemory/linuxauditmgr"
EGIT_REPO_URI="https://github.com/leakingmemory/linuxauditmgr.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=x11-libs/wxGTK-3.0.4"
RDEPEND="${DEPEND}"

pkg_postinst() {
	xdg_icon_cache_update
}

pkg_postrm() {
	xdg_icon_cache_update
}

