name="bat"
pkgver="0.23.0"
url="https://github.com/sharkdp/bat/archive/refs/tags/v${pkgver}.tar.gz"
makedepends="cargo libonig-dev pkg-config"
depends=("libonig5")
replace=("bat")
pkgdesc="A cat(1) clone with wings"
hash="30b6256bea0143caebd08256e0a605280afbbc5eef7ce692f84621eb232a9b31"

build() {
  RUSTONIG_SYSTEM_LIBONIG=1 cargo build -j"${NCPU}" --release --locked
}

package() {
  sudo install -Dm755 target/release/bat -t "${pkgdir}/usr/bin"

  sudo install -Dm644 "$(find target -name bat.bash -print -quit)" "${pkgdir}/usr/share/bash-completion/completions/bat"
  sudo install -Dm644 "$(find target -name bat.fish -print -quit)" -t "${pkgdir}/usr/share/fish/vendor_completions.d"
  sudo install -Dm644 "$(find target -name bat.zsh -print -quit)" "${pkgdir}/usr/share/zsh/vendor-completions/_bat"

  gzip -c "$(find target -name bat.1 | head -n1)" > "${name}.1.gz"
  sudo install -Dm644 "${name}.1.gz" -t "${pkgdir}/usr/share/man/man1"

  sudo install -Dm644 LICENSE-MIT -t "${pkgdir}/usr/share/licenses/${name}"
}
