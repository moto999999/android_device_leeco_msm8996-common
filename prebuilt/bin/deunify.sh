#!/sbin/sh
#
# deunify
#

# DEVINFO
DEVINFO=$(cat /dev/block/sde21)

echo "DEVINFO: ${DEVINFO}"

case "$DEVINFO" in
  le_x10*)
    # Move firmware
    mv -f /vendor/firmware/le_x10/* /vendor/firmware/

    # Move sensors config
    mv -f /vendor/etc/sensors/sensor_def_qcomdev_x10.conf /vendor/etc/sensors/sensor_def_qcomdev.conf 
    ;;

  le_zl0*)
    # Move firmware
    mv -f /vendor/firmware/zl0/* /vendor/firmware/

    # Remove NFC configs
    rm -f /system/etc/libnfc-nci.conf
    rm -f /vendor/etc/libnfc-nxp_RF.conf
    rm -f /vendor/etc/libnfc-nxp.conf

    # Remove NFC perms
    rm -f /vendor/etc/permissions/android.hardware.nfc*
    rm -f /vendor/etc/permissions/com.android.nfc*
    rm -f /vendor/etc/permissions/com.nxp.mifare.xml

    # Remove NFC services
    rm -f /vendor/etc/init/android.hardware.nfc*
    rm -f /vendor/etc/init/vendor.nxp.hardware.nfc*
    ;;
  *)

    echo "Nothing to do!"
    ;;
esac

exit 0
