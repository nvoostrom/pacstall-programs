name="rhino-setup-git"
url="https://github.com/rhino-linux/rhino-setup.git"
pkgver="2023.1"
makedepends=("libgtk-4-dev" "libadwaita-1-dev" "gettext" "desktop-file-utils" "rustc" "cargo" "meson" "ninja-build")
depends=("libgtk-4-dev" "libadwaita-1-dev" "gettext" "desktop-file-utils")
gives="rhino-setup"
replaces="${gives}-bin"
pkgdesc="Rhino Linux Setup Prompt"
maintainer="Sourajyoti Basak <wiz28@protonmail.com>, Oren Klopfer <oren@taumoda.com>"
incompatible=("debian:*")
pkgver() {
  git ls-remote "${url}" master | cut -f1 | cut -c1-8
}

build() {
  sudo meson build
}

package() {
  sudo DESTDIR="${pkgdir}" ninja -C build install
}

post_install() {
  if ! [[ -d "${homedir}/.config/autostart" ]]; then
    mkdir -p "${homedir}/.config/autostart"
  fi
  if ! [[ -f "${homedir}/.config/autostart/rhino-setup.desktop" ]]; then
    sudo ln -sf "/usr/local/share/applications/org.rhinolinux.RhinoSetup.desktop" "${homedir}/.config/autostart/rhino-setup.desktop"
  fi
}

post_remove() {
  if [[ -f "${homedir}/.config/autostart/rhino-setup.desktop" ]]; then
    sudo rm -f "${homedir}/.config/autostart/rhino-setup.desktop"
  fi
}
