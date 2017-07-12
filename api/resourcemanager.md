<div style="
    position: fixed;
    right: 50px;
    bottom: 30px;
    cursor: pointer;
"><a href="#table">返回顶部</a></div>

<h2 id="table">目录</h2>
 1. [产品发布接口](#1)
  
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