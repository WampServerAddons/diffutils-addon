Diffutils Add-on for WampServer Version 2.2a

Apache version: 2.2.21

About:
 This is an addon for WampServer 2.2a that enables web applications to use Diffutils
 NOTE: If diffutils are already on your %PATH% then this addon is not needed.

Where to download Diffutils:
 The binaries we currently use for the installer are from the GnuWin32 project on
 sourceforge.net - http://gnuwin32.sourceforge.net/packages/diffutils.htm. You will
 need both the zip file for the binaries and the zip file for the dependancies.

 Binaries:	http://gnuwin32.sourceforge.net/downlinks/diffutils-bin-zip.php
 Dependancies:	http://gnuwin32.sourceforge.net/downlinks/diffutils-dep-zip.php

Manual install instructions:
 (assumes wamp is already installed and working)

 1. download the zip files listed above
 2. extract the files to a temporary directory
 3. inside of the folders that was extracted you should see a directory named
    diffutils-%VERSION%-bin and diffutils-%VERSION%-dep
 4. create a folder called diffutils%VERSION%
 5. move all of the files from diffutils-%VERSION%-bin and diffutils-%VERSION%-dep
    into diffutils%VERSION% (you really only need the files in the bin directory)
 6. make the folder c:\wamp\bin\diffutils and move the folder diffutils%VERSION%
    into that folder
 7. add c:\wamp\bin\diffutils\diffutils%VERSION%\bin to your %PATH%
    (a logoff or reboot maybe required)
 8. restart Wamp

Using the Installer:
 usage: installer.bat


TODO:

FIXME:
 * spelling/capitalization check on all files
