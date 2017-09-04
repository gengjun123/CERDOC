###request
`POST http://server:port/cre/api/resources/inteam`

~~~
{
  "projectId": "592645551e1a7b5aba15b887",
  "fileName": "G20峰会采访视频",
  "fileType": "VIDEO",
  "fileUrl": "http://inteam.hubpd.com/project/592645551e1a7b5aba15b887/works/592645551e1a7b5aba15b88a/work/595b99e24002b2389e4ccb46",
  "creatorId": "difa89898df9aew8hf9a8we",
  "creatorName": "张三"
}
~~~

名称| 类型| 描述 |是否必须
----|-----|-----|-----
projectId|string|项目id|是
fileName|string|文件名称|是
fileType|string|文件类型，可选值有[VIDEO,AUDIO,IMAGE]|是
fileUrl|string|文件访问地址|是
creatorId|string|创建人id|是
creatorName|string|创建人姓名|是

###response
200 成功

400/500 失败
~~~
{
  "info": "失败描述"
}
~~~