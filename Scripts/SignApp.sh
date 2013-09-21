#!/bin/sh

#  SignApp.sh
#  Versioning
#
#  Created by Kozlek on 18/07/13.
#

# Do nothing on clean
if [ "$1" == "clean" ]
then
    exit 0
fi

/usr/libexec/PlistBuddy -c "Add :SUFeedURL string https://raw.github.com/kozlek/HWSensors/develop/Appcast/appcast.xml" "./Binaries/HWMonitor.app/Contents/info.plist"
/usr/libexec/PlistBuddy -c "Set :CFBundleVersion 5.3.839" "./Binaries/HWMonitor.app/Contents/info.plist"

codesign -s "Developer ID Application" -f ./Binaries/HWMonitor.app
spctl -a -v --type execute ./Binaries/HWMonitor.app