#!/bin/bash
# shellcheck disable=SC1091 disable=SC2164

# This script will help you uninstall Enlightenment and related applications cleanly and safely.

# Note that the binary dependencies (dev packages) are preserved for system consistency.
# There is no safe way to remove them automatically, without close supervision
# by the user.

# EXTINGUISH.SH is licensed under a Creative Commons Attribution 4.0 International License,
# in memory of Aaron Swartz.
# See https://creativecommons.org/licenses/by/4.0/

# If you find our scripts useful, please consider starring our repositories or
# donating with PayPal (see README.md) to show your support.
# Thank you!

red_bright="\e[1;38;5;1m"
italic="\e[3m"
off="\e[0m"

scrflr=$HOME/.elluminate
ddctl=2.2.0

prog_mn=(
  terminology
  enlightenment
  ephoto
  rage
  evisum
  express
  ecrire
  enventor
  edi
  entice
  enlightenment-module-forecasts
  enlightenment-module-penguins
  enlightenment-module-places
  eflete
  efl
)

beep_exit() {
  aplay --quiet /usr/share/sounds/sound-icons/pipe.wav
}

# Removes prerequisites.
remov_preq() {
  echo

  if [ -d "$esrc"/rlottie ]; then
    read -r -t 12 -p "Remove rlottie? [Y/n] " answer
    case $answer in
    y | Y)
      cd "$esrc"/rlottie
      sudo ninja -C build uninstall
      cd .. && rm -rf rlottie
      sudo rm -rf /usr/local/lib/x86_64-linux-gnu/pkgconfig/rlottie.pc
      echo
      ;;
    n | N)
      printf "\n$italic%s $off%s\n\n" "(do not remove rlottie... OK)"
      ;;
    *)
      cd "$esrc"/rlottie
      echo
      sudo ninja -C build uninstall
      cd .. && rm -rf rlottie
      sudo rm -rf /usr/local/lib/x86_64-linux-gnu/pkgconfig/rlottie.pc
      echo
      ;;
    esac
  fi

  if [ -d "$esrc"/ddcutil-$ddctl ]; then
    read -r -t 12 -p "Remove ddcutil? [Y/n] " answer
    case $answer in
    y | Y)
      cd "$esrc"/ddcutil-$ddctl
      sudo make uninstall
      cd .. && rm -rf "$esrc"/ddcutil-$ddctl
      rm -rf "$HOME"/.cache/ddcutil
      sudo rm -rf /usr/local/lib/cmake/ddcutil
      sudo rm -rf /usr/local/share/ddcutil
      echo
      ;;
    n | N)
      printf "\n$italic%s $off%s\n\n" "(do not remove ddcutil... OK)"
      ;;
    *)
      cd "$esrc"/ddcutil-$ddctl
      echo
      sudo make uninstall
      cd .. && rm -rf "$esrc"/ddcutil-$ddctl
      rm -rf "$HOME"/.cache/ddcutil
      sudo rm -rf /usr/local/lib/cmake/ddcutil
      sudo rm -rf /usr/local/share/ddcutil
      echo
      ;;
    esac
  fi
}

