#!/system/bin/sh
# LegacyDroid Termux boot install (run from termux_setup.rc as u:r:magisk:s0)
case "$1" in
install)
    # Install Termux as a regular user app once PackageManager is up, so
    # root is granted through the Magisk superuser prompt like any app.
    if ! pm list packages 2>/dev/null | grep -q com.termux; then
        pm install -r -g /system/etc/termux/termux.apk
    fi
    ;;
esac
