<div style="
    position: fixed;
    right: 50px;
    bottom: 30px;
    cursor: pointer;
"><a href="#table">返回顶部</a></div>

<h2 id="table">目录</h2>
 1. [产品发布接口](#1)
 2. [获取资源审核记录接口](#2)
  
##内容
<h3 id="1">1.产品发布接口</h3>
###request
`POST /resourcemanager/api/resource/publish`
~~~
{
  "SrcResourceIdList": [{
    "SrcResourceId": "9d9d9f9ie9fjawe9r4",
    "SrcResourceName": "名称"
  }],
  "IsPriority": 1,
  "departmentIdList": ["f49fj934t09jf3", "f290fj983ur0k"],
  "delayTime": 19
}
~~~
|名称|类型|描述|是否必须
|---|
|SrcResourceIdList|list|资源列表|是
|SrcResourceIdList[].SrcResourceId|string|资源id|是
|SrcResourceIdList[].SrcResourceName|string|资源名称|否
|IsPriority|int|是否为优先发布，1是，0否|是
|departmentIdList|list|部门id列表|[IsPriority=1]是
|delayTime|int|间隔时间(分钟)|[IsPriority=1]是

###response
成功:200

失败:400~500
~~~
{
  "info": "失败描述"
}
~~~

<h3 id="2">2.获取资源审核记录接口</h3>
###request
`POST /resourcemanager/searchAuditLogging`
~~~
{
  "resourceId": "15308AEA-E9A1-4A27-86F9-47EDDB65EAF1",
  "limit": 10,
  "start": 0
}
~~~
|名称|类型|描述|是否必须
|---|
|resourceId|string|资源Id|是
|limit|int|分页条件，每页显示条数|是
|start|int|分页条件，从那条记录开始|是

###response
成功:200
~~~
{
  "limit": 10,
  "items": [
    {
      "id": "d5009f07-472c-49cd-b5d5-aba13a3c2ec3",
      "created": "2017-06-13 18:18:18",
      "describe": "审核意见",
      "operateDescribe": "审核通过",
      "operator": {
        "uid": "8ca66580fa6b42fe9e625f6202fc2192",
        "uname": "中央厨房超级管理员"
      }
    },
    {
      "id": "4fbcfc4c-f52b-48f6-9313-9010be0c496b",
      "created": "2017-06-13 18:19:53",
      "describe": "",
      "operateDescribe": "被驳回",
      "operator": {
        "uid": "8ca66580fa6b42fe9e625f6202fc2192",
        "uname": "中央厨房超级管理员"
      }
    }
  ],
  "totalCount": 2,
  "start": 0,
  "currentPage": 1,
  "totalPage": 1
}
~~~

失败:400~500
~~~
{
  "limit": 10,
  "totalCount": 0,
  "start": -9,
  "currentPage": "",
  "totalPage": 0
}
~~~