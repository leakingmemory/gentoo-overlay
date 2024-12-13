
EAPI=8

inherit cmake

DESCRIPTION="SOCI - The C++ Database Access Library"
HOMEPAGE="https://sourceforge.net/projects/soci/"
SRC_URI="https://sourceforge.net/projects/soci/files/soci/soci-4.0.3/${P}.tar.gz/download -> ${P}.tar.gz"

LICENSE="Boost-1.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="odbc sqlite oracle postgres mysql"

CMAKE_SKIP_TESTS=(
	soci_odbc_test_mssql
	soci_odbc_test_mssql_static
	soci_odbc_test_mysql
	soci_odbc_test_mysql_static
	soci_odbc_test_postgresql
	soci_odbc_test_postgresql_static
	soci_postgresql_test
	soci_postgresql_test_static
)

RDEPEND="
	>=dev-libs/boost-1.85.0-r1
	odbc? ( dev-db/unixODBC )
	sqlite? ( dev-db/sqlite )
	oracle? ( dev-db/oracle-instantclient[sdk] )
	postgres? ( dev-db/postgresql )
	mysql? ( dev-db/mysql )
"
DEPEND="${RDEPEND}"

