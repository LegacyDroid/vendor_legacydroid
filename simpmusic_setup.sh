#!/system/bin/sh
# LegacyDroid SimpMusic boot install (run from simpmusic_setup.rc as u:r:magisk:s0)
case "$1" in
install)
    # Install SimpMusic as a regular user app once PackageManager is up,
    # so it stays updatable (sideload newer APKs in place) like Termux.
    if ! pm list packages 2>/dev/null | grep -q com.maxrave.simpmusic; then
        pm install -r -g /system/etc/simpmusic/simpmusic.apk
    fi
    ;;
esac
