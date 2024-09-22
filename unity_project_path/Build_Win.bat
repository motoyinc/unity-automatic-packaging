@echo off
:: Unity编辑器路径
set UNITY_PATH="C:\Program Files\Unity\Hub\Editor\6000.0.19f1\Editor\Unity.exe"

:: 设置项目路径为当前文件夹
set PROJECT_PATH=%~dp0

:: 设置执行的Unity C# 构建方法
set EXECUTE_METHOD=BuildProject.BuildGame

:: 设置构建日志输出路径，输出到项目的Logs文件夹
set LOG_PATH=.\Logs\build.log

:: -----------------------------

:: 设置平台
set BUILD_TARGET="StandaloneWindows64"

:: 设置输出路径
set LOCATION_PATH_NAME=.\Build\Windows\newGame.exe

:: 参与构建的场景
set SCENES="Assets\Scenes\Terminal\TerminalScene.unity"

:: 构建选项
set BUILD_OPTIONS="None"

:: %UNITY_PATH% -batchmode -quit -projectPath %PROJECT_PATH% -executeMethod %EXECUTE_METHOD% -buildTarget %BUILD_TARGET% -logFile %LOG_PATH% -locationPathName %LOCATION_PATH_NAME% -scenes %SCENES% -buildOptions "None"
%UNITY_PATH% -batchmode -nographics -quit -projectPath %PROJECT_PATH% -executeMethod %EXECUTE_METHOD% -logFile %LOG_PATH% -buildTarget %BUILD_TARGET% -locationPathName %LOCATION_PATH_NAME% -scenes %SCENES% -buildOptions %BUILD_OPTIONS%
echo Build completed
pause