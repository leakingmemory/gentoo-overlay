# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Cpprestsdk is a Microsoft project for cloud-based client-server communication in native code using a modern asynchronous C++ API design."

HOMEPAGE="https://github.com/microsoft/cpprestsdk"
SRC_URI="https://github.com/microsoft/cpprestsdk/archive/refs/tags/v${PV}.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=">=dev-libs/openssl-1.1.1q
		>=dev-libs/boost-1.80.0-r1
		>=sys-libs/zlib-1.2.13-r1"

DEPEND="${RDEPEND}"

BDEPEND=">=dev-util/cmake-3.23
		>=dev-util/ninja-1.11.1-r2
		>=sys-devel/gcc-11.3.0
		>=virtual/pkgconfig-2-r1
		>=dev-cpp/websocketpp-0.8.2"

PATCHES=(
	"${FILESDIR}"/cpprestsdk-2.10.18-warnings.patch
)

src_prepare(){
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=( -DCMAKE_BUILD_TYPE=Release )
	cmake_src_configure
}


src_compile(){
	cmake_src_compile
}

src_install(){
	cmake_src_install
}
