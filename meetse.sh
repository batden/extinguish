#!/bin/bash

# This Bash script helps you cleanly uninstall Enlightenment and related applications.
# Alternatively, you can use it to fix issues like Meson version mismatch errors,
# without uninstalling everything.

# MEETSE.SH is written and maintained by batden@sfr.fr and carlasensa@sfr.fr,
# feel free to use this script as you see fit.
# Please consider starring our repositories to show your support.
# Cheers!

ITA="\e[3m"
BDR="\e[1;31m"
BDY="\e[1;33m"
OFF="\e[0m"

DOCDIR=$(xdg-user-dir DOCUMENTS)
SCRFLR=$HOME/.esteem
SNIN="sudo ninja -C build install"
LWEB=libwebp-1.2.1
LAVF=0.9.3
DDTL=1.2.1

PROG_MN="efl terminology enlightenment ephoto evisum rage express ecrire enventor edi entice"

beep_exit() {
  paplay /usr/share/sounds/freedesktop/stereo/suspend-error.oga
}

# Hints.
# 1: Uninstall the whole Enlightenment desktop environment.
# 2: Delete the Meson build folders and build anew everything that needs to be rebuilt.
# 3: Restore earlier versions of Meson builddirs.
#
sel_menu() {
  if [ $INPUT -lt 1 ]; then
    echo
    printf "1  $BDR%s $OFF%s\n\n" "Uninstall Enlightenment now"
    printf "2  $BDY%s $OFF%s\n\n" "Fix Meson errors and rebuild"
    printf "3  $BDY%s $OFF%s\n\n" "Restore Meson builddirs from backup"

    sleep 1 && printf "$ITA%s $OFF%s\n\n" "Or press Ctrl+C to quit."
    read INPUT
  fi
}

remov_preq() {
  if [ -d $ESRC/rlottie ]; then
    echo
    read -t 12 -p "Remove rlottie, libavif, aom, libwebp and ddcutil? [Y/n] " answer
    case $answer in
    [yY])
      cd $ESRC/rlottie
      sudo ninja -C build uninstall &>/dev/null
      cd .. && rm -rf rlottie

      cd $ESRC/libavif-$LAVF/build
      xargs sudo rm -rf <install_manifest.txt
      cd ../.. && rm -rf libavif-$LAVF

      cd $ESRC/aom/aom-build
      xargs sudo rm -rf <install_manifest.txt
      cd ../.. && rm -rf aom

      cd $ESRC/$LWEB
      sudo make uninstall &>/dev/null
      cd .. && rm -rf $ESRC/$LWEB
      sudo rm -rf /usr/local/bin/cwebp
      sudo rm -rf /usr/local/bin/dwebp
      echo

      cd $ESRC/ddcutil-$DDTL
      sudo make uninstall &>/dev/null
      cd .. && rm -rf $ESRC/ddcutil-$DDTL
      echo
      ;;
    [nN])
      printf "\n$ITA%s $OFF%s\n\n" "(do not remove prerequisites... OK)"
      ;;
    *)
      cd $ESRC/rlottie
      sudo ninja -C build uninstall &>/dev/null
      cd .. && rm -rf rlottie

      cd $ESRC/libavif-$LAVF/build
      xargs sudo rm -rf <install_manifest.txt
      cd ../.. && rm -rf libavif-$LAVF

      cd $ESRC/aom/aom-build
      xargs sudo rm -rf <install_manifest.txt
      cd ../.. && rm -rf aom

      cd $ESRC/$LWEB
      sudo make uninstall &>/dev/null
      cd .. && rm -rf $ESRC/$LWEB
      sudo rm -rf /usr/local/bin/cwebp
      sudo rm -rf /usr/local/bin/dwebp
      echo

      cd $ESRC/ddcutil-$DDTL
      sudo make uninstall &>/dev/null
      cd .. && rm -rf $ESRC/ddcutil-$DDTL
      echo
      ;;
    esac
  fi
}

