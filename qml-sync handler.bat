:: Current BAT File Dir
cd /d %~dp0
set BAT_FILE_DIR=%cd%

:: QT_MINGW INSTALL DIR
set QT55_MINGW_INSTALL_QML_DIR=D:\devel\IDE\Qt\dist\app\551.492\5.5\mingw492_32\qml
set QT56_MINGW_INSTALL_QML_DIR=D:\devel\IDE\Qt\dist\app\560.MG492\5.6\mingw49_32\qml

:: QT_MSVC INSTALL DIR
set QT55_MSVC_INSTALL_QML_DIR=D:\devel\IDE\Qt\dist\app\5.5.1-MSVC2013\5.5\msvc2013\qml

::Material GitHub Source
set QT_MATERIAL_SOURCE_DIR=D:\devel\Studio\Github\qml-material.git\trunk\modules

:: SETUP FOR SYNC AMONG (MSVC\QT\MATERIAL\BAT) DIRS
set SYNC_FROM=%QT_MATERIAL_SOURCE_DIR%
set SYNC_TO=%BAT_FILE_DIR%

echo d | xcopy /e /y %SYNC_FROM%\Material %SYNC_TO%\Material
echo d | xcopy /e /y %SYNC_FROM%\QtQuick %SYNC_TO%\QtQuick