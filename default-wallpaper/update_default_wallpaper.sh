#!/bin/bash

usage() {
    echo "Usage: ${0} <ImageFilepath>"
}

# Verify argument count
if [ "$#" -ne 1 ]; then
    usage
    exit 1
fi

source "../../../build/envsetup.sh"

## First ensure the image is a properly formatted png file
convert "${1}" "${PWD}"/default_wallpaper.png

## Convert the image to all the resolutions we need and put them in the appropriate place
convert -resize 1080x1080 "${PWD}"/default_wallpaper.png "${ANDROID_BUILD_TOP}"/vendor/overlays/rro_overlays/BlissConfigOverlay/res/drawable-hdpi/default_wallpaper.png
convert -resize 960x960 "${PWD}"/default_wallpaper.png "${ANDROID_BUILD_TOP}"/vendor/overlays/rro_overlays/BlissConfigOverlay/res/drawable-nodpi/default_wallpaper.png
convert -resize 1920x1920 "${PWD}"/default_wallpaper.png "${ANDROID_BUILD_TOP}"/vendor/overlays/rro_overlays/BlissConfigOverlay/res/drawable-sw600dp-nodpi/default_wallpaper.png
convert -resize 1920x1920 "${PWD}"/default_wallpaper.png "${ANDROID_BUILD_TOP}"/vendor/overlays/rro_overlays/BlissConfigOverlay/res/drawable-sw720dp-nodpi/default_wallpaper.png
convert -resize 1440x1440 "${PWD}"/default_wallpaper.png "${ANDROID_BUILD_TOP}"/vendor/overlays/rro_overlays/BlissConfigOverlay/res/drawable-xhdpi/default_wallpaper.png
convert -resize 1920x1920 "${PWD}"/default_wallpaper.png "${ANDROID_BUILD_TOP}"/vendor/overlays/rro_overlays/BlissConfigOverlay/res/drawable-xxhdpi/default_wallpaper.png
convert -resize 2560x2560 "${PWD}"/default_wallpaper.png "${ANDROID_BUILD_TOP}"/vendor/overlays/rro_overlays/BlissConfigOverlay/res/drawable-xxxhdpi/default_wallpaper.png

## Cleanup
rm "${PWD}"/default_wallpaper.png

## Commit changes
cd "${ANDROID_BUILD_TOP}"/vendor/overlays && git add rro_overlays/BlissConfigOverlay/res/drawable-* && git commit -m "Update default wallpaper"

## Go back to top
croot

exit 0
