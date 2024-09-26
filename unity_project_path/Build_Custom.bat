@echo off
set PROJECT_PATH=%~dp0

if "%s_buildWin64%"=="on" (
  %s_unityPath% -batchmode -nographics -quit -projectPath %PROJECT_PATH% -executeMethod %s_executeMethod% -logFile %s_logPath% -buildTarget %s_buildTarget% -locationPathName %s_locationPathName% -scenes %s_scenes% -buildOptions %s_buildOptions%
  echo windows Build completed
)
if "%s_buildAndroid%"=="on" (
  %s_unityPath% -batchmode -nographics -quit -projectPath %PROJECT_PATH% -executeMethod %s_executeMethod% -logFile %s_logPath_android% -buildTarget %s_buildTargetAndroid% -locationPathName %s_locationPathName_android% -scenes %s_scenes% -buildOptions %s_buildOptions%
  echo Android Build completed
)
if "%s_buildLinux64%"=="on" (
  %s_unityPath% -batchmode -nographics -quit -projectPath %PROJECT_PATH% -executeMethod %s_executeMethod% -logFile %s_logPath_linux% -buildTarget %s_buildTargetLinux64% -locationPathName %s_locationPathName_linux% -scenes %s_scenes% -buildOptions %s_buildOptions%
  echo Linux Build completed
)

where python

%PYTHON% webhook.py %s_feishu_robot_url% %alist_web% %s_buildWin64% %s_buildAndroid% %s_buildLinux64% %s_project_name% %s_versions% %unixtime% %s_ci_id% %s_project_url% %s_branch%