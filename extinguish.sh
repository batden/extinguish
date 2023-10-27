#!/bin/bash

# This script helps you cleanly and safely uninstall Enlightenment and related applications.

# EXTINGUISH is written and actively maintained by batden@sfr.fr and carlasensa@sfr.fr.
# This work is licensed under a Creative Commons Attribution-ShareAlike 4.0
# International License, in memory of Aaron Swartz.

# Got a GitHub account? Please consider starring our repositories to show your support.
# Cheers!

ITA="\e[3m"
BDR="\e[1;31m"
OFF="\e[0m"

SCRFLR=$HOME/.elluminate
DDTL=2.0.0

PROG_MN="efl terminology enlightenment ephoto evisum rage express ecrire enventor edi entice enlightenment-module-forecasts eflete"

beep_exit() {
  aplay --quiet /usr/share/sounds/sound-icons/pipe.wav 2>/dev/null
}

remov_preq() {
  echo
  # Questions: Enter either y or n, or press Enter to accept the default value (capital letter).
  if [ -d $ESRC/rlottie ]; then
    read -t 12 -p "Remove rlottie and ddcutil? [Y/n] " answer
    case $answer in
    y | Y)
      cd $ESRC/rlottie
      sudo ninja -C build uninstall &>/dev/null
      cd .. && rm -rf rlottie

      cd $ESRC/ddcutil-$DDTL
      sudo make uninstall &>/dev/null
      cd .. && rm -rf $ESRC/ddcutil-$DDTL
      echo
      ;;
    n | N)
      printf "\n$ITA%s $OFF%s\n\n" "(do not remove prerequisites... OK)"
      ;;
    *)
      cd $ESRC/rlottie
      sudo ninja -C build uninstall &>/dev/null
      cd .. && rm -rf rlottie

      cd $ESRC/ddcutil-$DDTL
      sudo make uninstall &>/dev/null
      cd .. && rm -rf $ESRC/ddcutil-$DDTL
      echo
      ;;
    esac
  fi
}

