:: -------------------------------
:: 需要手动配置的变量
set s_unityPath="C:\Program Files\Unity\Hub\Editor\6000.0.19f1\Editor\Unity.exe"
set s_executeMethod=BuildProject.BuildGame
set s_scenes="Assets\Scenes\Terminal\TerminalScene.unity"
set s_buildOptions="None"
set s_projectName=test_porject
set s_versions=v0.0.1-Alpha

set s_buildWin64=on
set s_buildTarget="StandaloneWindows64"
set s_buildAndroid=off
set s_buildTargetAndroid="StandaloneWindows64"
set s_buildLinux64=off
set s_buildTargetLinux64="StandaloneWindows64"

:: -------------------------------
:: 获取时间戳
for /f %%x in ('powershell -Command "Get-Date -UFormat %%s"') do set unixtime=%%x
set unixtime=%unixtime:~0,-6%

:: 创建基本输出路径
set outputPath=D:\jenkins\%s_projectName%\%s_projectName%_%s_versions%_%unixtime%-utc-8

:: win输出路径
set s_locationPathName="%outputPath%\windows\Build\game.exe"
set s_logPath="%outputPath%\windows\Logs\build.log"

:: android输出路径
set s_locationPathName_android="%outputPath%\android\Build\game.exe"
set s_logPath_android="%outputPath%\android\Logs\build.log"

:: linux输出路径
set s_locationPathName_linux="%outputPath%\linux\Build\game.exe"
set s_logPath_linux="%outputPath%\linux\Logs\build.log"

call Build_Custom.bat