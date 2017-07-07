<div style="
    position: fixed;
    right: 50px;
    bottom: 30px;
    cursor: pointer;
"><a href="#table">返回顶部</a></div>

<h2 id="table">目录</h2>
 1. [产品审核接口](#1)
  
##内容
<h3 id="1">1.产品审核接口</h3>
###request
`POST /manuscript/resource/{resourceId}/audit`
~~~
{
  "status": "转审",
  "comment": "通过",
  "auditorId": "9d9dv9afasd9fu9asdf"
}
~~~
|名称|类型|描述|是否必须
|---|
|resourceId|string|url path参数|是
|status|string|审核状态(被驳回，审核通过，转审)|是|
|comment|string|评论|否|
|auditorId|string|转审人id|[status=转审]是

###response
成功:200

失败:400~500
~~~
{
  "info": "失败描述"
}
~~~