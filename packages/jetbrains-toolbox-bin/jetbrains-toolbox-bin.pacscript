name="jetbrains-toolbox-bin"
pkgname="jetbrains-toolbox"
pkgver="2.0.2.16660"
breaks=("${pkgname}" "${pkgname}-git" "${pkgname}-deb" "${pkgname}-app")
replace=("${pkgname}")
gives="${pkgname}"
pkgdesc="JetBrains Toolbox is a suite of professional development tools for a range of languages and technologies using JetBrains IDEs"
maintainer="Paul Cosma (saenai) <paul.cosma97@gmail.com>"
hash="c3a50186d9a1d350a42e4972c9026e8fe63eb054488e88e8be104d9d2e0bf858"
url="https://download-cdn.jetbrains.com/toolbox/${pkgname}-${pkgver}.tar.gz"

package() {
  sudo mkdir -p "${pkgdir}/usr/bin"
  sudo mv "./${pkgname}" "${pkgdir}/usr/bin"
}