uninstall_e25() {
  if [ "$XDG_CURRENT_DESKTOP" == "Enlightenment" ]; then
    printf "$BDR%s $OFF%s\n\n" "PLEASE LOG IN TO THE DEFAULT DESKTOP ENVIRONMENT TO EXECUTE THIS SCRIPT."
    beep_exit
    exit 1
  fi

  ESRC=$(cat $HOME/.cache/ebuilds/storepath)

  clear
  printf "\n\n$BDR%s $OFF%s\n\n" "* UNINSTALLING ENLIGHTENMENT DESKTOP *"

  cd $HOME

  for I in $PROG_MN; do
    cd $ESRC/e25/$I
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
  rm -rf .e
  rm -rf .e-log*
  rm -rf .elementary
  rm -rf .cache/efreet
  rm -rf .cache/ephoto
  rm -rf .cache/evas_gl_common_caches
  rm -rf .cache/rage
  rm -rf .config/ecrire.cfg
  rm -rf .config/edi
  rm -rf .config/entice
  rm -rf .config/enventor
  rm -rf .config/ephoto
  rm -rf .config/evisum
  rm -rf .config/express
  rm -rf .config/rage
  rm -rf .config/terminology
  rm -rf .local/bin/esteem.sh

  if [ -d $HOME/.cache/ccache ]; then
    echo
    read -t 12 -p "Remove the ccache folder? [y/N] " answer
    case $answer in
    [yY])
      ccache -C
      rm -rf $HOME/.cache/ccache
      echo
      ;;
    [nN])
      printf "\n$ITA%s $OFF%s\n\n" "(do not delete the ccache folder... OK)"
      echo
      ;;
    *)
      printf "\n$ITA%s $OFF%s\n\n" "(do not delete the ccache folder... OK)"
      echo
      ;;
    esac
  fi

  if [ -d $HOME/.ccache ]; then
    echo
    read -t 12 -p "Remove the ccache folder? [y/N] " answer
    case $answer in
    [yY])
      ccache -C
      rm -rf $HOME/.ccache
      echo
      ;;
    [nN])
      printf "\n$ITA%s $OFF%s\n\n" "(do not delete the ccache folder... OK)"
      echo
      ;;
    *)
      printf "\n$ITA%s $OFF%s\n\n" "(do not delete the ccache folder... OK)"
      echo
      ;;
    esac
  fi

  if [ -f $HOME/.bash_aliases ]; then
    read -t 12 -p "Remove the bash_aliases file? [Y/n] " answer
    case $answer in
    [yY])
      rm -rf $HOME/.bash_aliases && source $HOME/.bashrc
      sleep 1
      ;;
    [nN])
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
        $(grep -E 'efl|enlightenment|ephoto|evisum|terminology|ecrire|edi|enventor')
  done

  sudo rm -rf /usr/lib/systemd/user/enlightenment.service
  sudo rm -rf /usr/lib/systemd/user/ethumb.service
  sudo systemctl daemon-reload

  sudo rm -rf /usr/lib/libintl.so
  sudo ldconfig

  if [ -x /usr/local/bin/enlightenment_start ] &&
    [ -f /usr/local/share/xsessions/enlightenment.desktop ]; then
    printf "\n$BDR%s %s\n" "OOPS! SOMETHING WENT WRONG."
    printf "$BDR%s $OFF%s\n" "PLEASE RELAUNCH THIS SCRIPT AND SELECT OPTION 3"
    printf "$BDY%s $OFF%s\n\n" "RETRY OPTION 1 AFTERWARD."
    beep_exit
    exit 1
  else
    cd $HOME
    sudo rm -rf $ESRC/e25
    rm -rf $DOCDIR/mbackups
    rm -rf $SCRFLR
    rm -rf .cache/ebuilds
    remov_preq
    sudo updatedb
    printf "\n$BDR%s $OFF%s\n" "Uninstall completed."
    # Candidates for deletion: Search for 'meetse', 'ebackups' and 'pbackups' in your home folder.
  fi
}

strt_afresh() {
  if [ "$XDG_CURRENT_DESKTOP" == "Enlightenment" ]; then
    printf "$BDR%s $OFF%s\n\n" "PLEASE LOG IN TO THE DEFAULT DESKTOP ENVIRONMENT TO EXECUTE THIS SCRIPT."
    beep_exit
    exit 1
  fi

  ESRC=$(cat $HOME/.cache/ebuilds/storepath)

  clear
  printf "\n\n$BDY%s $OFF%s\n\n" "* FIXING MESON ERRORS *"
  sleep 2

  cd $ESRC/rlottie
  rm -rf build

  printf "\n$BLD%s $OFF%s\n\n" "Building rlottie..."
  # Plain build.

  meson -Dexample=false \
    build
  ninja -C build
  $SNIN
  sudo ldconfig
  echo

  cd $HOME

  for I in $PROG_MN; do
    cd $ESRC/e25/$I
    rm -rf build

    printf "\n$BLD%s $OFF%s\n\n" "Building $I..."
    # Plain build.

    case $I in
    efl)
      meson -Dbuild-examples=false -Dbuild-tests=false \
        -Dlua-interpreter=lua -Dbindings= \
        build
      ninja -C build
      ;;
    *)
      meson build
      ninja -C build
      ;;
    esac

    $SNIN
    sudo ldconfig
  done

  printf "\n$BDY%s $OFF%s\n" "Done."
}

get_mbkp() {
  if [ "$XDG_CURRENT_DESKTOP" == "Enlightenment" ]; then
    printf "$BDR%s $OFF%s\n\n" "PLEASE LOG IN TO THE DEFAULT DESKTOP ENVIRONMENT TO EXECUTE THIS SCRIPT."
    beep_exit
    exit 1
  fi

  ESRC=$(cat $HOME/.cache/ebuilds/storepath)

  clear
  printf "\n\n$BDY%s $OFF%s\n\n" "* RESTORING MESON BUILDDIRS *"
  sleep 2

  if [ -d $DOCDIR/mbackups ]; then
    cd $ESRC/rlottie
    rm -rf build
    cd $HOME

    for I in $PROG_MN; do
      cd $ESRC/e25/$I
      rm -rf build
    done
  else
    printf "\n\n$BDr%s $OFF%s\n\n" "* NO BACKUP FOUND! *"
    beep_exit
    exit 1
  fi

  if [ ! -d $DOCDIR/mbackups/edi ]; then
    cp -aR $ESRC/e25/edi/build $DOCDIR/mbackups/edi
  fi

  cp -aR $DOCDIR/mbackups/rlottie/build $ESRC/rlottie

  for I in $PROG_MN; do
    cd $ESRC/e25/$I
    cp -aR $DOCDIR/mbackups/$I/build $ESRC/e25/$I/
  done

  printf "\n$BDY%s $OFF%s\n" "Done."
}

main() {
  trap '{ printf "\n$BDR%s $OFF%s\n\n" "KEYBOARD INTERRUPT."; exit 130; }' INT

  INPUT=0
  printf "\n$BLD%s $OFF%s\n" "Please enter the number of your choice:"
  sel_menu

  if [ $INPUT == 1 ]; then
    uninstall_e25
  elif [ $INPUT == 2 ]; then
    strt_afresh
  elif [ $INPUT == 3 ]; then
    get_mbkp
  else
    beep_exit
    exit 1
  fi
}

main
