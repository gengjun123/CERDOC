<div style="
    position: fixed;
    right: 50px;
    bottom: 30px;
    cursor: pointer;
"><a href="#table">返回顶部</a></div>
<h2 id="table">目录</h2>
 1. [用户管理](#1_1)
  1. [用户查询](#1_1)
  2. [获取组织结构](#1_2)  
  3. [获取人员权限信息](#1_3)
  4. [根据id获取用户](#1_4)
  5. [用户查询-new](#1_5)
  6. [获取组织结构-new](#1_6)
  7. [获取人员权限信息-new](#1_7)
 2. [选题目录](#2_1)
  1. [新增选题目录](#2_1)
  2. [修改选题目录](#2_2)
  3. [删除选题目录](#2_3)
  4. [检索选题资源](#2_4)
  5. [选题目录资源新增/另存为](#2_5)
 3. [富文本稿件](#3_1)
  1. [获取文件存储路径及流媒体路径](#3_1)
  2. [创建资源文件](#3_2)
  3. [获取稿件最新版本详细信息](#3_3)
  4. [获取稿件所有版本详细信息](#3_4)
  5. [保存稿件](#3_5)
  6. [删除文件](#3_6)
  7. [获取附件列表](#3_7)
 4. [逻辑目录](#4_1)
  1. [获取逻辑目录](#4_1)   
 5. [资源轨迹](#5_1)
  1. [获取资源操作信息](#5_1)

<h3 id="1_1">1.1用户查询</h3>

###request

`GET http://server:port/cre/api/authorization/users`

`http://server:port/cre/api/authorization/users?userName=张三&privilegeIDs=123&privilegeIDs=456&privilegeIDs=789`

名称| 类型| 描述 |是否必须
----|-----|-----|-----
userName|string|用户名（支持模糊查询）|否
privilegeIDs|string|权限id列表(url传参示例：privilegeIDs=123&privilegeIDs=456&privilegeIDs=789)|否
privilegeDepID|string|权限关联部门id，同privilegeID联合使用|否

###response
成功：200
~~~
RequestBody
{
  "totalCount": 2,                             //总数
  "userList": [
        {
            "id": "zhangsan",					//用户ID，最长不超过36个字符
            "name": "张三",	  					//用户名
            "workNo": "",								//工号
            "organizationId": "23voeruqtp398ih98",       //用户所属组织结构ID
			"organizationName": "设计部",				//用户所属组织结构名称
            "description": "",							//描述，最长不超过256个字符
            "status": 0,								//状态，0: 正常, 1: 挂起, 默认值为0
            "tel": "13912345678",						//电话
            "mail": "zhangsan@abc.com",					//邮箱
            "type": 0,									//状态，0: 本地用户, 1：统一认证用户, 默认值为0
            "personalSpaceFlag": 0,						//开启个人空间标识, 0: 不开启, 1: 开启, 默认值为0
            "maxCapacity": 0,							//个人用户最大可用空间，单位字节
            "iconUrl": "http://127.0.0.1:8080/user/zhangsan.jpg"	//用户肖像地址
        },
        {
            "id": "lisi",
            "name": "李四",
            "workNo": "",
            "organizationId": "aofsd8uvnau87yr9ah",           
			"organizationName": "开发部",            
            "description": "",
            "status": 0,
            "tel": "13912345678",
            "mail": "lisi@abc.com",
            "type": 0,
            "personalSpaceFlag": 0,
            "maxCapacity": 0,
            "iconUrl": "http://127.0.0.1:8080/user/lisi.jpg"
        }
    ]
}
~~~
失败：400~500
~~~
{
  "info":"失败描述"
}
~~~

<h3 id="1_2">1.2获取组织结构</h3>

###request

`POST http://server:port/cre/api/authorization/organization/load`

~~~
{    
    "organizationIdList": [
        "7A1180CC-0C29-4B37-82B3-83E525F559AC"
    ]
}
~~~

名称| 类型| 描述 |是否必须
----|-----|-----|-----
organizationIdList|list|组织结点ID数组，如果数组元素个为0，则表示获取全部组织结点|是

###response
~~~
{
    "commonResponse": {
        "success": true,				//是否成功，true表示成功，false表示失败
        "description": ""					//描述，通常只有失败的时候，才有原因描述
    },
    "totalCount": 1,						//返回的组织结点个数
    "organizationList": [
        {
            "id": "7A1180CC-0C29-4B37-82B3-83E525F559AC",	//组织结点ID，最长不超过36个字符
            "name": "本单位",					//组织结点名称
            "parentId": "-",					//父节点ID，最长不超过64个字符
            "level": 0,						//当前层级，-1是所有结点的根，不可见。其余结点，从0, 1, 2逐级增大
            "parentLevel": -1,				//父节点的层级
            "orderNo": 0					//本结点在本层级兄弟结点中的顺序，从0开始，数字越小，排在越前面
        }	
    ]
}
~~~


<h3 id="1_3">1.3获取人员权限信息</h3>

###request

`[POST]http://server:port/cre/api/authorization/privilege/load`

~~~
{
    "userId": "zhangsan",
    "privilegePrefix": "PID_DISTRIBUTE"
}
~~~

名称| 描述| 类型 |是否必须
----|-----|-----|-----
userId|用户ID，不填，或者为空，表示获取全部权限；如果有值，则获取该用户拥有的权限|string|是
privilegePrefix|权限前缀，用于过滤。若不填，则为空，不过滤|string|否

###响应
~~~
{
    "commonResponse": {
        "success": true,
        "description": ""
    },
    "totalCount": 3,				//返回的权限信息个数
    "privilegeList": [
        {
            "id": "PID_DISTRIBUTE_ADMIN",			//权限ID，最长不超过36个字符
            "name": "分发管理员权限",					//权限名
            "groupId": "",							//	所属权限组ID
            "description": "分发管理管理员"			//描述，最长不超过256个字符
			"departmentIdList": ["7A1180CC-0C29-4B37-82B3-83E525F559AC", "7A1190CC-0C29-4B37-85B3-83E525F559AC"]		//如果是部门关联权限，适用的部门id列表
			"departmentList": [{
		      "id": "7A1180CC-0C29-4B37-82B3-83E525F559AC",       //组织结点ID，最长不超过36个字符
		      "name": "本单位1",                   //组织结点名称
		      "parentId": "-",                    //父节点ID，最长不超过64个字符
		      "level": 0,                         //当前层级，-1是所有结点的根，不可见。其余结点，从0, 1, 2逐级增大
		      "parentLevel": -1,                  //父节点的层级
		      "orderNo": 0                        //本结点在本层级兄弟结点中的顺序，从0开始，数字越小，排在越前面
			},{
		      "id": "7A1190CC-0C29-4B37-85B3-83E525F559AC",       
		      "name": "本单位2",                   
		      "parentId": "-",                    
		      "level": 0,                         
		      "parentLevel": -1,              
		      "orderNo": 0                        
		    }]
        },
        {
            "id": "PID_DISTRIBUTE_TASK_AUDIT",
            "name": "分发审核权限",
            "groupId": "",
            "description": "分发审核权限",
			"departmentIdList": ["7A1180CC-0C29-4B37-82B3-83E525F559AC", "7A1190CC-0C29-4B37-85B3-83E525F559AC"],
			"departmentList": [{
		      "id": "7A1180CC-0C29-4B37-82B3-83E525F559AC",       //组织结点ID，最长不超过36个字符
		      "name": "本单位1",                   //组织结点名称
		      "parentId": "-",                    //父节点ID，最长不超过64个字符
		      "level": 0,                         //当前层级，-1是所有结点的根，不可见。其余结点，从0, 1, 2逐级增大
		      "parentLevel": -1,                  //父节点的层级
		      "orderNo": 0                        //本结点在本层级兄弟结点中的顺序，从0开始，数字越小，排在越前面
			},{
		      "id": "7A1190CC-0C29-4B37-85B3-83E525F559AC",       
		      "name": "本单位2",                   
		      "parentId": "-",                    
		      "level": 0,                         
		      "parentLevel": -1,              
		      "orderNo": 0                        
		    }]
        },
        {
            "id": "PID_DISTRIBUTE_TASK_MANAGEMENT",
            "name": "分发权限",
            "groupId": "",
            "description": "分发权限",
			"departmentIdList": ["7A1180CC-0C29-4B37-82B3-83E525F559AC", "7A1190CC-0C29-4B37-85B3-83E525F559AC"],
			"departmentList": [{
		      "id": "7A1180CC-0C29-4B37-82B3-83E525F559AC",       //组织结点ID，最长不超过36个字符
		      "name": "本单位1",                   //组织结点名称
		      "parentId": "-",                    //父节点ID，最长不超过64个字符
		      "level": 0,                         //当前层级，-1是所有结点的根，不可见。其余结点，从0, 1, 2逐级增大
		      "parentLevel": -1,                  //父节点的层级
		      "orderNo": 0                        //本结点在本层级兄弟结点中的顺序，从0开始，数字越小，排在越前面
			},{
		      "id": "7A1190CC-0C29-4B37-85B3-83E525F559AC",       
		      "name": "本单位2",                   
		      "parentId": "-",                    
		      "level": 0,                         
		      "parentLevel": -1,              
		      "orderNo": 0                        
		    }]		
        }
    ]
}
~~~

<h3 id="1_4">1.4根据id查询用户</h3>

###request

`GET http://server:port/cre/api/authorization/findUsersById`

`http://server:port/cre/api/authorization/findUsersById?userIds=zhangsan&userIds=lisi&departmentIds=adb6df15e3c7481aaaf29997a3f3125f`

名称| 类型| 描述 |是否必须
----|-----|-----|-----
userIds|string|用户id|否
departmentIds|string|部门id|否

###response
成功：200
~~~
RequestBody
{
  "totalCount": 2,                             //总数
  "userList": [
        {
            "id": "zhangsan",					//用户ID，最长不超过36个字符
            "name": "张三",	  					//用户名
            "workNo": "",								//工号
            "organizationId": "23voeruqtp398ih98",       //用户所属组织结构ID
			"organizationName": "设计部",				//用户所属组织结构名称
            "description": "",							//描述，最长不超过256个字符
            "status": 0,								//状态，0: 正常, 1: 挂起, 默认值为0
            "tel": "13912345678",						//电话
            "mail": "zhangsan@abc.com",					//邮箱
            "type": 0,									//状态，0: 本地用户, 1：统一认证用户, 默认值为0
            "personalSpaceFlag": 0,						//开启个人空间标识, 0: 不开启, 1: 开启, 默认值为0
            "maxCapacity": 0,							//个人用户最大可用空间，单位字节
            "iconUrl": "http://127.0.0.1:8080/user/zhangsan.jpg"	//用户肖像地址
        },
        {
            "id": "lisi",
            "name": "李四",
            "workNo": "",
            "organizationId": "aofsd8uvnau87yr9ah",           
			"organizationName": "开发部",            
            "description": "",
            "status": 0,
            "tel": "13912345678",
            "mail": "lisi@abc.com",
            "type": 0,
            "personalSpaceFlag": 0,
            "maxCapacity": 0,
            "iconUrl": "http://127.0.0.1:8080/user/lisi.jpg"
        }
    ]
}
~~~
失败：400~500
~~~
{
  "info":"失败描述"
}
~~~

<h3 id="1_4">1.4根据id查询用户</h3>

###request

`GET http://server:port/cre/api/authorization/findUsersById`

`http://server:port/cre/api/authorization/findUsersById?userIds=zhangsan&userIds=lisi`

名称| 类型| 描述 |是否必须
----|-----|-----|-----
userIds|string|用户id|是

###response
成功：200
~~~
RequestBody
{
  "totalCount": 2,                             //总数
  "userList": [
        {
            "id": "zhangsan",					//用户ID，最长不超过36个字符
            "name": "张三",	  					//用户名
            "workNo": "",								//工号
            "organizationId": "23voeruqtp398ih98",       //用户所属组织结构ID
			"organizationName": "设计部",				//用户所属组织结构名称
            "description": "",							//描述，最长不超过256个字符
            "status": 0,								//状态，0: 正常, 1: 挂起, 默认值为0
            "tel": "13912345678",						//电话
            "mail": "zhangsan@abc.com",					//邮箱
            "type": 0,									//状态，0: 本地用户, 1：统一认证用户, 默认值为0
            "personalSpaceFlag": 0,						//开启个人空间标识, 0: 不开启, 1: 开启, 默认值为0
            "maxCapacity": 0,							//个人用户最大可用空间，单位字节
            "iconUrl": "http://127.0.0.1:8080/user/zhangsan.jpg"	//用户肖像地址
        },
        {
            "id": "lisi",
            "name": "李四",
            "workNo": "",
            "organizationId": "aofsd8uvnau87yr9ah",           
			"organizationName": "开发部",            
            "description": "",
            "status": 0,
            "tel": "13912345678",
            "mail": "lisi@abc.com",
            "type": 0,
            "personalSpaceFlag": 0,
            "maxCapacity": 0,
            "iconUrl": "http://127.0.0.1:8080/user/lisi.jpg"
        }
    ]
}
~~~
失败：400~500
~~~
{
  "info":"失败描述"
}
~~~

<h3 id="1_5">1.5用户查询-new</h3>

###request

`[POST] http://server:port/cre/api/authorization/users/new`

~~~
{
  "userName": "黄",
  "privilegeInfos": [
    {
      "privilegeId": "PID_PRODUCT_STATUS_AUDIT",
      "status": "待审核",
      "departmentId": "4A21AB47-3441-44DB-8C40-96CCF57BC531"
    },
    {
      "privilegeId": "PID_PRODUCT_STATUS_AUDIT",
      "status": "审核通过",
      "departmentId": "4A21AB47-3441-44DB-8C40-96CCF57BC531"
    }
  ]
}
~~~

名称| 类型| 描述 |是否必须
----|-----|-----|-----
userName|string|用户名（支持模糊查询）|否
privilegeId|string|权限id|否
departmentId|string|主分类id|否
status|string|状态（待审核、审核通过、已驳回、已签发）|否
注：多个privilegeInfos会取交集

###response
成功：200
~~~
RequestBody
{
  "totalCount": 2,                             //总数
  "userList": [
        {
            "id": "zhangsan",					//用户ID，最长不超过36个字符
            "name": "张三",	  					//用户名
            "workNo": "",								//工号
            "organizationId": "23voeruqtp398ih98",       //用户所属组织结构ID
			"organizationName": "设计部",				//用户所属组织结构名称
            "description": "",							//描述，最长不超过256个字符
            "status": 0,								//状态，0: 正常, 1: 挂起, 默认值为0
            "tel": "13912345678",						//电话
            "mail": "zhangsan@abc.com",					//邮箱
            "type": 0,									//状态，0: 本地用户, 1：统一认证用户, 默认值为0
            "personalSpaceFlag": 0,						//开启个人空间标识, 0: 不开启, 1: 开启, 默认值为0
            "maxCapacity": 0,							//个人用户最大可用空间，单位字节
            "iconUrl": "http://127.0.0.1:8080/user/zhangsan.jpg"	//用户肖像地址
        },
        {
            "id": "lisi",
            "name": "李四",
            "workNo": "",
            "organizationId": "aofsd8uvnau87yr9ah",           
			"organizationName": "开发部",            
            "description": "",
            "status": 0,
            "tel": "13912345678",
            "mail": "lisi@abc.com",
            "type": 0,
            "personalSpaceFlag": 0,
            "maxCapacity": 0,
            "iconUrl": "http://127.0.0.1:8080/user/lisi.jpg"
        }
    ]
}
~~~
失败：400~500
~~~
{
  "info":"失败描述"
}
~~~

<h3 id="1_6">1.6获取组织机构-new</h3>

###request

`[POST] http://server:port/cre/api/authorization/organization/load/mainclass`

~~~
{    
    "userId": "e18a0f771ac4485fa9107d8382326e57",
    "privilegePrefix":"PID_PRODUCT_FLODER_INCOMMINGDATA"
    
}
~~~

名称| 类型| 描述 |是否必须
----|-----|-----|-----
userId|string|用户ID|是
privilegePrefix|string|权限前缀|是

###response
成功：200
~~~
RequestBody
{
    "commonResponse": {
        "description": "",
        "success": true
    },
    "organizationList": [
        {
            "id": "4A21AB47-3441-44DB-8C40-96CCF57BC531",
            "text": "人民日报",
            "parentId": "5B0B5639-9594-4330-B8F2-EB782F9B57A3"
        },
        {
            "id": "BEC81C9F-6734-4146-B422-F9DF85F95920",
            "text": "要闻一部子部",
            "parentId": "8F7FAE74-BDD3-401B-9D0C-D966B879F106"
        },
        {
            "disabled": true,
            "id": "5B0B5639-9594-4330-B8F2-EB782F9B57A3",
            "text": "部门树",
            "parentId": "#"
        },
        {
            "disabled": true,
            "id": "8F7FAE74-BDD3-401B-9D0C-D966B879F106",
            "text": "要闻一部",
            "parentId": "5B0B5639-9594-4330-B8F2-EB782F9B57A3"
        }
    ],
    "totalCount": 4
}
~~~
失败：400~500
~~~
{
  "info":"失败描述"
}
~~~

<h3 id="1_7">1.7获取人员权限信息-new</h3>

###request

`[POST] http://server:port/cre/api/authorization/privilege/load/mainclass`

~~~
{
    "userId": "e18a0f771ac4485fa9107d8382326e57",
    "privilegePrefix": "PID_PRODUCT_STATUS_BROWSER"
}
~~~

名称| 类型| 描述 |是否必须
----|-----|-----|-----
userId|string|用户ID|是
privilegePrefix|string|权限前缀|是

###response
成功：200
~~~
RequestBody
{
    "privilegeList": [
        {
            "id": "PID_PRODUCT_STATUS_BROWSER",
            "name": "浏览",
            "groupId": "-",
            "description": "可浏览某一个状态的权限",
            "departmentIdList": [
                "BEC81C9F-6734-4146-B422-F9DF85F95920",
                "BEC81C9F-6734-4146-B422-F9DF85F95920",
                "BEC81C9F-6734-4146-B422-F9DF85F95920",
                "BEC81C9F-6734-4146-B422-F9DF85F95920",
                "4A21AB47-3441-44DB-8C40-96CCF57BC531",
                "4A21AB47-3441-44DB-8C40-96CCF57BC531",
                "4A21AB47-3441-44DB-8C40-96CCF57BC531",
                "4A21AB47-3441-44DB-8C40-96CCF57BC531"
            ],
            "statusList": [
                1,
                2,
                3,
                4,
                1,
                2,
                3,
                4
            ],
            "departmentList": [
                {
                    "id": "BEC81C9F-6734-4146-B422-F9DF85F95920",
                    "name": "要闻一部子部",
                    "parentId": "8F7FAE74-BDD3-401B-9D0C-D966B879F106"
                },
                {
                    "id": "BEC81C9F-6734-4146-B422-F9DF85F95920",
                    "name": "要闻一部子部",
                    "parentId": "8F7FAE74-BDD3-401B-9D0C-D966B879F106"
                },
                {
                    "id": "BEC81C9F-6734-4146-B422-F9DF85F95920",
                    "name": "要闻一部子部",
                    "parentId": "8F7FAE74-BDD3-401B-9D0C-D966B879F106"
                },
                {
                    "id": "BEC81C9F-6734-4146-B422-F9DF85F95920",
                    "name": "要闻一部子部",
                    "parentId": "8F7FAE74-BDD3-401B-9D0C-D966B879F106"
                },
                {
                    "id": "4A21AB47-3441-44DB-8C40-96CCF57BC531",
                    "name": "人民日报",
                    "parentId": "5B0B5639-9594-4330-B8F2-EB782F9B57A3"
                },
                {
                    "id": "4A21AB47-3441-44DB-8C40-96CCF57BC531",
                    "name": "人民日报",
                    "parentId": "5B0B5639-9594-4330-B8F2-EB782F9B57A3"
                },
                {
                    "id": "4A21AB47-3441-44DB-8C40-96CCF57BC531",
                    "name": "人民日报",
                    "parentId": "5B0B5639-9594-4330-B8F2-EB782F9B57A3"
                },
                {
                    "id": "4A21AB47-3441-44DB-8C40-96CCF57BC531",
                    "name": "人民日报",
                    "parentId": "5B0B5639-9594-4330-B8F2-EB782F9B57A3"
                }
            ]
        }
    ],
    "totalCount": 1,
    "commonResponse": {
        "success": true,
        "description": ""
    }
}
~~~
失败：400~500
~~~
{
  "info":"失败描述"
}
~~~

<h3 id="2_1">2.1新增选题目录</h3>

###request

`POST http://server:port/cre/api/topic`
~~~
{
  "userId":"admin",
  "token":"ST-53-R4FZlngYZ2eAzdofZd7J-cas",
  "topicList": [
    {
      "id": "EE2104CB-619B-446D-8E00-9BAB3340CEAD",
      "name": "美军一航母战斗群驶入南海",
      "lifeCycleDays": 1,
      "keepSecretDays": 10,
	  "participantId":"zhaoyangkun",
      "principalId":"zhaoyangkun",
	  "createrId":"zhaoyangkun",
      "aclContent": "ROLE_ID_SEARCHER,11,Viewer_download;admin,10,Admin;BB7957C8-AFA4-4C22-A8F6-96FA10ED795A,12,Editor;",
      "metadataInfo": "<?xml version=\"1.0\" encoding=\"UTF-8\"?><MetaData MetaDataCount=\"1\"><sAttribute enumType=\"0\" strName=\"选题状态\"><![CDATA[进行中]]></sAttribute></MetaData>"
    },
    {
      "id": "999104CB-619B-446D-8E00-9BAB3340CEAD",
      "name": "2016年两会",
      "lifeCycleDays": 1,
      "keepSecretDays": 10,
	  "participantId":"zhaoyangkun",
      "principalId":"zhaoyangkun",
	  "createrId":"zhaoyangkun",
      "aclContent": "ROLE_ID_SEARCHER,11,Viewer_download;admin,10,Admin;BB7957C8-AFA4-4C22-A8F6-96FA10ED795A,12,Editor;",
      "metadataInfo": "<?xml version=\"1.0\" encoding=\"UTF-8\"?><MetaData MetaDataCount=\"1\"><sAttribute enumType=\"0\" strName=\"选题状态\"><![CDATA[终止]]></sAttribute></MetaData>"
    }
  ]
}

~~~
名称| 描述| 类型 |是否必须
----|-----|-----|-----
userId|增加选题目录的用户编号|string|是
token|令牌|string|否
topicList|需要添加的选题目录列表|string|是
id|选题目录id|string|是
name|选题目录名称|string|是
lifeCycleDays|生命周期天数，超过之后，该目录自动删除，值为0时表示暂不设置生命周期。不确定是否有用|string|否
participantId|选题参与人id|string|是
principalId|选题负责人id|string|是
createrId|选题创建人id|string|是
keepSecretDays|解禁天数，超过之后该目录及其选题对所有用户公开，值为0时默认对所有用户公开。不确定是否有用|string|否
aclContent|访问控制描述。可设置多组访问者，由分号隔开。每组访问者内部分为3个元素，由逗号隔开，第一个元素是访问者id，可以为用户id/角色id/组织结构id，第二个元素为访问者类型，候选值如下，10：用户，11：角色，12：组织结构。第三个元素为操作组标识，候选值如下:Admin：管理员，AdvEditor：编辑者(高级)，Co-owner：拥有者，Editor：编辑者，Previewer：预览，Uploader：上传，Viewer：浏览，Viewer_download：浏览下载，Viewer_uploader：浏览上传，Viewer_uploader_download：浏览上传下载|string|否
metadataInfo|元数据信息|string|否
###响应

成功：201(http状态码)
~~~
ResponseBody
{
  "addTopicListResponse": [
    {
      "id": "EE2104CB-619B-446D-8E00-9BAB3340CEAD",
      "description": "成功",
      "folderList": [
        {
          "folderId": "071717B0-401F-4D94-9F2B-605349CE9B6C",
          "topicType": 1
        },
        {
          "folderId": "448129B9-A79C-4CE8-97D2-1E9FB5A15579",
          "topicType": 2
        }
      ]
    },
    {
      "id": "999104CB-619B-446D-8E00-9BAB3340CEAD",
      "description": "成功",
      "folderList": [
        {
          "folderId": "A6A73C56-FE43-4C78-BF31-DCF990302596",
          "topicType": 1
        },
        {
          "folderId": "C299E767-A4B9-48A6-9B9C-7F301A83C91B",
          "topicType": 2
        }
      ]
    }
  ]
}
~~~

失败:400~500(http状态码)
~~~
ResponseBody
{
    "addTopicListResponse": [{
		"id": " EE2104CB-619B-446D-8E00-9BAB3340CEAD", //选题id
        "description": "失败描述",		
    }]
}
~~~

<h3 id="2_2">2.2修改选题目录</h3>

###request

`PUT http://server:port/cre/api/topic`
~~~
{
  "userId":"admin",
  "token":"ST-53-R4FZlngYZ2eAzdofZd7J-cas",
  "topicList": [
    {
      "id": "EE2104CB-619B-446D-8E00-9BAB3340CEAD",
      "name": "美军一航母战斗群驶入南海(修改)",
      "lifeCycleDays": 1,
      "keepSecretDays": 10,
	  "participantId":"zhaoyangkun",
      "principalId":"zhaoyangkun",
	  "createrId":"zhaoyangkun",
      "aclContent": "ROLE_ID_SEARCHER,11,Viewer_download;admin,10,Admin;BB7957C8-AFA4-4C22-A8F6-96FA10ED795A,12,Editor;",
      "metadataInfo": "<?xml version=\"1.0\" encoding=\"UTF-8\"?><MetaData MetaDataCount=\"1\"><sAttribute enumType=\"0\" strName=\"选题状态\"><![CDATA[进行中]]></sAttribute></MetaData>"
    },
    {
      "id": "999104CB-619B-446D-8E00-9BAB3340CEAD",
      "name": "2016年两会(修改)",
      "lifeCycleDays": 1,
      "keepSecretDays": 10,
	  "participantId":"zhaoyangkun",
      "principalId":"zhaoyangkun",
	  "createrId":"zhaoyangkun",
      "aclContent": "ROLE_ID_SEARCHER,11,Viewer_download;admin,10,Admin;BB7957C8-AFA4-4C22-A8F6-96FA10ED795A,12,Editor;",
      "metadataInfo": "<?xml version=\"1.0\" encoding=\"UTF-8\"?><MetaData MetaDataCount=\"1\"><sAttribute enumType=\"0\" strName=\"选题状态\"><![CDATA[终止]]></sAttribute></MetaData>"
    }
  ]
}    

~~~
名称| 描述| 类型 |是否必须
----|-----|-----|-----
userId|修改选题目录的用户编号|string|是
token|令牌|string|否
topicList|选题目录列表|string|是
id|选题目录id|string|是
name|选题目录名称|string|是
lifeCycleDays|生命周期天数，超过之后，该目录自动删除，值为0时表示暂不设置生命周期。不确定是否有用|string|否
participantId|选题参与人id|string|是
principalId|选题负责人id|string|是
createrId|选题创建人id|string|是
keepSecretDays|解禁天数，超过之后该目录及其选题对所有用户公开，值为0时默认对所有用户公开。不确定是否有用|string|否
aclContent|访问控制描述。可设置多组访问者，由分号隔开。每组访问者内部分为3个元素，由逗号隔开，第一个元素是访问者id，可以为用户id/角色id/组织结构id，第二个元素为访问者类型，候选值如下，10：用户，11：角色，12：组织结构。第三个元素为操作组标识，候选值如下:Admin：管理员，AdvEditor：编辑者(高级)，Co-owner：拥有者，Editor：编辑者，Previewer：预览，Uploader：上传，Viewer：浏览，Viewer_download：浏览下载，Viewer_uploader：浏览上传，Viewer_uploader_download：浏览上传下载|string|否
metadataInfo|元数据信息|string|否
###响应
成功：200(http状态码)
~~~
ResponseBody
{
  "updateTopicListResponse": [
    {
      "id": "EE2104CB-619B-446D-8E00-9BAB3340CEAD",
      "description": "成功",
      "folderList": [
        {
          "folderId": "071717B0-401F-4D94-9F2B-605349CE9B6C",
          "topicType": 1
        },
        {
          "folderId": "448129B9-A79C-4CE8-97D2-1E9FB5A15579",
          "topicType": 2
        }
      ]
    },
    {
      "id": "999104CB-619B-446D-8E00-9BAB3340CEAD",
      "description": "成功",
      "folderList": [
        {
          "folderId": "A6A73C56-FE43-4C78-BF31-DCF990302596",
          "topicType": 1
        },
        {
          "folderId": "C299E767-A4B9-48A6-9B9C-7F301A83C91B",
          "topicType": 2
        }
      ]
    }
  ]
}

~~~

失败:400~500(http状态码)
~~~
ResponseBody
{
    "updateTopicListResponse": [{
		"id": " EE2104CB-619B-446D-8E00-9BAB3340CEAD", //选题id
        "description": "失败描述",		
    }]
}
~~~

<h3 id="2_3">2.3删除选题目录</h3>

###request

`DELETE http://server:port/cre/api/topic`
~~~
{
  "userId":"admin",
  "token":"ST-53-R4FZlngYZ2eAzdofZd7J-cas",
  "isLogicDelete":true, 
  "ids":"EE2104CB-619B-446D-8E00-9BAB3340CEAD,999104CB-619B-446D-8E00-9BAB3340CEAD"
}

~~~
名称| 描述| 类型 |是否必须
----|-----|-----|-----
userId|修改选题目录的用户编号|string|是
token|令牌|string|否
isLogicDelete|是否为逻辑删除。逻辑删除的目录会进入回收站，后续可还原。|boolean|是
ids|选题id，用逗号隔开|string|是
###响应
成功：204(http状态码)
~~~
ResponseBody
{
    "deleteTopicListResponse": [{
        "id": " EE2104CB-619B-446D-8E00-9BAB3340CEAD", //选题id
        "description": "成功"
	}]
}

~~~

失败:400~500(http状态码)
~~~
ResponseBody
{
    "deleteTopicListResponse": [{
		"id": " EE2104CB-619B-446D-8E00-9BAB3340CEAD", //选题id
        "description": "失败描述",		
    }]
}
~~~

<h3 id="2_4">2.4检索选题资源</h3>

###request

`POST: http://server:port/cre/api/search`
~~~
{
  "token":"ST-53-R4FZlngYZ2eAzdofZd7J-cas",
  "conditions": [
    {                                                       
      "id": "TOPICID",
      "value": "911BCDCA-B272-4F52-B1F0-E476037716C6"
    },
    {
      "id": "TOPICTYPE",
      "value": "1"
    }    
  ],
  "userId": "admin",
  "searchInFile": false,
  "extendResultFields": "TOPICTYPE,产品状态", 
  "needSummary": true,
  "needHightLight": true,
  "orderBy": "created desc",
  "start": 0,
  "limit": 20
}   

~~~
名称| 描述| 类型 |是否必须
----|-----|-----|-----
token|令牌|string|是
id|字段id，除了一些字段有特殊含义之外，其余字段都可为任意的编目字段，CONTENT– 全文；NAME– 名称；CCID– 编目类id；TYPE– 资源类型；HDFLAG – 高标清标志（0：标清；1：高清）；CREATED – 创建时间；FILESTATUS – 文件状态；OWNER – 拥有者；ID – 资源ID；PARENTID – 父资源ID；ROOTID– 根资源ID；PROGCODE – 节目代码；PUBLISHSTATUS – 发布状态；FOLDERID – 资源目录ID；DOMAINTYPE – 资源域类型（0：公共资源域；1：群组资源域；2：个人资源域）|string|是
value|检索词。其中全文字段支持与或非表达式，空格表示“与”， or表示“或”， -表示“非”|string|是
userId|用户id|string|是
searchInFile|是否在附件中检索，默认为false|boolean|否
extendResultFields|结果集每个条目额外返回的元数据项，需要返回多个时以逗号隔开|string|否
needSummary|结果集每个条目是否返回摘要信息，默认为true|boolean|否
needHightLight|	结果集每个条目是否对名称和摘要命中检索词的部分进行高亮处理，默认为true|boolean|否
orderBy|	排序。如果不填则按权重排序，如果填写排序方式，其格式为字段id+空格+排序方式，如“created desc”|string|否
start|结果集条目的起始位置，从0开始|int|是
limit|结果集条目每页显示的数量，最大不超过1000|int|是
###响应
~~~
{
  "commonResponse": {
    "success": true,
    "description": null
  },
  "totalCount": 1,
  "start": 0,
  "limit": 20,
  "currentPage": 1,
  "totalPage": 1,
  "itemList": [
    {
      "id": "344A3CFF-DEE8-43F2-B783-C3297DDE6FE0",
      "name": "视音频<font color='red'>测</font><font color='red'>试</font>test003",
      "originalName": "视音频测试test003",
      "ccid": "新闻节目类",
      "type": 0,
      "subType": 0,
      "iconUrl": "http://100.0.10.51/icon/2015/06/24/344A3CFF-DEE8-43F2-B783-C3297DDE6FE0.jpg",
      "detailUrl": "http://100.0.10.51:8080/portal/toDetail?resourceID=DEC71C55-0A94-4158-A4D1-C5BCADFE3A02",
      "parentId": "-",
      "rootId": "344A3CFF-DEE8-43F2-B783-C3297DDE6FE0",
      "inpoint": 0,
      "outpoint": 0,
      "created": "2015-07-14 13:37:45",
      "lastModify": "2015-07-14 15:23:35",
      "mediaId": null,
      "downloadCounts": 1,
      "viewCounts": 3,
      "securityId": "-",
      "fileStatus": 0,
      "videoStandard": 1,
      "progCode": null,
      "source": "webupload",
      "hdFlag": 0,
      "afdType": 0,
      "proType": 0,
      "publishStatus": 0,
      "publishTime": null,
      "onlineLifeCycle": null,
      "seriesId": "-",
      "seriesIndex": 1,
      "folderId": "-",
      "point": 0,
      "reportCount": 0,
      "shareFlag": 0,
      "owner": null,
      "hasFile": 1,
      "summary": "视音频<font color='red'>测</font><font color='red'>试</font>test003 视音频<font color='red'>测

</font><font color='red'>试</font>test003 视音频<font color='red'>测</font><font color='red'>试</font>test003 ",
      "extendAttributes": [
        {
          "id": "频道",
          "name": "频道",
          "value": "CCTV-5"
        },
        {
          "id": "栏目名称",
          "name": "栏目",
          "value": "天下足球"
        },
        {
          "id": "首播日期",
          "name": "首播日期",
          "value": "2015-07-13 20:00:00"
        }
      ],
      "metadataInfo": "<?xml version="1.0" encoding="UTF-8"?><MetaData MetaDataCount="1"><sAttribute enumType="0" strName="正题名"><![CDATA[资源详情.]]></sAttribute></MetaData>",
      "files": [
        {
          "fileId": "1249586A-7951-48CD-8426-0D795B524500",
          "fileName": "0b8e2fd3-872d-4361-84cb-74a0b2259a03_LOW_0.mp4",
          "fileType": 2,
          "fileTypeId": "LOW",
          "fileSize": 27028637,
          "md5Code": "",
          "streamMediaInfo": "<?xml version=\"1.0\" encoding=\"UTF-16\"?><MEDIAINFO Version=\"1.1\"><sStreamMediaInfo 

enumStreamMediaType=\"128\" dwStreamMediaSubType=\"0\" bIsIncludeVideo=\"1\" bIsIncludeAudio=\"1\" 

dwTotalAverDataRateInBitsPerSec=\"0\" dwTotalMaxDataRateInBitsPerSec=\"0\" dwTotalMinDataRateInBitsPerSec=

\"0\"><sVideoMediaInfo wWidth=\"640\" wHeight=\"360\" dwStandardRate=\"25\" dwStandardScale=\"1\" enumScanMode=\"2\" 

enumColorFormat=\"1024\" enumVideoType=\"8388608\" dwVideoSubType=\"1\" dwDataRateInBitsPerSec=\"1500000\" bConstantRate=

\"1\" dwGOPSize=\"50\" dwReferencePeriod=\"3\" bIsY16_235=\"1\" dwDisplayWidth=\"16\" dwDisplayHeight=\"9\" 

enumColorPrimaries=\"5\" enumColorTransfer=\"5\" enumColorMatrix=\"5\" enumAFD=\"8\"/><sAudioMediaInfo enumAudioType=\"32\" 

dwAudioSubType=\"0\" dwChannels=\"2\" dwBitsPerSample=\"16\" dwSamplesPerSec=\"48000\" dwAvgBitsPerSec=\"128000\" 

dwBlockAlign=\"4\" enumAudioCFG=\"2\" enumChannelSamplesFormat=\"1\"/></sStreamMediaInfo></MEDIAINFO>",
          "uncPath": "D:/Files/mamFiles/Low/2014/08/04",
          "streamMediaPath": "http://192.168.205.59:8080/lowres/2014/08/04",
          "ftpPath": "ftp://admin:admin@100.0.10.51/lowres/2014/08/04",
          "bitrateType": 1,
          "channelIndex": 0
        },
        {
          "fileId": "3FB0CFF8-D608-45C7-81B1-873C1924203F",
          "fileName": "0b8e2fd3-872d-4361-84cb-74a0b2259a03_HDV_0.mxf",
          "fileType": 0,
          "fileTypeId": "SDV",
          "fileSize": 27028637000,
          "md5Code": "",
          "streamMediaInfo": "<?xml version=\"1.0\" encoding=\"UTF-16\"?><MEDIAINFO Version=\"1.1\"><sStreamMediaInfo 

enumStreamMediaType=\"1\" dwStreamMediaSubType=\"0\" bIsIncludeVideo=\"1\" bIsIncludeAudio=\"0\" llFileSize=\"0\" 

dwVideoFrame=\"0\" dwAudioSamples=\"0\" dwTotalAverDataRateInBitsPerSec=\"0\" dwTotalMaxDataRateInBitsPerSec=\"0\" 

dwTotalMinDataRateInBitsPerSec=\"0\"><sVideoMediaInfo wWidth=\"1920\" wHeight=\"1080\" dwStandardRate=\"25\" 

dwStandardScale=\"1\" enumScanMode=\"0\" enumColorFormat=\"512\" enumVideoType=\"8\" dwVideoSubType=\"0\" 

dwDataRateInBitsPerSec=\"50000000\" bConstantRate=\"1\" dwGOPSize=\"12\" dwReferencePeriod=\"3\" bIsY16_235=\"1\" 

dwDisplayWidth=\"16\" dwDisplayHeight=\"9\" enumColorPrimaries=\"1\" enumColorTransfer=\"1\" enumColorMatrix=\"1\" 

enumAFD=\"8\"/><sAudioMediaInfo enumAudioType=\"1\" dwAudioSubType=\"0\" dwChannels=\"1\" dwBitsPerSample=\"16\" 

dwSamplesPerSec=\"48000\" dwAvgBitsPerSec=\"768000\" dwBlockAlign=\"2\" enumAudioCFG=\"1\" enumChannelSamplesFormat=

\"1\"/></sStreamMediaInfo><sStreamMediaInfo enumStreamMediaType=\"4\" dwStreamMediaSubType=\"0\" bIsIncludeVideo=\"0\" 

bIsIncludeAudio=\"1\" llFileSize=\"0\" dwVideoFrame=\"0\" dwAudioSamples=\"0\" dwTotalAverDataRateInBitsPerSec=\"0\" 

dwTotalMaxDataRateInBitsPerSec=\"0\" dwTotalMinDataRateInBitsPerSec=\"0\"><sVideoMediaInfo wWidth=\"720\" wHeight=\"576\" 

dwStandardRate=\"25\" dwStandardScale=\"1\" enumScanMode=\"0\" enumColorFormat=\"1024\" enumVideoType=\"0\" 

dwVideoSubType=\"0\" dwDataRateInBitsPerSec=\"25000000\" bConstantRate=\"1\" dwGOPSize=\"14\" dwReferencePeriod=\"2\" 

bIsY16_235=\"1\" dwDisplayWidth=\"4\" dwDisplayHeight=\"3\" enumColorPrimaries=\"5\" enumColorTransfer=\"5\" 

enumColorMatrix=\"5\" enumAFD=\"8\"/><sAudioMediaInfo enumAudioType=\"1\" dwAudioSubType=\"0\" dwChannels=\"1\" 

dwBitsPerSample=\"16\" dwSamplesPerSec=\"48000\" dwAvgBitsPerSec=\"768000\" dwBlockAlign=\"2\" enumAudioCFG=\"1\" 

enumChannelSamplesFormat=\"1\"/></sStreamMediaInfo></MEDIAINFO>",
          "uncPath": "D:/Files/mamFiles/High/2014/08/04",
          "streamMediaPath": "",
          "ftpPath": "ftp://admin:admin@100.0.10.51/High/2014/08/04",
          "bitrateType": 1,
          "channelIndex": 0
        }
      ]
    }
  ],
  "useTime": 113
}
~~~

<h3 id="2_5">2.5选题目录资源新增/另存为</h3>

###request

`POST http://server:port/cre/api/topic/resource`

`url参数：isSaveAs={0, 1}，0为新增，1为另存为，可不填，默认为新增`

`请求`
~~~
新增RequestBody：

{
    "token":"ST-53-R4FZlngYZ2eAzdofZd7J-cas",
    "userId":"admin",
    "userName":"admin",
    "resourceList": [
        {
            "id": "901BCDCA-B272-4F52-B1F0-E476037716C6",
            "name": "新纪录07",
            "proType": 0,
            "resourceType": 0,
            "source": "Ingest",
            "scpInId":"B5B2361F-6B55-408D-A11C-16CF9444C682",
            "ccid":"新闻节目类",
            "duration": 1502,
            "topicId": "EE2104CB-619B-446D-8E00-9BAB3340CEAD",
            "topicType":1,
			"topicParticipantId":"zhaoyangkun,zhangsan",
			"topicPrincipalId":"zhaoyangkun",
			"topicCreaterId":"zhaoyangkun",
            "files": [
                {
                    "fileId": "C648E3DF-E107-42FF-A25E-1D62380DA2B4",
                    "fileName": "高清eLORS测试.ts",
                    "fileType":2,
                    "md5Code": "",
                    "fileSize":"423424",
                    "ftpPath": "",
                    "streamMediaPath": "",
                    "uncPath": "\\\\100.0.10.168\\cretest\\Low-Res\\2015\\06\\17"
                }
            ]
        }
    ]
}     

另存为RequestBody：

{
    "token":"ST-53-R4FZlngYZ2eAzdofZd7J-cas",
    "userId":"0003",
    "userName":"0003",
    "resourceList": [
        {
            "id": "734BD133-4019-48D4-866D-F1642002FBBD",
            "name": "资源复制测试20160630002",
            "scpInId":"539D001C-1205-422F-9895-86146B472E9E",
            "source":"DYEIDT",
            "topicId":"681EDCD3-3AA1-4F79-89BB-4214941B2558",
            "topicType": 1,
			"topicParticipantId":"zhaoyangkun,zhangsan",
			"topicPrincipalId":"zhaoyangkun",
			"topicCreaterId":"zhaoyangkun",
            "files": [
                {
                    "fileId": "C648E3DF-E107-42FF-A25E-1D62380DA2B4",
                    "fileName": "高清eLORS测试.ts"
                }
            ]
        }
    ]
}

~~~
`新增参数：`

名称| 描述| 类型 |是否必须
----|-----|-----|-----
token|令牌|string|是
userId|创建选题的用户编号|string|否
userName|	创建选题的用户名称|string|否
resourceList|上述参数均为接口级别的参数，以下参数均为选题级别的参数 
id|选题资源id|string|是
name|选题资源名称|string|是
proType|节目类型，默认值为0,候选值如下:0：节目；1：素材|int|否
resourceType|资源类型，默认值为0,候选值如下:0：视音频资源；1：纯音频资源；2：集合类资源（剧集类，CD集合类，收录资源池等）；3：图片资源；4：文档资源；5：复杂资源；6：主题资源；7：文件夹资源；8：新闻串联单资源；9：新闻条目资源；10：全媒体稿件资源；11：微信；12：微博；13：短信；14：互联网网页；15：宣传计划；16：新闻线索|int|是
source|	来源系统|string|是
scpInId”|入库参数id,可选，如果传递按照此id匹配入库参数，如果不传递，则通过source获取入库参数|string|否
ccid|	编目类|string|否
duration|资源时长,单位（帧 ）|long|是
topicId|目录id|string|是
topicType|目录类型1：素材 2：产品|int|是
topicParticipantId|参与人id|string|是
topicPrincipalId|负责人id|string|是
topicCreaterId|创建人id|string|是
files|
fileId|资源文件id|string|是
fileName|资源文件名称|string|是
fileType|文件类型，候选值如下:0：标清；1：单声道；2：低码率（可同时表示视音频，图片和文档的低码文件）；3：服务器；4：关键帧；5：高清；6：立体声；7：图文（废弃）；8：Zxcel2k；9：IMAGE；10：肖像；11：字幕；12：文档；100：其它(其他附件)|string|是
md5Code|MD5码|string|是
fileSize|文件大小，单位是字节-byte, 检验入库的栏目空间时需要传递|string|否
ftpPath|ftp路径|string|否
streamMediaPath|	流媒体路径|string|否
uncPath|unc路径|string|否

`另存为参数：`

名称| 描述| 类型 |是否必须
----|-----|-----|-----
token|令牌|string|是
userId|创建选题的用户编号|string|否
userName|	创建选题的用户名称|string|否
resourceList|上述参数均为接口级别的参数，以下参数均为选题级别的参数 
id|选题id|string|是
name|选题名称|string|是
source|	来源系统|string|是
scpInId”|入库参数id,可选，如果传递按照此id匹配入库参数，如果不传递，则通过source获取入库参数|string|否
topicId|选题目录id|string|是
topicType|选题目录类型1：素材 2：产品|int|是
topicParticipantId|参与人id|string|是
topicPrincipalId|负责人id|string|是
topicCreaterId|创建人id|string|是
files|
fileId|资源文件id|string|是
fileName|资源文件名称|string|是

###响应

成功：201(http状态码)
~~~
新增ResponseBody
{
  "addResourceListResponse": [
    {
      "id": "901BCDCA-B272-4F52-B1F0-E476037716C6",
      "success": true,
      "description": "成功"
    }
  ]
}

另存为ResponseBody
{
    "saveAsResourceListResponse": [{
            "id": "911BCDCA-B272-4F52-B1F0-E476037716C6",//新资源ID
            "description": "成功"
    }]
}
~~~
失败:400~500(http状态码)
~~~
新增ResponseBody
{
    "addResourceListResponse": [{
            "id": "901BCDCA-B272-4F52-B1F0-E476037716C6",
			"success": false,
            "description": "失败描述"
    }]
}

另存为ResponseBody
{
    "saveAsResourceListResponse": [{
            "id": "911BCDCA-B272-4F52-B1F0-E476037716C6",
            "description": "失败描述"
    }]
}
~~~

<h3 id="3_1">3.1获取文件存储路径及流媒体路径</h3>

###request

`GET http://server:port/cre/api/resources/richText/{resourceId}/filePath?fileNameSuffix={png}`

名称| 类型| 描述 |是否必须
----|-----|-----|-----
resourceId|string|稿件id|是
fileNameSuffix|string|文件名后缀(不传递该参数时返回的相对路径和文件名称为空)|否
isAttachment|boolean|是否是附件类型（默认否）|否

###response

成功:200
~~~
{
  "uncRootPath": "\\\\192.168.8.240\\storage\\path\\Low-Res",			//unc根路径
  "localRootPath": "/mnt/storage/path/Low-Res",							//本机根路径
  "httpRootPath": "http://192.168.8.244/crelow",			//流媒体根路径
  "relativePath": "2017/06/22",			//相对路径
  "fileName": "723FCB2B-C615-44B0-9897-69C1221A29FF_LOW_0.mp4",		//文件名称
  "fileTypeId":"ATTACHMENT", //文件类型
  "fullName":"\\\\192.168.8.240\\storage\\path\\Other/2017/06/23/28CFB8E9-6714-42C4-B6D9-E5DE48632562_IMAGE_0.jpg",//文件全路径
  "fullPath":"\\\\192.168.8.240\\storage\\path\\Other/2017/06/23", //文件的目录全路径"
  "ftpPath": "/Other" //ftp路径
}
~~~

失败:400~500
~~~
{
  "info": "失败描述"
}
~~~

<h3 id="3_2">3.2创建资源文件</h3>

###request

`PUT http://server:port/cre/api/resources/richText/{resoureId}/file`

~~~
{
  "fileId": "fjq9348fj823u49f",
  "fileName": "ffj09-fj349fj-jf34jf0f-f203fj_IMAGE_0.png",
  "fileTypeId":"ATTACHMENT",
  "extension":"jpg",
  "fileSize":20000,
  "relativePath":"2017/06/23"
}
~~~

名称| 类型| 描述 |是否必须
----|-----|-----|-----
resourceId|string|稿件id(该id在客户端维护，此时cre可能并未存在该资源)|是
fileId|string|文件id|是
fileName|string|文件名称|是
fileTypeId|string|文件类型ID|是
extension|string|文件后缀名|是
fileSize|int|文件大小|是
relativePath|string|相对路径|是

###response

成功:200

失败:400~500
~~~
{
  "info": "失败描述"
}
~~~

<h3 id="3_3">3.3获取稿件最新版本详细信息</h3>

###request

`GET http://server:port/cre/api/resources/richText/{resoureId}/latestVersion`

名称| 类型| 描述 |是否必须
----|-----|-----|-----
resourceId|string|稿件id|是
###response

成功:200
~~~
{ 
  "title": "习近平参访",							//标题
  "eyebrowHead": "习近平参访",					//引题
  "subtitle": "习近平参访",						//副标题
  "content": "<p>习近平</p>参访",				//内容
  "createTime": 2304982034890,					//创建时间，1990年后毫秒数
  "editorId": "faweofjq9in0dfqj23o",			//最后编辑人
  "authorName": "张三",							//作者姓名
  "topicId": "fjw90fno9f20hq2389f",				//选题id
  "topicName": "一带一路",						//选题名称    
  "auditorId": "fja30fjo349",					//审核人id
  "auditorName": "李四",							//审核人名称
  "productStatus": "待审核",						//产品状态，产品状态分为"草稿，待审核，被驳回，审核通过，已发布"
  "source": "新华社",							//来源
  "keyWords": "时政",							//关键词
  "attachmentList": [
    {
      "fileId": "aof39rfj90w3rj2",			//附件id
	  "fileName": "file.jpg",						//附件名称
      "httpPath": "http://192.168.8.244/file.jpg"	//附件的http路径
	  "fileType": "IMAGE"						//文件类型，IMAGE(图片)，DOCUMENT(文档)，HDV(高清视频)，SDV(标清视频)
    }
  ]
}
~~~
失败:400~500
~~~
{
  "info": "失败描述"
}
~~~

<h3 id="3_4">3.4获取稿件所有版本详细信息</h3>

###request

`GET http://server:port/cre/api/resources/richText/{resoureId}/allVersion`

名称| 类型| 描述 |是否必须
----|-----|-----|-----
resourceId|string|稿件id|是
isEveryOneLatest|boolean|是否值获取每个人最新的版本|否
versionList|string|版本号，可传递多个 '?versionList=version_1&versionList=version2&versionList=version_3'，如果传递了该参数，isEveryOneLatest参数无效|否
###response

成功:200
~~~
[{
  "version": "version_1",
  "content": "<p>习近平</p>参访",
  "authorId": "faweofjq9in0dfqj23o",
  "author": "张三",
  "createTime": 128308102398,
  "color": "#9999FF"
},{
  "version": "version_2",
  "content": "<p>习近平</p>参访新加坡",
  "authorId": "fafhw4rfn8w349f",
  "author": "李四"
  "createTime": 128308102399,
  "color": "#FFFF33"
},{
  "version": "version_3",
  "content": "<p>习近平</p>与12日参访新加坡",
  "authorId": "faweofjq9in0dfqj23o",
  "author": "张三"
  "createTime": 128308102490,
  "color": "#99CCFF"
}]
~~~
失败:400~500
~~~
{
  "info": "失败描述"
}
~~~

<h3 id="3_5">3.5保存稿件</h3>

###request

`PUT http://server:port/cre/api/resources/richText/{resoureId}?newVersion={true or false}`

~~~
{
  "title": "习近平参访",
  "eyebrowHead": "习近平参访",
  "subtitle": "习近平参访",
  "content": "<p>习近平</p>参访",	
  "folderId": "ajfqf09q3-faj0-fq903fjodfj",
  "editorId": "faweofjq9in0dfqj23o",		
  "authorName": "张三",							
  "topicId": "fjw90fno9f20hq2389f",
  "topicName": "一带一路",  
  "auditorId": "fja30fjo349",
  "auditorName": "李四",
  "productStatus": "待审核",
  "source": "新华社",
  "keyWords": "时政",
  "attachmentList": [
    {
      "fileId": "aof39rfj90w3rj2"
    }
  ]
}
~~~

名称| 类型| 描述 |是否必须
----|-----|-----|-----
resourceId|string|稿件id|是
newVersion|boolean|是否为新版本(不填默认为false)，当用户点击保存时传递false，点击保存并关闭时传递true|否
title|string|标题|是
eyebrowHead|string|引题|否
subtitle|string|副标题|否
content|string|稿件内容|是
folderId|string|目录ID|是
editorId|string|当前编辑人|是
authorName|string|作者姓名|否
topicId|string|选题id|否
topicName|string|选题名称|否
auditorId|string|审核人id|否
auditorName|string|审核人名称|否
productStatus|string|产品状态([如果选择了直接通过(只有当前用户有审核权限(PID_AUDIT_PRODUCT)时才显示该选项，值为"审核通过"，如果选择了审核人，值为"待审核", 否则为"草稿"])|是
source|string|来源|否
keyWords|string|关键词|否
attachmentList|list|附件列表|否
attachmentList[].fileId|string|附件id|是
###response

成功:200

失败:400~500
~~~
{
  "info": "失败描述"
}
~~~
<h3 id="3_6">3.6删除文件</h3>

###request

`DELETE http://server:port/cre/api/resources/richText/{resoureId}/file/{fileId}`

名称| 描述| 类型 |是否必须
----|-----|-----|-----
resourceId|资源Id|string|是
fileId|文件id|string|是

###response
成功:200

失败:400/500
~~~
{
	"info": "失败描述"
}
~~~

<h3 id="3_7">3.7获取附件列表</h3>

###request

`GET http://server:port/cre/api/resources/richText/{resoureId}/attachments`

名称| 描述| 类型 |是否必须
----|-----|-----|-----
resourceId|资源Id|string|是

###response
成功:200
~~~
[
    {
      "fileId": "aof39rfj90w3rj2",          //附件id
      "fileName": "file.jpg",                       //附件名称
      "httpPath": "http://192.168.8.244/file.jpg"   //附件的http路径
      "fileType": "IMAGE"                       //文件类型，IMAGE(图片)，DOCUMENT(文档)，HDV(高清视频)，SDV(标清视频)
    }
  ]
~~~

失败:400/500
~~~
{
	"info": "失败描述"
}
~~~

<h3 id="4_1">4.1获取逻辑目录</h3>

###request

`GET http://server:port/cre/api/logicFolders`

名称| 描述| 类型 |是否必须
----|-----|-----|-----
userId|用户id(url参数)|string|是
###response
成功:200
~~~
[
  {
    "name": "个人资源",			//目录名称
    "searchConditions": [],		//检索条件，直接将此字段传递给2.4接口的conditions即可
    "children": [				//子目录
      {
        "name": "素材",
        "searchConditions": []
      }
    ]
  },
  {
    "name": "相关部门",
    "searchConditions": [],
    "children": [
      {
        "name": "总编室",
        "searchConditions": []
      }
    ]
  }
]
~~~
失败:400~500
~~~
{
  "info":"失败描述"
}
~~~

<h3 id="5_1">5.1获取资源操作信息</h3>

###request

`GET http://server:port/cre/api/searchAuditLogging?resourceId=resourceId&limit=0&start=10`

名称| 描述| 类型 |是否必须
----|-----|-----|-----
resourceId|资源id|string|是
limit|分页条件，每页显示多少条|int|是
start|分页条件，从第几条开始|int|是

###response
成功:200
~~~
{
  "limit": 10,
  "items": [{
            "created": "2017-07-19 10:01:48",			//操作时间
            "id": "4c56bada-485a-4a63-8f1f-94ace4253765",
            "describe": "",								//操作描述（审核意见）
			"detailOperation":"",						//操作详细描述
            "operateDescribe": "新建",					//操作内容
            "operator": {
                "uid": "e18a0f771ac4485fa9107d8382326e57",
                "uname": "黄少明"						//操作人
            }
        }],
  "totalCount": 1,
  "start": 1,
  "currentPage": 1,
  "totalPage": 0
}
~~~
失败:400~500
~~~
{
  "info": "失败描述"
}
~~~