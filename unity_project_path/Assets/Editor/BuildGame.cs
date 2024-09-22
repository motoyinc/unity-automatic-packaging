using UnityEditor;
using System;
using UnityEngine;


public class BuildProject
{
    [MenuItem("Tools/Build")]
    public static void BuildGame()
    {
        // 传入批处理参数
        string[] args = Environment.GetCommandLineArgs();
        
        // 初始化构建参数以及默认值
        string[] scenes = { "Assets/Scenes/Terminal/TerminalScene.unity" };
        string locationPathName = "Build/Windows/YourGame.exe";
        BuildTarget buildTarget = BuildTarget.StandaloneWindows64;
        BuildOptions buildOptions = BuildOptions.None;
        for (int i = 0; i < args.Length; i++)
        {
            switch (args[i])
            {
                case"-scenes":
                    if (i + 1 < args.Length)
                    {
                        scenes = args[i + 1].Split(',');
                        Debug.Log("参数 -scenes:"+ scenes[0]);
                    }
                    break;
                case"-locationPathName":
                    if (i + 1 < args.Length)
                    {
                        locationPathName = args[i + 1];
                        Debug.Log("参数 -locationPathName:"+ locationPathName);
                        
                    }
                        
                    break;
                case"-buildTarget":
                    if (i + 1 < args.Length)
                    {
                        Enum.TryParse(args[i + 1], out buildTarget);
                        if (buildTarget == BuildTarget.StandaloneWindows64)
                            Debug.Log("参数 -buildTarget: True");
                        else
                            Debug.Log("参数 -buildTarget: False");
                        
                    }
                    break;
                case"-buildOptions":
                    if (i + 1 < args.Length)
                    {
                        Enum.TryParse(args[i + 1], out buildOptions);
                        if (buildOptions ==  BuildOptions.None)
                            Debug.Log("参数 -buildOptions: True");
                        else
                            Debug.Log("参数 -buildOptions: False");
                    }
                    break;
            }
        }
        
        // 构建打包参数
        BuildPlayerOptions buildPlayerOptions = new BuildPlayerOptions();
        buildPlayerOptions.scenes = scenes;
        buildPlayerOptions.locationPathName = locationPathName;
        buildPlayerOptions.target = buildTarget;
        buildPlayerOptions.options = buildOptions;
        
        // 调用Unity的打包函数
        BuildPipeline.BuildPlayer(buildPlayerOptions);
        
    }
}

