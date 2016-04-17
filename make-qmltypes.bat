:: Current BAT File Dir
cd /d %~dp0
set BAT_FILE_DIR=%cd%

::环境变量
set QT_DIR=D:\devel\IDE\Qt\dist\app\560.MG492\5.6\mingw49_32
set PATH=%PATH%;%QT_DIR%\bin



qmlplugindump  -nonrelocatable Material 0.3 %BAT_FILE_DIR%\Material >%BAT_FILE_DIR%\Material\plugins.qmltypes