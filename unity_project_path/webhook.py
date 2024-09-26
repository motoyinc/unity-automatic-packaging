import requests
import sys
import os
import shutil
import easywebdav

url = sys.argv[1]
web = sys.argv[2]
winPage = sys.argv[3]
androidPage = sys.argv[4]
LinuxPage = sys.argv[5]
s_projectName = sys.argv[6]
s_versions = sys.argv[7]
unixtime = sys.argv[8]
s_ci_id = sys.argv[9]
s_project_url = sys.argv[10]
s_branch = sys.argv[11]
            
header = {"Content-Type": "application/json"}
json = {
    "msg_type": "interactive",
    "card": {
        "config": {"wide_screen_mode": True},
        "header": {"title": {"tag": "plain_text", "content": "打包机构建完成"}},
        "elements": [
            {
                "tag": "div",
                "fields": [
                    {
                        "is_short": True,
                        "text": {
                            "tag": "lark_md",
                            "content": f"**包体地址：**\n"  
                        }
                    },
                    {
                        "is_short": True,
                        "text": {
                            "tag": "lark_md",
                            "content": f"[点击这里查看包体]({web})\n"
                                       f"*请使用下方的百度网盘进行下载*"
                        }
                    },
                ]
            },
            {
                "tag": "div",
                "fields": [
                    {
                        "is_short": True,
                        "text": {
                            "tag": "lark_md",
                            "content": f"**构建包体类型：**\n"
                                       f"- Windows: **{winPage}**\n"
                                       f"- Android: **{androidPage}**\n"
                                       f"- Linux: **{LinuxPage}**\n"
                                       f"- ios: **off** \n (服务器无法构建ios包体，如有需要请自行构建)\n"
                        }
                    },
                    {
                        "is_short": True,
                        "text": {
                            "tag": "lark_md",
                            "content": f"**包体网盘地址：**\n"
                                       f"- 包体下载: [百度网盘](https://pan.baidu.com/s/192tUizs2ctHpIyR7rylscw)\n"
                                       f"- 网盘密码: **n4s1**\n"
                                       f"- *网盘包体请找与【具体构建信息-包体】信息一致的文件夹，百度网盘同步需要时间，请等待一段时间后再查看*"
                        }
                    },
                ]
            },
            {
                "tag": "div",
                "text": {
                    "tag": "lark_md",
                    "content": f"**具体构建信息：**\n"
                                 f"- 包体：{s_projectName}_{s_versions}_{unixtime}_{s_branch}\n"
                                 f"- 包体名称：{s_projectName}\n"
                                 f"- 版本号：{s_versions}\n"
                                 f"- 构建时间戳：{unixtime}\n"
                                 f"- Git任务编号: {s_ci_id}\n"
                }
            }
        ]
    }
}

# 发送POST请求
response = requests.post(url, headers=header, json=json)
# print(response.text)

# discordurl = "https://discord.com/api/webhooks/0000000000000000000000/xxxxxxxxxxxxx-yyyyyyyyyyyy"
# json = {
#     'content': f'这是一条来自远端的post消息{unixtime}'
# }
# response = requests.post(discordurl, headers=header, json=json)
