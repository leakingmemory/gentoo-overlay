
EAPI=8

DESCRIPTION="Libmedfest: Norwegian medication, medical nourishment and disposables database."
HOMEPAGE="https://github.com/leakingmemory/libmedfest"
EGIT_REPO_URI="https://github.com/leakingmemory/libmedfest.git"

LICENSE="GPL"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND=""
DEPEND=""

src_unpack(){
	pwd
	mkdir -p hyperv-guest-tools-0.0.1/tools
	cp -rv /usr/src/linux/tools/hv hyperv-guest-tools-0.0.1/tools
	cp -rv /usr/src/linux/tools/scripts hyperv-guest-tools-0.0.1/tools
	cp -rv /usr/src/linux/tools/build hyperv-guest-tools-0.0.1/tools
}

src_configure() {
	echo 'No configuration'
}

src_compile() {
	cd tools/hv
	make
	cd ../..
}

src_install() {
	cd tools/hv
	default
	cd ../..
}


