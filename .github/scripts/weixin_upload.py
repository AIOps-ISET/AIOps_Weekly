#!/usr/bin/python3

import os
import requests

"""
This function uses the interface provided by weixin,
See https://developer.work.weixin.qq.com/document/path/91770#文件上传接口
See https://developer.work.weixin.qq.com/document/path/91770#文件类型

parameter:
  key: the weixin bot key
  attachment_path: the attachment path

return:
  An exit status

"""
def send_file(key: str, attachment_path: str) -> int:
    try:
        file_data = {'file': open(attachment_path, 'rb')}
    except FileNotFoundError:
        print(f'Error: this is no such file {attachment_path}, crash')
        return -1
    get_file_descriptor_url = (f'https://qyapi.weixin.qq.com/cgi-bin/webhook/upload_media?'
                               f'key={key}&type=file')
    response = requests.post(url=get_file_descriptor_url, files=file_data)
    json_decode = response.json()
    try:
        media_id = json_decode['media_id']
    except KeyError:
        print(f'Error: upload file to get media_id fail, crash')
        return -1
    send_data = { "msgtype": "file",
             "file": {"media_id": media_id}
    }
    send_file_url = (f'https://qyapi.weixin.qq.com/cgi-bin/webhook/send?'
                     f'key={key}')
    requests.post(url=send_file_url,json=send_data)
    return 0

def main() -> None:
    key = os.environ.get("WEIXIN_ROBOT")
    attachment_path = os.environ.get("ATTACHMENT_NAME")
    if key is None or attachment_path is None:
        print('Error: cannot get environment variable, crash')
        return
    send_file(key, attachment_path)

if __name__ == '__main__':
    main()