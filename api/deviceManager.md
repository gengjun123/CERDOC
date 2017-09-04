<div style="
    position: fixed;
    right: 50px;
    bottom: 30px;
    cursor: pointer;
"><a href="#table">返回顶部</a></div>
<h2 id="table">目录</h2>
 1. [设备](#1_1)
  1. [设备增加](#1_1)
  2. [设备查询(批量)](#1_2)
  3. [设备查询(单个)](#1_3)
  4. [设备修改](#1_4)
  5. [设备删除](#1_5)
 2. [设备借用记录](#2_1)
  1. [设备借用](#2_1)
  2. [设备归还](#2_2)

<h3 id="1_1">1.1设备增加</h3>
###request
`POST /devices`
~~~
{
  "name": "Sony/索尼 FDR-X3000R 潜水运动摄像机",
  "code": "KNHPIJ3488",
  "description": "摄像机...",
  "importTime": 1504512427148
}
~~~
名称| 类型| 描述 |是否必须
----|-----|-----|-----
name|string|设备名称|是
code|string|设备条码|是
description|string|设备描述|否
importTime|string|入库时间|否

###response
成功 200

失败 400/500
~~~
{
  "info": "失败描述"
}
~~~

<h3 id="1_2">1.2设备查询(批量)</h3>
###request
`GET /devices?name={相机}&borrowerName={李四}&start=0&limit=10`

名称| 类型| 描述 |是否必须
----|-----|-----|-----
name|string|设备名称|否
borrowerName|string|借出人姓名|否
start|long|设备记录的开始index，默认为0|否
limit|long|设备记录的最大条数，默认为10|否

###response
成功 200
~~~
{
  "count": 4,				//当前返回总数
  "total": 4,				//数据总量
  "deviceList": [{
    "id": "asdfp9q3fasfdhpoei",
	"name": "Sony/索尼 FDR-X3000R 潜水运动摄像机",			//设备名称
	"code": "KNHPJ3488",			//设备编码
	"description": "摄像机...",		//设备描述
    "createdTime": 1504515745940,		//录入时间
	"importTime": 1504515745640,		//入库时间    
    "status": "BORROWED",	//设备状态,IN_STOCK在库，BORROWED借出，SCRAPPED报废
    "latestBorrowRecord": {					//最近一次借出记录，只有借出状态的设备才有
      "borrowerName": "张女士",				//借出人姓名
      "borrowerPhone": "1234",				//借出人电话
      "borrowTime": 1504515745340,			//借出时间
      "timeToReturn": 1504515745940			//预计归还时间
    }
  },{
	"id": "sdfjoweifjeaif3qf8",
	"name": "Sony/索尼 FDR-X3000R 潜水运动摄像机2",
	"code": "KNHPJ3488",
	"description": "摄像机...",
	"createdTime": 1504515745940,		//录入时间
	"importTime": 1504515745640,		//入库时间    
    "status": "IN_STOCK",    
  },{
	"id": "ofawjofieiguhwiurh",
	"name": "Sony/索尼 FDR-X3000R 潜水运动摄像机2",
	"code": "KNHPJ3488",
	"description": "摄像机...",
	"createdTime": 1504515745940,		//录入时间
	"importTime": 1504515745640,		//入库时间    
    "status": "BORROWED",
    "latestBorrowRecord": {
      "borrowerName": "张女士",
      "borrowerPhone": "1234",
      "borrowTime": 1504515745340,
      "timeToReturn": 1504515745940      
    }
  },{
	"id": "fslkejroiosieviser",
    "name": "Sony/索尼 FDR-X3000R 潜水运动摄像机4",
	"code": "KNHPJ3488",
	"description": "摄像机...",
	"createdTime": 1504515745940,		//录入时间
	"importTime": 1504515745640,		//入库时间
    "status": "SCRAPPED"
  }]
}
~~~
失败 400/500
~~~
{
  "info": "失败描述"
}
~~~
<h3 id="1_3">1.3设备查询(单个)</h3>
###request
`GET /devices/{deviceId}`

名称| 类型| 描述 |是否必须
----|-----|-----|-----
deviceId|string|设备id|是

###reponse
成功 200
~~~
{
    "id": "asdfp9q3fasfdhpoei",
	"name": "Sony/索尼 FDR-X3000R 潜水运动摄像机",			//设备名称
	"code": "KNHPJ3488",
	"description": "摄像机...",
    "createdTime": 1504515745940,		//录入时间
	"importTime": 1504515745640,		//入库时间    
    "status": "BORROWED",	//设备状态,IN_STOCK在库，BORROWED借出，SCRAPPED报废
    "borrowRecordList": [{					//借出记录列表
      "borrowerName": "张女士",				//借出人姓名
      "borrowerPhone": "1234",				//借出人电话
      "borrowTime": 1504515745340,			//借出时间
      "timeToReturn": 1504515745940			//预计归还时间,
	  "timeReturned": 1504515765940			//实际归还时间,
	  "returnerName": "张女士"				//归还人
    },{
	  ...
	}]
}
~~~

失败 400/500
~~~
{
	"info": "失败描述"
}
~~~

<h3 id="1_4">1.4设备修改</h3>
###request
`PUT /devices/{deviceId}`
~~~
{
  "name": "Canno/佳能 FDR-X3000R 潜水运动摄像机",
  "code": "KNHPJ3999",
  "description": "佳能..."
}
~~~
名称| 类型| 描述 |是否必须
----|-----|-----|-----
deviceId|string|设备id|是
name|string|设备名称|否
code|string|设备编码|否
description|string|设备描述|否

###response
成功 200

失败 400/500
~~~
{
	"info": "失败描述"
}
~~~

<h3 id="1_5">1.5设备删除</h3>
###request
`DELETE /devices/{deviceId}`

名称| 类型| 描述 |是否必须
----|-----|-----|-----
deviceId|string|设备id|是

###response
成功 200

失败 400/500
~~~
{
	"info": "失败描述"
}
~~~

<h3 id="2_1">2.1设备借用</h3>
###reques
`POST /devices/{deviceIs}/borrowRecords`

~~~
{
  "borrowerName": "张女士",
  "borrowerPhone": "1234",
  "borrowTime": 1504515765940,
  "timeToReturn": 1504515767940
}
~~~

名称| 类型| 描述 |是否必须
----|-----|-----|-----
deviceId|string|设备id|是
borrowerName|string|借出人姓名|是
borrowerPhone|string|借出人电话|否
borrowTime|long|借出时间|是
timeToReturn|long|预计归还时间|否

###response
成功 200

失败 400/500
~~~
{
	"info": "失败描述"
}
~~~

<h3 id="2_2">2.2设备归还</h3>
###reques
`PUT /devices/{deviceIs}/borrowRecords`

~~~
{
  "returnerName": "张女士",
  "timeReturned": 1504515765940
}
~~~

名称| 类型| 描述 |是否必须
----|-----|-----|-----
deviceId|string|设备id|是
returnerName|string|归还人姓名|是
timeReturned|long|归还时间|是

###response
成功 200

失败 400/500
~~~
{
	"info": "失败描述"
}
~~~
