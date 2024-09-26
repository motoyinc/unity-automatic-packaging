CHCP 65001
:: -------------------------------
:: 需要手动配置的变量(需要在jenkins插件里配置号变量的接收地址)
echo %s_branch%
echo %s_project_name%
echo %s_project_url%
echo %s_ci_id%
echo %s_feishu_robot_url%
echo %s_versions%
echo %s_buildWin64%
echo %s_buildAndroid%
echo %s_buildLinux64%
echo %s_buildTarget%
echo %s_buildTargetAndroid%
echo %s_buildTargetLinux64%
echo %s_buildOptions%
echo %s_executeMethod%
echo %s_scenes%
echo %s_buildOptions%

set s_unityPath="C:\Program Files\Unity\Hub\Editor\6000.0.19f1\Editor\Unity.exe"

:: -------------------------------
:: 获取时间戳
for /f %%x in ('powershell -Command "Get-Date -UFormat %%s"') do set unixtime=%%x
echo %unixtime%
for /f "delims=. tokens=1" %%a in ("%unixtime%") do set unixtime=%%a
set /a unixtime=(%unixtime%-28800)

:: 创建基本输出路径
set outputPath=D:\jenkins\%s_project_name%\%s_project_name%_%s_versions%_%unixtime%_%s_branch%\

:: win输出路径
set s_locationPathName="%outputPath%\windows\Build\game.exe"
set s_logPath="%outputPath%\windows\Logs\build.log"

:: android输出路径
set s_locationPathName_android="%outputPath%\android\Build\game.exe"
set s_logPath_android="%outputPath%\android\Logs\build.log"

:: linux输出路径
set s_locationPathName_linux="%outputPath%\linux\Build\game.exe"
set s_logPath_linux="%outputPath%\linux\Logs\build.log"

set locOutputPath=D:\jenkins\%s_project_name%\%s_project_name%_%s_versions%_%unixtime%_%s_branch%
set webOutputPath=X:\jenkins\%s_project_name%\%s_project_name%_%s_versions%_%unixtime%_%s_branch%
set alist_web=https://alist.motoyinc.com/public/jenkins/%s_project_name%/%s_project_name%_%s_versions%_%unixtime%_%s_branch%

call Build_Custom.bat