# Cleans up any leftover files after uninstalling Enlightenment and related applications.
del_list() {
  cd /etc
  sudo rm -rf enlightenment

  cd /etc/xdg/menus
  sudo rm -rf e-applications.menu

  cd /usr/local/bin
  sudo rm -rf efl*

  cd /usr/local/include
  sudo rm -rf -- *-1
  sudo rm -rf enlightenment
  sudo rm -rf express-0

  cd /usr/local/lib/x86_64-linux-gnu
  sudo rm -rf ecore*
  sudo rm -rf edje*
  sudo rm -rf eeze*
  sudo rm -rf efreet*
  sudo rm -rf elementary*
  sudo rm -rf emotion*
  sudo rm -rf enlightenment*
  sudo rm -rf ephoto*
  sudo rm -rf ethumb*
  sudo rm -rf evas*
  sudo rm -rf rage*
  sudo rm -rf libecore*
  sudo rm -rf libector*
  sudo rm -rf libedje*
  sudo rm -rf libeet*
  sudo rm -rf libeeze*
  sudo rm -rf libefl*
  sudo rm -rf libefreet*
  sudo rm -rf libeina*
  sudo rm -rf libeio*
  sudo rm -rf libeldbus*
  sudo rm -rf libelementary*
  sudo rm -rf libelput*
  sudo rm -rf libelua*
  sudo rm -rf libembryo*
  sudo rm -rf libemile*
  sudo rm -rf libemotion*
  sudo rm -rf libeo*
  sudo rm -rf libeolian*
  sudo rm -rf libethumb*
  sudo rm -rf libevas*
  sudo rm -rf libexactness*

  cd /usr/local/lib/x86_64-linux-gnu/cmake
  sudo rm -rf Ecore*
  sudo rm -rf Edje*
  sudo rm -rf Eet*
  sudo rm -rf Eeze*
  sudo rm -rf Efl*
  sudo rm -rf Efreet
  sudo rm -rf Eina*
  sudo rm -rf Eio*
  sudo rm -rf Eldbus*
  sudo rm -rf Elementary*
  sudo rm -rf Elua*
  sudo rm -rf Emile*
  sudo rm -rf Emotion*
  sudo rm -rf Eo*
  sudo rm -rf Eolian*
  sudo rm -rf Ethumb*
  sudo rm -rf Evas*

  cd /usr/local/lib/x86_64-linux-gnu/pkgconfig
  sudo rm -rf ecore*
  sudo rm -rf efl*

  cd /usr/local/share
  sudo rm -rf ecore*
  sudo rm -rf ecrire*
  sudo rm -rf edi*
  sudo rm -rf edje*
  sudo rm -rf eeze*
  sudo rm -rf eflete*
  sudo rm -rf efreet*
  sudo rm -rf elementary*
  sudo rm -rf elua*
  sudo rm -rf embryo*
  sudo rm -rf emotion*
  sudo rm -rf enlightenment*
  sudo rm -rf entice*
  sudo rm -rf enventor*
  sudo rm -rf evisum*
  sudo rm -rf eo*
  sudo rm -rf eolian*
  sudo rm -rf ephoto*
  sudo rm -rf ethumb*
  sudo rm -rf evas*
  sudo rm -rf exactness*
  sudo rm -rf express*
  sudo rm -rf rage*
  sudo rm -rf terminology*
  sudo rm -rf wayland-sessions*

  cd /usr/local/share/applications
  sudo sed -i '/enlightenment_filemanager/d' mimeinfo.cache
  sudo sed -i '/ecrire/d' mimeinfo.cache
  sudo sed -i '/entice/d' mimeinfo.cache
  sudo sed -i '/ephoto/d' mimeinfo.cache
  sudo sed -i '/rage/d' mimeinfo.cache
  sudo rm -rf enlightenment_paledit.desktop
  sudo rm -rf evisum_cpu.desktop
  sudo rm -rf evisum_mem.desktop
  sudo rm -rf terminology.desktop

  cd /usr/local/share/doc
  sudo rm -rf edi

  cd /usr/local/share/gdb/auto-load/usr/lib
  sudo rm -rf libeo*

  cd /usr/local/share/icons
  sudo rm -rf Enlightenment*

  cd /usr/local/share/info
  sudo rm -rf edi

  cd /usr/share/dbus-1/services
  sudo rm -rf org.enlightenment.Ethumb.service

  cd /usr/share/wayland-sessions
  sudo rm -rf enlightenment.desktop

  cd /usr/share/xsessions
  sudo rm -rf enlightenment.desktop

  cd "$HOME"
  sudo rm -rf "$esrc"/e26
  rm -rf "$scrflr"
  rm -rf .e
  rm -rf .e-log*
  rm -rf .elementary
  sudo chattr -i "$HOME"/.cache/ebuilds/storepath && rm -rf .cache/ebuilds
  rm -rf .cache/efreet
  rm -rf .cache/entice
  rm -rf .cache/ephoto
  rm -rf .cache/evas_gl_common_caches
  rm -rf .cache/rage
  rm -rf .config/ecrire.cfg
  rm -rf .config/edi
  rm -rf .config/eflete
  rm -rf .config/entice
  rm -rf .config/enventor
  rm -rf .config/ephoto
  rm -rf .config/evisum
  rm -rf .config/express
  rm -rf .config/rage
  rm -rf .config/terminology
  rm -rf .local/bin/elluminate.sh
}

final_stp() {
  if [ -f "$HOME"/.bash_aliases ]; then
    read -r -t 12 -p "Remove the .bash_aliases file? [Y/n] " answer
    case $answer in
    y | Y)
      rm -rf "$HOME"/.bash_aliases && source "$HOME"/.bashrc
      sleep 1
      ;;
    n | N)
      printf "\n$italic%s $off%s\n\n" "(do not delete .bash_aliases... OK)"
      sleep 1
      ;;
    *)
      echo
      rm -rf "$HOME"/.bash_aliases && source "$HOME"/.bashrc
      sleep 1
      ;;
    esac
  fi

  sudo rm -rf /usr/lib/systemd/user/enlightenment.service
  sudo rm -rf /usr/lib/systemd/user/ethumb.service
  sudo rm -rf /usr/lib/libintl.so
  sudo systemctl daemon-reload
  sudo ldconfig

  # Also removes the translation files.
  find /usr/local/share/locale/*/LC_MESSAGES | while read -r I; do
    echo "$I" |
      xargs sudo rm -rf \
        "$(grep -E 'efl|enlightenment|ephoto|evisum|terminology|ecrire|edi|enventor|eflete|forecasts|
        e-module-penguins|e-module-places')"
  done
}

uninstall_e26() {
  if [ "$XDG_CURRENT_DESKTOP" == "Enlightenment" ]; then
    printf "$red_bright%s $off%s\n\n" "PLEASE LOG IN TO THE DEFAULT DESKTOP ENVIRONMENT TO EXECUTE THIS SCRIPT."
    beep_exit
    exit 1
  fi

  if [ -x /usr/bin/wmctrl ]; then
    if [ "$XDG_SESSION_TYPE" == "x11" ]; then
      wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
    fi
  fi

  esrc=$(cat "$HOME"/.cache/ebuilds/storepath)

  clear
  printf "\n\n$red_bright%s %s\n\n" "* UNINSTALLING ENLIGHTENMENT DESKTOP ENVIRONMENT *"
  sleep 1
  printf "$red_bright%s $off%s\n\n" "You will be prompted to answer some basic questions..."
  sleep 2

  cd "$HOME"

  for I in "${prog_mn[@]}"; do
    cd "$esrc"/e26/"$I"
    sudo ninja -C build uninstall
    echo
  done

  remov_preq
  del_list
  final_stp
}

lo() {
  trap '{ printf "\n$red_bright%s $off%s\n\n" "KEYBOARD INTERRUPT."; exit 130; }' SIGINT

  uninstall_e26

  printf "\n\n$red_bright%s %s\n" "Done."
  printf "$red_bright%s $off%s\n\n" 'Candidates for further deletion: Search for "extinguish" and "ebackups" in your home folder.'
}

lo