uninstall_e26() {
  if [ "$XDG_CURRENT_DESKTOP" == "Enlightenment" ]; then
    printf "$BDR%s $OFF%s\n\n" "PLEASE LOG IN TO THE DEFAULT DESKTOP ENVIRONMENT TO EXECUTE THIS SCRIPT."
    beep_exit
    exit 1
  fi

  ESRC=$(cat $HOME/.cache/ebuilds/storepath)

  clear
  printf "\n\n$BDR%s %s\n\n" "* UNINSTALLING ENLIGHTENMENT DESKTOP ENVIRONMENT *"
  printf "$BDR%s $OFF%s\n\n" "This may take a few minutes..."
  sleep 1

  cd $HOME

  for I in $PROG_MN; do
    cd $ESRC/e26/$I
    sudo ninja -C build uninstall &>/dev/null
  done

  cd /etc
  sudo rm -rf enlightenment

  cd /etc/xdg/menus
  sudo rm -rf e-applications.menu

  cd /usr/local
  sudo rm -rf ecore*
  sudo rm -rf edje*
  sudo rm -rf efl*
  sudo rm -rf eio*
  sudo rm -rf eldbus*
  sudo rm -rf elementary*
  sudo rm -rf eo*
  sudo rm -rf evas*

  cd /usr/local/bin
  sudo rm -rf e_paledit*
  sudo rm -rf eina*
  sudo rm -rf efl*
  sudo rm -rf elua*
  sudo rm -rf enventor*
  sudo rm -rf evisum*
  sudo rm -rf eolian*
  sudo rm -rf emotion*
  sudo rm -rf evas*
  sudo rm -rf terminology*
  sudo rm -rf ty*

  cd /usr/local/etc
  sudo rm -rf enlightenment

  cd /usr/local/include
  sudo rm -rf -- *-1
  sudo rm -rf aom
  sudo rm -rf avif
  sudo rm -rf enlightenment
  sudo rm -rf express*
  sudo rm -rf webp*

  cd /usr/local/lib
  sudo rm -rf ecore*
  sudo rm -rf edje*
  sudo rm -rf eeze*
  sudo rm -rf efl*
  sudo rm -rf efreet*
  sudo rm -rf elementary*
  sudo rm -rf emotion*
  sudo rm -rf enlightenment*
  sudo rm -rf ethumb*
  sudo rm -rf evas*
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
  sudo rm -rf libelocation*
  sudo rm -rf libelput*
  sudo rm -rf libelua*
  sudo rm -rf libembryo*
  sudo rm -rf libemile*
  sudo rm -rf libemotion*
  sudo rm -rf libenventor*
  sudo rm -rf libeo*
  sudo rm -rf libeolian*
  sudo rm -rf libephysics*
  sudo rm -rf libethumb*
  sudo rm -rf libevas*

  cd /usr/local/lib/cmake
  sudo rm -rf ddcutil*

  cd /usr/local/lib/x86_64-linux-gnu
  sudo rm -rf ecore*
  sudo rm -rf edje*
  sudo rm -rf eeze*
  sudo rm -rf efl*
  sudo rm -rf efreet*
  sudo rm -rf elementary*
  sudo rm -rf emotion*
  sudo rm -rf enlightenment*
  sudo rm -rf ephoto*
  sudo rm -rf ethumb*
  sudo rm -rf evas*
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
  sudo rm -rf libelocation*
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
  sudo rm -rf librlottie*
  sudo rm -rf rage*

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
  sudo rm -rf Emile*
  sudo rm -rf Ethumb*
  sudo rm -rf Evas*

  cd /usr/local/lib/x86_64-linux-gnu/pkgconfig
  sudo rm -rf ecore*
  sudo rm -rf ector*
  sudo rm -rf edje*
  sudo rm -rf eet*
  sudo rm -rf eeze*
  sudo rm -rf efl*
  sudo rm -rf efreet*
  sudo rm -rf eina*
  sudo rm -rf eio*
  sudo rm -rf eldbus*
  sudo rm -rf elementary*
  sudo rm -rf elocation*
  sudo rm -rf elua*
  sudo rm -rf embryo*
  sudo rm -rf emile*
  sudo rm -rf emotion*
  sudo rm -rf enlightenment*
  sudo rm -rf enventor*
  sudo rm -rf evisum*
  sudo rm -rf eo*
  sudo rm -rf eolian*
  sudo rm -rf ephoto*
  sudo rm -rf ethumb*
  sudo rm -rf evas*
  sudo rm -rf everything*
  sudo rm -rf exactness*
  sudo rm -rf express*
  sudo rm -rf rage*
  sudo rm -rf rlottie*
  sudo rm -rf terminology*

  cd /usr/local/man/man1
  sudo rm -rf terminology*
  sudo rm -rf ty*

  cd /usr/local/share
  sudo rm -rf dbus*
  sudo rm -rf ddcutil*
  sudo rm -rf ecore*
  sudo rm -rf ecrire*
  sudo rm -rf edi*
  sudo rm -rf edje*
  sudo rm -rf eeze*
  sudo rm -rf efl*
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
  sudo sed -i '/enlightenment_filemanager/d' mimeinfo.cache &>/dev/null
  sudo sed -i '/ecrire/d' mimeinfo.cache &>/dev/null
  sudo sed -i '/entice/d' mimeinfo.cache &>/dev/null
  sudo sed -i '/ephoto/d' mimeinfo.cache &>/dev/null
  sudo sed -i '/rage/d' mimeinfo.cache &>/dev/null
  sudo rm -rf e_paledit.desktop
  sudo rm -rf terminology.desktop

  cd /usr/local/share/doc
  sudo rm -rf edi

  cd /usr/local/share/gdb/auto-load/usr/lib
  sudo rm -rf libeo*

  cd /usr/local/share/icons
  sudo rm -rf Enlightenment*
  sudo rm -rf elementary*
  sudo rm -rf terminology*

  cd /usr/local/share/icons/hicolor/128x128/apps
  sudo rm -rf evisum.png
  sudo rm -rf terminology.png

  cd /usr/local/share/info
  sudo rm -rf edi

  cd /usr/share/dbus-1/services
  sudo rm -rf org.enlightenment.Ethumb.service

  cd /usr/share/wayland-sessions &>/dev/null
  sudo rm -rf enlightenment.desktop &>/dev/null

  cd /usr/share/xsessions
  sudo rm -rf enlightenment.desktop

  cd $HOME
  sudo rm -rf $ESRC/e26
  rm -rf $SCRFLR
  rm -rf .e
  rm -rf .e-log*
  rm -rf .elementary
  sudo chattr -i $HOME/.cache/ebuilds/storepath && rm -rf .cache/ebuilds
  rm -rf .cache/efreet
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

  remov_preq

  if [ -f $HOME/.bash_aliases ]; then
    read -t 12 -p "Remove the bash_aliases file? [Y/n] " answer
    case $answer in
    y | Y)
      rm -rf $HOME/.bash_aliases && source $HOME/.bashrc
      sleep 1
      ;;
    n | N)
      printf "\n$ITA%s $OFF%s\n\n" "(do not delete bash_aliases... OK)"
      sleep 1
      ;;
    *)
      echo
      rm -rf $HOME/.bash_aliases && source $HOME/.bashrc
      sleep 1
      ;;
    esac
  fi

  find /usr/local/share/locale/*/LC_MESSAGES 2>/dev/null | while read -r I; do
    echo "$I" |
      xargs sudo rm -rf \
        $(grep -E 'efl|enlightenment|ephoto|evisum|terminology|ecrire|edi|enventor|eflete|forecasts')
  done

  sudo rm -rf /usr/lib/systemd/user/enlightenment.service
  sudo rm -rf /usr/lib/systemd/user/ethumb.service
  sudo systemctl daemon-reload

  sudo rm -rf /usr/lib/libintl.so
  sudo ldconfig
  # Candidates for deletion: Search for “extinguish”, “ebackups” and “pbackups” in your home folder.
}

lo() {
  trap '{ printf "\n$BDR%s $OFF%s\n\n" "KEYBOARD INTERRUPT."; exit 130; }' INT

  uninstall_e26

  printf "\n$BDR%s $OFF%s\n\n" "Done!"
}

lo
