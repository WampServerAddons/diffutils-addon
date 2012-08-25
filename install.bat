@echo OFF
REM TODO use the call command to set some variables common to both the installer/uninstaller
set DIFFUTILS_VERSION=2.8.7-1
set APACHE_VERSION=2.2.21
set WAMP_VERSION=2.2a

set ADDON=DiffUtils

set BIN=installer\bin
set TMP=installer\temp

set WAMP=c:\wamp
set WAMP_DIFFUTILS=%WAMP%\bin\diffutils
set WAMP_APACHE_MODULES=%WAMP%\bin\apache\apache%APACHE_VERSION%\modules

set DIFFUTILS_FILE=diffutils-%DIFFUTILS_VERSION%
set DIFFUTILS_DEPS_FILE=diffutils-%DIFFUTILS_VERSION%-dep
set DIFFUTILS_BIN_FILE=diffutils-%DIFFUTILS_VERSION%-bin
set DIFFUTILS_DIR=diffutils%DIFFUTILS_VERSION%
set DIFFUTILS_BIN=%WAMP_DIFFUTILS%\%DIFFUTILS_DIR%\bin

set DIFFUTILS_DOWNLOAD=http://downloads.sourceforge.net/project/gnuwin32/diffutils/%DIFFUTILS_VERSION%

set PATH=%PATH%;%BIN%

echo Welcome to the %ADDON% Addon installer for WampServer %WAMP_VERSION%

REM set up the temp directory
IF NOT EXIST %TMP% GOTO MKTMP
echo 	Temp directory found from previous install: DELETING
rd /S /Q %TMP%

:MKTMP
echo 	Setting up the temp directory...
mkdir %TMP%

REM download diffutils archives to temp directory
echo 	Downloading %ADDON% binaries to temp directory...
wget.exe -nd -q -P %TMP% %DIFFUTILS_DOWNLOAD%/%DIFFUTILS_BIN_FILE%.zip
if not %ERRORLEVEL%==0 (echo FAIL: could not download %ADDON% binaries& pause& exit 1)
wget.exe -nd -q -P %TMP% %DIFFUTILS_DOWNLOAD%/%DIFFUTILS_DEPS_FILE%.zip
if not %ERRORLEVEL%==0 (echo FAIL: could not download %ADDON% binaries& pause& exit 1)

REM unzip the downloaded source files and install them
echo 	Extracting the files from the downloaded archive...
mkdir %TMP%\%DIFFUTILS_DIR%
unzip.exe -q %TMP%\%DIFFUTILS_DEPS_FILE%.zip bin\* -d %TMP%\%DIFFUTILS_DIR%
if not %ERRORLEVEL%==0 (echo FAIL: could not extract %ADDON% binaries& pause& exit 1)
unzip.exe -q %TMP%\%DIFFUTILS_BIN_FILE%.zip bin\* -d %TMP%\%DIFFUTILS_DIR%
if not %ERRORLEVEL%==0 (echo FAIL: could not extract %ADDON% binaries& pause& exit 1)

REM install the binary files in the WampServer install directory
echo 	Moving the files to the WampServer install directory...
mkdir %WAMP_DIFFUTILS%
move %TMP%\%DIFFUTILS_DIR% %WAMP_DIFFUTILS%
if not %ERRORLEVEL%==0 (echo FAIL: could not install %ADDON% binaries& pause& exit 1)

REM add the Diffutils bin directory to the PATH so apache can find them
echo 	Setting enviorment variables...
setenv -a PATH %DIFFUTILS_BIN%

REM clean up temp files
echo 	Cleaning up temp files...
rd /S /Q %TMP%

echo %ADDON% is installed successfully. Please restart WampServer.

pause
