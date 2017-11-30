-- 添加数据库脚本时，以['-- ' + 当前日期 + 操作人]为开头，下面跟数据库脚本。脚本中不可以加额外字符，以方便运维人员直接复制。

--2017-11-30
UPDATE `UPM_PRIVILEGE` VALUES ('PID_PRODUCT_STATUS_NEWSPAPER_EDITORIAL_COMPLEX', '复杂送纸报采编', '-', 1, '复杂送纸报采编', 0, NULL, NULL, 'admin', 1, 'product', '复杂送纸报采编', '1');

--2017-11-16 zhaoyangkun
INSERT INTO `UPM_PRIVILEGE` VALUES ('PID_PRODUCT_STATUS_NEWSPAPER_EDITORIAL', '送报纸采编', '-', 1, '送报纸采编', 0, NULL, NULL, 'admin', 1, 'product', '送报纸采编', '1');

-- 2017-11-08 dongbing
CREATE OR REPLACE VIEW VIEW_RESOURCE_TMP AS
	SELECT
		`cob_audio_product`.`OBJECTID` AS `objectId`,
		`cob_audio_product`.`FIELD1088` AS `organizationId`,
		`cob_audio_product`.`FIELD1077` AS `authorName`,
		`cob_audio_product`.`FIELD1073` AS `productStatus`,
		`cob_audio_product`.`FIELD1089` AS `productRange`,
		`cob_audio_product`.`FIELD1091` AS `auditorId`,
		`cob_audio_product`.`FIELD1092` AS `transmitId`,
		`cob_audio_product`.`FIELD1093` AS `publisherId`,
		`cob_audio_product`.`FIELD1070` AS `topicId`,
		NULL AS `knowledge`,
		NULL AS `line`,
		NULL AS `pressTime`
	FROM
		`cob_audio_product`
	UNION ALL
	SELECT
		`cob_doc_product`.`OBJECTID` AS `objectId`,
		`cob_doc_product`.`FIELD1088` AS `organizationId`,
		`cob_doc_product`.`FIELD1077` AS `authorName`,
		`cob_doc_product`.`FIELD1073` AS `productStatus`,
		`cob_doc_product`.`FIELD1089` AS `productRange`,
		`cob_doc_product`.`FIELD1091` AS `auditorId`,
		`cob_doc_product`.`FIELD1092` AS `transmitId`,
		`cob_doc_product`.`FIELD1093` AS `publisherId`,
		`cob_doc_product`.`FIELD1070` AS `topicId`,
		NULL AS `knowledge`,
		NULL AS `line`,
		NULL AS `pressTime`
	FROM
		`cob_doc_product`
	UNION ALL
	SELECT
		`cob_picture_product`.`OBJECTID` AS `objectId`,
		`cob_picture_product`.`FIELD1088` AS `organizationId`,
		`cob_picture_product`.`FIELD1077` AS `authorName`,
		`cob_picture_product`.`FIELD1073` AS `productStatus`,
		`cob_picture_product`.`FIELD1089` AS `productRange`,
		`cob_picture_product`.`FIELD1091` AS `auditorId`,
		`cob_picture_product`.`FIELD1092` AS `transmitId`,
		`cob_picture_product`.`FIELD1093` AS `publisherId`,
		`cob_picture_product`.`FIELD1070` AS `topicId`,
		`cob_picture_product`.`FIELD1106` AS `knowledge`,
		`cob_picture_product`.`FIELD1107` AS `line`,
		`cob_picture_product`.`FIELD1079` AS `pressTime`
	FROM
		`cob_picture_product`
	UNION ALL
	SELECT
		`cob_program_product`.`OBJECTID` AS `objectId`,
		`cob_program_product`.`FIELD1088` AS `organizationId`,
		`cob_program_product`.`FIELD1077` AS `authorName`,
		`cob_program_product`.`FIELD1073` AS `productStatus`,
		`cob_program_product`.`FIELD1089` AS `productRange`,
		`cob_program_product`.`FIELD1091` AS `auditorId`,
		`cob_program_product`.`FIELD1092` AS `transmitId`,
		`cob_program_product`.`FIELD1093` AS `publisherId`,
		`cob_program_product`.`FIELD1070` AS `topicId`,
		NULL AS `knowledge`,
		NULL AS `line`,
		NULL AS `pressTime`
	FROM
		`cob_program_product`
	UNION ALL
	SELECT
		`cob_attach`.`OBJECTID` AS `objectId`,
		`cob_attach`.`FIELD1088` AS `organizationId`,
		`cob_attach`.`FIELD1077` AS `authorName`,
		`cob_attach`.`FIELD1073` AS `productStatus`,
		`cob_attach`.`FIELD1089` AS `productRange`,
		`cob_attach`.`FIELD1091` AS `auditorId`,
		`cob_attach`.`FIELD1092` AS `transmitId`,
		`cob_attach`.`FIELD1093` AS `publisherId`,
		NULL AS `topicId`,
		NULL AS `knowledge`,
		NULL AS `line`,
		NULL AS `pressTime`
	FROM
		`cob_attach`
	UNION ALL
	SELECT
		`cob_fwbl`.`OBJECTID` AS `objectId`,
		`cob_fwbl`.`FIELD1088` AS `organizationId`,
		`cob_fwbl`.`FIELD1077` AS `authorName`,
		`cob_fwbl`.`FIELD1073` AS `productStatus`,
		`cob_fwbl`.`FIELD1089` AS `productRange`,
		`cob_fwbl`.`FIELD1091` AS `auditorId`,
		`cob_fwbl`.`FIELD1092` AS `transmitId`,
		`cob_fwbl`.`FIELD1093` AS `publisherId`,
		`cob_fwbl`.`FIELD1070` AS `topicId`,
		`cob_fwbl`.`FIELD1106` AS `knowledge`,
		`cob_fwbl`.`FIELD1107` AS `line`,
		`cob_fwbl`.`FIELD1079` AS `pressTime`
	FROM
		`cob_fwbl`
	UNION ALL
	SELECT
		`cob_vr_product`.`OBJECTID` AS `objectId`,
		`cob_vr_product`.`FIELD1088` AS `organizationId`,
		`cob_vr_product`.`FIELD1077` AS `authorName`,
		`cob_vr_product`.`FIELD1073` AS `productStatus`,
		`cob_vr_product`.`FIELD1089` AS `productRange`,
		`cob_vr_product`.`FIELD1091` AS `auditorId`,
		`cob_vr_product`.`FIELD1092` AS `transmitId`,
		`cob_vr_product`.`FIELD1093` AS `publisherId`,
		`cob_vr_product`.`FIELD1070` AS `topicId`,
		NULL AS `knowledge`,
		NULL AS `line`,
		NULL AS `pressTime`
	FROM
		`cob_vr_product`
	UNION ALL
	SELECT
		`cob_h5_product`.`OBJECTID` AS `objectId`,
		`cob_h5_product`.`FIELD1088` AS `organizationId`,
		`cob_h5_product`.`FIELD1077` AS `authorName`,
		`cob_h5_product`.`FIELD1073` AS `productStatus`,
		`cob_h5_product`.`FIELD1089` AS `productRange`,
		`cob_h5_product`.`FIELD1091` AS `auditorId`,
		`cob_h5_product`.`FIELD1092` AS `transmitId`,
		`cob_h5_product`.`FIELD1093` AS `publisherId`,
		`cob_h5_product`.`FIELD1070` AS `topicId`,
		NULL AS `knowledge`,
		NULL AS `line`,
		NULL AS `pressTime`
	FROM
		`cob_h5_product`;

CREATE OR REPLACE VIEW VIEW_RESOURCE_INFO AS
	SELECT
		`t`.`objectId` AS `objectId`,
		`t`.`organizationId` AS `organizationId`,
		`t`.`authorName` AS `authorName`,
		`t`.`productStatus` AS `productStatus`,
		`t`.`productRange` AS `productRange`,
		`t`.`auditorId` AS `auditorId`,
		`t`.`transmitId` AS `transmitId`,
		`t`.`knowledge` AS `knowledge`,
		`t`.`line` AS `line`,
		`t`.`pressTime` AS `pressTime`,
		`t`.`publisherId` AS `publisherId`,
		`t`.`topicId` AS `topicId`,
		`b`.`PUBLISHSTATUS` AS `PUBLISHSTATUS`,
		`b`.`TOPICCREATERID` AS `TOPICCREATERID`,
		`b`.`TOPICPARTICIPANTID` AS `TOPICPARTICIPANTID`,
		`b`.`TOPICPRINCIPALID` AS `TOPICPRINCIPALID`,
		`b`.`NAME` AS `name`,
		`b`.`CCID` AS `ccid`,
		`b`.`CREATED` AS `CREATED`,
		`b`.`FOLDERID` AS `FOLDERID`,
		`b`.`TYPE` AS `type`,
		`b`.`CREATORID` AS `creatorid`,
		`b`.`NEEDSIFTING` AS `needsifting`,
		`b`.`DELETEFLAG` AS `deleteflag`,
		`b`.`ROOTID` AS `Rootid`,
		`b`.`COLLECTORIDS` AS `COLLECTORIDS`,
		`b`.`LASTMODIFY` AS `lastModify`,
		`b`.`PEOPLEFLAG` AS `PEOPLEFLAG`,
		`b`.`BEIFENGFLAG` AS `BEIFENGFLAG`,
		`b`.`CMSFLAG` AS `CMSFLAG`
	FROM
		(
			`view_resource_tmp` `t`
			JOIN `com_basicinfo` `b` ON (
				(
					(`t`.`objectId` = `b`.`ID`)
					AND (`b`.`DELETEFLAG` = 0)
				)
			)
		);



-- 2017-10-26 褚洪董
insert INTO ddm_line(id,name)VALUES('xhzss','通稿新闻线路');
insert INTO ddm_line(id,name)VALUES('xhzbl','BL广播');
insert INTO ddm_line(id,name)VALUES('xhzhh','海外中文专线');
insert INTO ddm_line(id,name)VALUES('xhzyt','中文亚太线');

-- 2017-10-23 董兵
INSERT INTO `UPM_PRIVILEGE` VALUES ('PID_PRODUCT_STATUS_ASSIGN_BF', '签发到北方网', '-', 1, '可签发某一个状态的权限', 0, NULL, NULL, 'admin', 1, 'product', '签发到北方网', '1');
INSERT INTO `UPM_PRIVILEGE` VALUES ('PID_PRODUCT_STATUS_ASSIGN_CMS', '签发到CMS', '-', 1, '可签发某一个状态的权限', 0, NULL, NULL, 'admin', 1, 'product', '签发到CMS', '1');
INSERT INTO `UPM_PRIVILEGE` VALUES ('PID_PRODUCT_STATUS_ASSIGN_REVOKE_BF', '北方网撤销签发', '-', 1, '可签发某一个状态的权限', 0, NULL, NULL, 'admin', 1, 'product', '北方网撤销签发', '1');
INSERT INTO `UPM_PRIVILEGE` VALUES ('PID_PRODUCT_STATUS_ASSIGN_REVOKE_CMD', 'CMS撤销签发', '-', 1, '可签发某一个状态的权限', 0, NULL, NULL, 'admin', 1, 'product', 'CMS撤销签发', '1');

-- 稿件统计字段添加  2017-10-23 褚洪董
INSERT INTO `scp_environment` VALUES ('ISSUER_KEY_BEIFENG', '签发', 0, '6304c011-420a-4b53-b8e1-ec7cb43a727b:b8b84a8e-abef-421f-98c1-c95816bca367', '', '北方网签发id:key', 0, '2017-10-20 18:53:26', NULL, NULL);
INSERT INTO `scp_environment` VALUES ('ISSUER_URL_BEIFENG', '签发', 0, 'http://work.nmgnews.com.cn:8080/pub/nmg/Api!newsAccess.do', '', '北方网签发地址', 0, '2017-10-20 18:52:57', NULL, NULL);
INSERT INTO `scp_environment` VALUES ('REVOKEISSUER_URL_BEIFENG', '签发', 0, 'http://work.nmgnews.com.cn:8080/pub/nmg/Api!deleteNews.do', '', '北方网撤销签发地址', 0, '2017-10-20 18:52:43', NULL, NULL);
INSERT INTO `scp_environment` VALUES ('COLUMN_URL_BEIFENG', '签发', 0, 'http://work.nmgnews.com.cn:8080/pub/nmg/Api!columnInfo.do', '', '北方网获取栏目地址', 0, '2017-10-20 18:52:57', NULL, NULL);
INSERT INTO `scp_environment` VALUES ('TEMPLATE_URL_BEIFENG', '签发', 0, 'http://work.nmgnews.com.cn:8080/pub/nmg/Api!templateInfo.do', '', '北方网获取模板地址', 0, '2017-10-20 18:52:43', NULL, NULL);

alter table com_basicinfo add PEOPLEFLAG int not null default 0 comment '人民网是否签发';
alter table com_basicinfo add BEIFENGFLAG int not null default 0 comment '北方网是否签发';
alter table com_basicinfo add CMSFLAG int not null default 0 comment 'CMS是否签发';
 	CREATE
        OR REPLACE VIEW VIEW_RESOURCE_INFO AS
       SELECT
       	`t`.`objectId` AS `objectId`,
       	`t`.`organizationId` AS `organizationId`,
       	`t`.`authorName` AS `authorName`,
       	`t`.`productStatus` AS `productStatus`,
       	`t`.`productRange` AS `productRange`,
       	`t`.`auditorId` AS `auditorId`,
       	`t`.`transmitId` AS `transmitId`,
       	`t`.`knowledge` AS `knowledge`,
       	`t`.`line` AS `line`,
       	`t`.`publisherId` AS `publisherId`,
       	`t`.`topicId` AS `topicId`,
       	`b`.`PUBLISHSTATUS` AS `PUBLISHSTATUS`,
       	`b`.`TOPICCREATERID` AS `TOPICCREATERID`,
       	`b`.`TOPICPARTICIPANTID` AS `TOPICPARTICIPANTID`,
       	`b`.`TOPICPRINCIPALID` AS `TOPICPRINCIPALID`,
       	`b`.`NAME` AS `name`,
       	`b`.`CCID` AS `ccid`,
       	`b`.`CREATED` AS `CREATED`,
       	`b`.`FOLDERID` AS `FOLDERID`,
       	`b`.`TYPE` AS `type`,
       	`b`.`CREATORID` AS `creatorid`,
       	`b`.`NEEDSIFTING` AS `needsifting`,
       	`b`.`DELETEFLAG` AS `deleteflag`,
       	`b`.`ROOTID` AS `Rootid`,
       	`b`.`COLLECTORIDS` AS `COLLECTORIDS`,
       	`b`.`lastModify` AS `lastModify`,
       	`b`.`PEOPLEFLAG` AS `PEOPLEFLAG`,
        `b`.`BEIFENGFLAG` AS `BEIFENGFLAG`,
        `b`.`CMSFLAG` AS `CMSFLAG`,
        `u`.`ORGANIZATIONID` AS `deptId`
       FROM
       	(
       		`view_resource_tmp` `t`
       		JOIN `com_basicinfo` `b` ON (
       			(
       				(`t`.`objectId` = `b`.`ID`)
       				AND (`b`.`DELETEFLAG` = 0)
       			)
       		)LEFT JOIN `upm_user` `u` ON (
                `b`.`CREATORID` = `u`.`ID`
            )
       	);


--2017-09-30 褚洪董  主分类排序
-- mysql：
alter table com_basicinfo add orderNumber int not null default 0;

--2017-09-18 褚洪董
-- mysql：
CREATE
 OR REPLACE VIEW VIEW_RESOURCE_INFO AS
SELECT
   `t`.`objectId` AS `objectId`,
   `t`.`organizationId` AS `organizationId`,
   `t`.`authorName` AS `authorName`,
   `t`.`productStatus` AS `productStatus`,
   `t`.`productRange` AS `productRange`,
   `t`.`auditorId` AS `auditorId`,
   `t`.`transmitId` AS `transmitId`,
   `t`.`knowledge` AS `knowledge`,
   `t`.`line` AS `line`,
   `t`.`publisherId` AS `publisherId`,
   `t`.`topicId` AS `topicId`,
   `b`.`PUBLISHSTATUS` AS `PUBLISHSTATUS`,
   `b`.`TOPICCREATERID` AS `TOPICCREATERID`,
   `b`.`TOPICPARTICIPANTID` AS `TOPICPARTICIPANTID`,
   `b`.`TOPICPRINCIPALID` AS `TOPICPRINCIPALID`,
   `b`.`NAME` AS `name`,
   `b`.`CCID` AS `ccid`,
   `b`.`CREATED` AS `CREATED`,
   `b`.`FOLDERID` AS `FOLDERID`,
   `b`.`TYPE` AS `type`,
   `b`.`CREATORID` AS `creatorid`,
   `b`.`NEEDSIFTING` AS `needsifting`,
   `b`.`DELETEFLAG` AS `deleteflag`,
   `b`.`ROOTID` AS `Rootid`,
   `b`.`COLLECTORIDS` AS `COLLECTORIDS`,
   `b`.`lastModify` AS `lastModify`
FROM
   (
      `view_resource_tmp` `t`
      JOIN `com_basicinfo` `b` ON (
         (
            (`t`.`objectId` = `b`.`ID`)
            AND (`b`.`DELETEFLAG` = 0)
         )
      )
   );

--2017-09-18 褚洪董
-- mysql：
        CREATE
        OR REPLACE VIEW view_resource_tmp AS
        SELECT
        	`cob_audio_product`.`OBJECTID` AS `objectId`,
        	`cob_audio_product`.`FIELD1088` AS `organizationId`,
        	`cob_audio_product`.`FIELD1077` AS `authorName`,
        	`cob_audio_product`.`FIELD1073` AS `productStatus`,
        	`cob_audio_product`.`FIELD1089` AS `productRange`,
        	`cob_audio_product`.`FIELD1091` AS `auditorId`,
        	`cob_audio_product`.`FIELD1092` AS `transmitId`,
        	`cob_audio_product`.`FIELD1093` AS `publisherId`,
        	`cob_audio_product`.`FIELD1070` AS `topicId`,
        	NULL AS `knowledge`,
        	NULL AS `line`
        FROM
        	`cob_audio_product`
        UNION ALL
        SELECT
            `cob_doc_product`.`OBJECTID` AS `objectId`,
            `cob_doc_product`.`FIELD1088` AS `organizationId`,
            `cob_doc_product`.`FIELD1077` AS `authorName`,
            `cob_doc_product`.`FIELD1073` AS `productStatus`,
            `cob_doc_product`.`FIELD1089` AS `productRange`,
            `cob_doc_product`.`FIELD1091` AS `auditorId`,
            `cob_doc_product`.`FIELD1092` AS `transmitId`,
            `cob_doc_product`.`FIELD1093` AS `publisherId`,
            `cob_doc_product`.`FIELD1070` AS `topicId`,
            NULL AS `knowledge`,
            NULL AS `line`
        FROM
            `cob_doc_product`
        UNION ALL
        SELECT
            `cob_picture_product`.`OBJECTID` AS `objectId`,
            `cob_picture_product`.`FIELD1088` AS `organizationId`,
            `cob_picture_product`.`FIELD1077` AS `authorName`,
            `cob_picture_product`.`FIELD1073` AS `productStatus`,
            `cob_picture_product`.`FIELD1089` AS `productRange`,
            `cob_picture_product`.`FIELD1091` AS `auditorId`,
            `cob_picture_product`.`FIELD1092` AS `transmitId`,
            `cob_picture_product`.`FIELD1093` AS `publisherId`,
            `cob_picture_product`.`FIELD1070` AS `topicId`,
            `cob_picture_product`.`FIELD1106` AS `knowledge`,
            `cob_picture_product`.`FIELD1107` AS `line`
        FROM
            `cob_picture_product`
        UNION ALL
            SELECT
                `cob_program_product`.`OBJECTID` AS `objectId`,
                `cob_program_product`.`FIELD1088` AS `organizationId`,
                `cob_program_product`.`FIELD1077` AS `authorName`,
                `cob_program_product`.`FIELD1073` AS `productStatus`,
                `cob_program_product`.`FIELD1089` AS `productRange`,
                `cob_program_product`.`FIELD1091` AS `auditorId`,
                `cob_program_product`.`FIELD1092` AS `transmitId`,
                `cob_program_product`.`FIELD1093` AS `publisherId`,
                `cob_program_product`.`FIELD1070` AS `topicId`,
                NULL AS `knowledge`,
                NULL AS `line`
            FROM
                `cob_program_product`
            UNION ALL
            SELECT
                `cob_attach`.`OBJECTID` AS `objectId`,
                `cob_attach`.`FIELD1088` AS `organizationId`,
                `cob_attach`.`FIELD1077` AS `authorName`,
                `cob_attach`.`FIELD1073` AS `productStatus`,
                `cob_attach`.`FIELD1089` AS `productRange`,
                `cob_attach`.`FIELD1091` AS `auditorId`,
                `cob_attach`.`FIELD1092` AS `transmitId`,
                `cob_attach`.`FIELD1093` AS `publisherId`,
                null AS `topicId`,
                NULL AS `knowledge`,
                NULL AS `line`
            FROM
                `cob_attach`
            UNION ALL
            SELECT
                `cob_fwbl`.`OBJECTID` AS `objectId`,
                `cob_fwbl`.`FIELD1088` AS `organizationId`,
                `cob_fwbl`.`FIELD1077` AS `authorName`,
                `cob_fwbl`.`FIELD1073` AS `productStatus`,
                `cob_fwbl`.`FIELD1089` AS `productRange`,
                `cob_fwbl`.`FIELD1091` AS `auditorId`,
                `cob_fwbl`.`FIELD1092` AS `transmitId`,
                `cob_fwbl`.`FIELD1093` AS `publisherId`,
                `cob_fwbl`.`FIELD1070` AS `topicId`,
                `cob_fwbl`.`FIELD1106` AS `knowledge`,
                `cob_fwbl`.`FIELD1107` AS `line`
            FROM
                `cob_fwbl`
            UNION ALL
            SELECT
                `cob_vr_product`.`OBJECTID` AS `objectId`,
                `cob_vr_product`.`FIELD1088` AS `organizationId`,
                `cob_vr_product`.`FIELD1077` AS `authorName`,
                `cob_vr_product`.`FIELD1073` AS `productStatus`,
                `cob_vr_product`.`FIELD1089` AS `productRange`,
                `cob_vr_product`.`FIELD1091` AS `auditorId`,
                `cob_vr_product`.`FIELD1092` AS `transmitId`,
                `cob_vr_product`.`FIELD1093` AS `publisherId`,
                `cob_vr_product`.`FIELD1070` AS `topicId`,
                NULL AS `knowledge`,
                NULL AS `line`
            FROM
                `cob_vr_product`
            UNION ALL
            SELECT
                `cob_h5_product`.`OBJECTID` AS `objectId`,
                `cob_h5_product`.`FIELD1088` AS `organizationId`,
                `cob_h5_product`.`FIELD1077` AS `authorName`,
                `cob_h5_product`.`FIELD1073` AS `productStatus`,
                `cob_h5_product`.`FIELD1089` AS `productRange`,
                `cob_h5_product`.`FIELD1091` AS `auditorId`,
                `cob_h5_product`.`FIELD1092` AS `transmitId`,
                `cob_h5_product`.`FIELD1093` AS `publisherId`,
                `cob_h5_product`.`FIELD1070` AS `topicId`,
                NULL AS `knowledge`,
                NULL AS `line`
            FROM
                `cob_h5_product`;

        CREATE
        OR REPLACE VIEW VIEW_RESOURCE_INFO AS
       SELECT
       	`t`.`objectId` AS `objectId`,
       	`t`.`organizationId` AS `organizationId`,
       	`t`.`authorName` AS `authorName`,
       	`t`.`productStatus` AS `productStatus`,
       	`t`.`productRange` AS `productRange`,
       	`t`.`auditorId` AS `auditorId`,
       	`t`.`transmitId` AS `transmitId`,
       	`t`.`knowledge` AS `knowledge`,
       	`t`.`line` AS `line`,
       	`t`.`publisherId` AS `publisherId`,
       	`t`.`topicId` AS `topicId`,
       	`b`.`PUBLISHSTATUS` AS `PUBLISHSTATUS`,
       	`b`.`TOPICCREATERID` AS `TOPICCREATERID`,
       	`b`.`TOPICPARTICIPANTID` AS `TOPICPARTICIPANTID`,
       	`b`.`TOPICPRINCIPALID` AS `TOPICPRINCIPALID`,
       	`b`.`NAME` AS `name`,
       	`b`.`CCID` AS `ccid`,
       	`b`.`CREATED` AS `CREATED`,
       	`b`.`FOLDERID` AS `FOLDERID`,
       	`b`.`TYPE` AS `type`,
       	`b`.`CREATORID` AS `creatorid`,
       	`b`.`NEEDSIFTING` AS `needsifting`,
       	`b`.`DELETEFLAG` AS `deleteflag`,
       	`b`.`ROOTID` AS `Rootid`,
       	`b`.`COLLECTORIDS` AS `COLLECTORIDS`
       FROM
       	(
       		`view_resource_tmp` `t`
       		JOIN `com_basicinfo` `b` ON (
       			(
       				(`t`.`objectId` = `b`.`ID`)
       				AND (`b`.`DELETEFLAG` = 0)
       			)
       		)
       	);
--2017-09-12 褚洪董
INSERT INTO `scp_environment` VALUES ('ISSUER_KEY_CMS', '签发', 0, '075d09a6-4940-4044-9964-ffea45450435:6c520350-760c-4923-85e5-75eead58ed3b', '', 'CMS签发id:key', 0, '2017-9-11 18:53:26', NULL, NULL);
INSERT INTO `scp_environment` VALUES ('ISSUER_URL_CMS', '签发', 0, 'http://cmpc.hubpd.com/cmsapi/addarticle', '', 'CMS签发地址', 0, '2017-9-11 18:52:57', NULL, NULL);
INSERT INTO `scp_environment` VALUES ('REVOKEISSUER_URL_CMS', '签发', 0, 'http://cmpc.hubpd.com/cmsapi/deleteArticle', '', 'CMS撤销签发地址', 0, '2017-9-11 18:52:43', NULL, NULL);
INSERT INTO `scp_environment` VALUES ('COLUMN_URL_CMS', '签发', 0, 'http://cmpc.hubpd.com/cmsapi/getCatalog', '', 'CMS获取栏目地址', 0, '2017-9-11 18:52:57', NULL, NULL);

-- 文件表增加文件描述字段  2017-08-28 褚洪董
-- 知识属性描述和知识属性ID关联表
CREATE TABLE DDM_KNOWLEDGE_ATTRIBUTE_ID (
      ID           VARCHAR(36) NOT NULL PRIMARY KEY,
      KNOWLEDGE_ID VARCHAR(36) NOT NULL,
      ATTRIBUTE_ID VARCHAR(36) NOT NULL
);
-- 初始化知识属性
delete from `ddm_knowledge_attribute`;
INSERT INTO `ddm_knowledge_attribute` VALUES ('politics', '政治', 1, 1);
INSERT INTO `ddm_knowledge_attribute` VALUES ('international_relations', '外交、国际关系', 1, 1);
INSERT INTO `ddm_knowledge_attribute` VALUES ('law_justice', '法律、司法', 1, 1);
INSERT INTO `ddm_knowledge_attribute` VALUES ('military', '军事', 1, 1);
INSERT INTO `ddm_knowledge_attribute` VALUES ('sociology', '社会、劳动、灾难事故', 1, 1);
INSERT INTO `ddm_knowledge_attribute` VALUES ('environment ', '环境、气象', 1, 1);
INSERT INTO `ddm_knowledge_attribute` VALUES ('construction_business', '基本建设、建筑业、房地产', 1, 1);
INSERT INTO `ddm_knowledge_attribute` VALUES ('technology', '科学技术', 1, 1);
INSERT INTO `ddm_knowledge_attribute` VALUES ('IT_industry', '信息产业', 1, 1);
INSERT INTO `ddm_knowledge_attribute` VALUES ('education', '教育', 1, 1);
INSERT INTO `ddm_knowledge_attribute` VALUES ('economic', '经济', 1, 1);
INSERT INTO `ddm_knowledge_attribute` VALUES ('finance', '财政、金融', 1, 1);
INSERT INTO `ddm_knowledge_attribute` VALUES ('countryside', '农业、农村', 1, 1);
INSERT INTO `ddm_knowledge_attribute` VALUES ('mining_industry', '矿业、工业', 1, 1);
INSERT INTO `ddm_knowledge_attribute` VALUES ('energy_water', '能源、水务、水利', 1, 1);
INSERT INTO `ddm_knowledge_attribute` VALUES ('transportation', '交通运输、邮政、物流', 1, 1);
INSERT INTO `ddm_knowledge_attribute` VALUES ('other', '其它', 1, 1);
INSERT INTO `ddm_knowledge_attribute` VALUES ('service_industry', '服务业、旅游业', 1, 1);
INSERT INTO `ddm_knowledge_attribute` VALUES ('foreign_trade', '商业、外贸、海关', 1, 1);
INSERT INTO `ddm_knowledge_attribute` VALUES ('culture_entertainment', '文化、休闲娱乐', 1, 1);
INSERT INTO `ddm_knowledge_attribute` VALUES ('medicine_sanitation', '医药、卫生', 1, 1);
INSERT INTO `ddm_knowledge_attribute` VALUES ('sports', '体育', 1, 1);
-- 初始化知识属性和ID关联表
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '01', 'politics');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '01001', 'politics');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '01002', 'politics');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '01003', 'politics');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '01004', 'politics');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '01005', 'politics');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '01006', 'politics');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '01007', 'politics');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '01009', 'politics');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '01010', 'politics');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '01011', 'international_relations');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '01012', 'politics');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '01013', 'politics');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '01014', 'politics');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '01015', 'politics');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '01016', 'law_justice');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '01999', 'politics');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '02', 'military');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '02001', 'military');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '02002', 'military');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '02003', 'military');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '02004', 'military');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '02005', 'military');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '02006', 'military');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '02007', 'military');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '02009', 'military');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '02999', 'military');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '03', 'sociology');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '03001', 'sociology');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '03002', 'sociology');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '03003', 'sociology');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '03004', 'sociology');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '03005', 'sociology');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '03006', 'sociology');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '03007', 'sociology');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '03009', 'sociology');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '03010', 'sociology');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '03011', 'sociology');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '03012', 'sociology');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '03999', 'sociology');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '04', 'environment');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '04001', 'environment');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '04002', 'environment');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '04003', 'construction_business');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '04004', 'construction_business');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '04005', 'construction_business');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '05', 'technology');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '05001', 'IT_industry');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '05002', 'IT_industry');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '05003', 'IT_industry');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '05004', 'IT_industry');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '05005', 'IT_industry');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '05006', 'IT_industry');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '05007', 'IT_industry');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '05009', 'IT_industry');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '05999', 'technology');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '06', 'education');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '06001', 'education');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '06002', 'education');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '06003', 'education');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '06004', 'education');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '06005', 'education');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '06006', 'education');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '06007', 'education');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '06009', 'education');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '06010', 'education');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '06011', 'education');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '06012', 'education');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '06013', 'education');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '06014', 'education');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '06015', 'education');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '06016', 'education');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '06017', 'education');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '06019', 'education');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '06020', 'education');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '06021', 'education');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '06999', 'education');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '07', 'economic');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '07001', 'economic');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '07002', 'economic');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '07003', 'finance');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '07004', 'finance');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '07005', 'economic');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '07999', 'economic');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '08', 'finance');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '08001', 'finance');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '08002', 'IT_industry');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '08003', 'IT_industry');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '08004', 'countryside');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '08005', 'mining_industry');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '08006', 'energy_water');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '08007', 'mining_industry');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '08009', 'construction_business');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '08010', 'construction_business');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '08011', 'construction_business');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '08012', 'construction_business');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '08013', 'construction_business');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '08014', 'construction_business');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '08015', 'construction_business');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '08016', 'construction_business');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '08017', 'construction_business');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '08019', 'transportation');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '08020', 'transportation');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '08021', 'other');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '08022', 'finance');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '08023', 'service_industry');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '08999', 'mining_industry');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '09', 'finance');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '09001', 'finance');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '09002', 'finance');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '09003', 'finance');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '09004', 'finance');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '09005', 'finance');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '09006', 'finance');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '09007', 'finance');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '09009', 'finance');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '09999', 'foreign_trade');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '10', 'culture_entertainment');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '10001', 'service_industry');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '10002', 'service_industry');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '10003', 'service_industry');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '10004', 'service_industry');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '10005', 'culture_entertainment');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '10006', 'service_industry');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '10007', 'service_industry');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '10009', 'service_industry');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '10010', 'service_industry');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '10011', 'service_industry');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '10012', 'service_industry');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '10013', 'service_industry');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '10014', 'service_industry');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '10999', 'service_industry');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '11', 'service_industry');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '11001', 'medicine_sanitation');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '11002', 'medicine_sanitation');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '11003', 'medicine_sanitation');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '11004', 'medicine_sanitation');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '11005', 'medicine_sanitation');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '11006', 'medicine_sanitation');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '11007', 'medicine_sanitation');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '11009', 'medicine_sanitation');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '11999', 'medicine_sanitation');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '12', 'sports');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '12001', 'sports');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '12002', 'sports');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '12003', 'sports');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '12004', 'sports');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '12005', 'sports');
INSERT INTO `ddm_knowledge_attribute_id` VALUES (uuid(), '12999', 'sports');

-- 2017-08-16 武子超
CREATE
 OR REPLACE VIEW VIEW_RESOURCE_INFO AS
SELECT
   `t`.`objectId` AS `objectId`,
   `t`.`organizationId` AS `organizationId`,
   `t`.`authorName` AS `authorName`,
   `t`.`productStatus` AS `productStatus`,
   `t`.`productRange` AS `productRange`,
   `t`.`auditorId` AS `auditorId`,
   `t`.`transmitId` AS `transmitId`,
   `t`.`knowledge` AS `knowledge`,
   `t`.`line` AS `line`,
   `t`.`publisherId` AS `publisherId`,
   `b`.`PUBLISHSTATUS` AS `PUBLISHSTATUS`,
   `b`.`TOPICCREATERID` AS `TOPICCREATERID`,
   `b`.`TOPICPARTICIPANTID` AS `TOPICPARTICIPANTID`,
   `b`.`TOPICPRINCIPALID` AS `TOPICPRINCIPALID`,
   `b`.`NAME` AS `name`,
   `b`.`CCID` AS `ccid`,
   `b`.`CREATED` AS `CREATED`,
   `b`.`FOLDERID` AS `FOLDERID`,
   `b`.`TYPE` AS `type`,
   `b`.`CREATORID` AS `creatorid`,
   `b`.`NEEDSIFTING` AS `needsifting`,
   `b`.`DELETEFLAG` AS `deleteflag`,
   `b`.`ROOTID` AS `Rootid`,
   `b`.`COLLECTORIDS` AS `COLLECTORIDS`
FROM
   (
      `view_resource_tmp` `t`
      JOIN `com_basicinfo` `b` ON (
         (
            (`t`.`objectId` = `b`.`ID`)
            AND (`b`.`DELETEFLAG` = 0)
         )
      )
   )

-- 文件表增加文件描述字段  2017-08-11 褚洪董
alter table spm_file add filedescrip varchar(200);

-- 2017-08-08 董兵
insert into upm_privilege(id,name,aliasname,authorized_type,groupid,IS_DEPARTMENT_RELATED,type,description) values ('PID_PRODUCT_XHS_TXT','新华社文字稿','新华社文字稿','','-',1,1,'新华社文字稿');
insert into upm_privilege(id,name,aliasname,authorized_type,groupid,IS_DEPARTMENT_RELATED,type,description) values ('PID_PRODUCT_XHS_IMAGE','新华社图片','新华社图片','','-',1,1,'新华社图片');

-- 2017-08-08 褚洪董
    CREATE TABLE DDM_LINE (
          ID           VARCHAR(36) NOT NULL PRIMARY KEY,
          NAME         VARCHAR(36) NOT NULL,
          TEXTSTATUS       INT NOT NULL DEFAULT 1,
          IMAGESTATUS      INT NOT NULL DEFAULT 1
    );
    CREATE TABLE DDM_KNOWLEDGE_ATTRIBUTE (
          ID           VARCHAR(36) NOT NULL PRIMARY KEY,
          NAME         VARCHAR(36) NOT NULL,
          TEXTSTATUS       INT NOT NULL DEFAULT 1,
          IMAGESTATUS      INT NOT NULL DEFAULT 1
    );
    insert INTO ddm_line(id,name)VALUES('cstgz','彩色通稿');
    insert INTO ddm_line(id,name)VALUES('zwdyz','中文对外专线');
    insert INTO ddm_line(id,name)VALUES('ltwbz','路透晚报专线');
    insert INTO ddm_line(id,name)VALUES('tyzxz','体育');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('10999','服务业、旅游业');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('06020','教育');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('06021','教育');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('09009','财政、金融');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('09007','财政、金融');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('09005','财政、金融');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('09006','财政、金融');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('09003','财政、金融');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('09004','财政、金融');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('08021','其它');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('09001','财政、金融');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('08020','交通运输、邮政、物流');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('09002','财政、金融');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('08023','服务业、旅游业');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('08022','财政、金融');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('12999','体育');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('06013','教育');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('06014','教育');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('06015','教育');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('08019','交通运输、邮政、物流');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('06016','教育');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('06010','教育');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('06011','教育');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('06012','教育');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('10001','服务业、旅游业');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('11007','医药、卫生');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('10002','服务业、旅游业');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('11006','医药、卫生');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('11005','医药、卫生');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('11004','医药、卫生');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('10005','文化、休闲娱乐');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('08010','基本建设、建筑业、房地产');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('11003','医药、卫生');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('10006','服务业、旅游业');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('11002','医药、卫生');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('10003','服务业、旅游业');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('11001','医药、卫生');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('10004','服务业、旅游业');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('08014','基本建设、建筑业、房地产');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('10009','服务业、旅游业');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('08013','基本建设、建筑业、房地产');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('10007','服务业、旅游业');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('08012','基本建设、建筑业、房地产');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('08011','基本建设、建筑业、房地产');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('08017','基本建设、建筑业、房地产');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('06017','教育');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('11009','医药、卫生');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('08016','基本建设、建筑业、房地产');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('08015','基本建设、建筑业、房地产');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('06019','教育');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('08009','基本建设、建筑业、房地产');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('07999','经济');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('11','服务业、旅游业');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('12','体育');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('10014','服务业、旅游业');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('10010','服务业、旅游业');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('10011','服务业、旅游业');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('10012','服务业、旅游业');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('10013','服务业、旅游业');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('08005','矿业、工业');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('08004','农业、农村');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('08007','矿业、工业');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('08006','能源、水务、水利');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('08001','财政、金融');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('08003','信息产业');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('08002','信息产业');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('08','财政、金融');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('09','财政、金融');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('04','环境、气象');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('05','科学技术');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('06','教育');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('02','军事');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('01','政治');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('07','经济');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('04004','基本建设、建筑业、房地产');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('03','社会、劳动、灾难事故');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('04005','基本建设、建筑业、房地产');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('04003','基本建设、建筑业、房地产');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('04002','环境、气象');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('10','文化、休闲娱乐');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('04001','环境、气象');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('07002','经济');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('07001','经济');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('07005','经济');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('07004','财政、金融');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('01010','政治');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('07003','财政、金融');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('01011','外交、国际关系');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('05999','科学技术');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('03999','社会、劳动、灾难事故');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('01013','政治');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('01012','政治');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('01015','政治');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('01014','政治');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('01016','法律、司法');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('01999','政治');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('02999','军事');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('01009','政治');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('11999','医药、卫生');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('01004','政治');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('01003','政治');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('01002','政治');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('01001','政治');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('01007','政治');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('01006','政治');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('01005','政治');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('06001','教育');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('05001','信息产业');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('05002','信息产业');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('05003','信息产业');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('05004','信息产业');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('06005','教育');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('06004','教育');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('06003','教育');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('06002','教育');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('06009','教育');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('05009','信息产业');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('06006','教育');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('06007','教育');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('05006','信息产业');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('05005','信息产业');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('05007','信息产业');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('03012','社会、劳动、灾难事故');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('03011','社会、劳动、灾难事故');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('03010','社会、劳动、灾难事故');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('02001','军事');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('03003','社会、劳动、灾难事故');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('03004','社会、劳动、灾难事故');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('03005','社会、劳动、灾难事故');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('03006','社会、劳动、灾难事故');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('03007','社会、劳动、灾难事故');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('03009','社会、劳动、灾难事故');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('08999','矿业、工业');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('09999','商业、外贸、海关');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('02009','军事');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('02006','军事');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('06999','教育');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('12005','体育');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('02007','军事');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('02004','军事');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('12003','体育');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('02005','军事');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('12004','体育');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('02002','军事');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('03002','社会、劳动、灾难事故');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('12001','体育');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('02003','军事');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('03001','社会、劳动、灾难事故');
    insert INTO ddm_knowledge_attribute(id,name)VALUES('12002','体育');

-- 2017-08-07 武子超
ALTER TABLE `pdcre`.`com_basicinfo`     ADD COLUMN `COLLECTORIDS` VARCHAR(2000) NULL;


-- 2017-07-26 赵洋坤
ALTER TABLE `pdcre`.`tra_resource`     ADD COLUMN `DETAILOPERATION` VARCHAR(2000) NULL AFTER `DESCRIPTION`;

-- 2017-07-05 董兵
CREATE TABLE UPM_USERDEPARTMENTROLE (
          ID           VARCHAR(36) NOT NULL,
          ROLEID         VARCHAR(36) NOT NULL,
          USERID VARCHAR(36) NOT NULL
    );
CREATE TABLE UPM_DEPARTMENTROLEPRIVILEGE (
	  ID           VARCHAR(36) NOT NULL,
	  ROLEID         VARCHAR(36) NOT NULL,
	  DEPARTMENTID VARCHAR(36) NOT NULL,
	  PRIVILEGEID  VARCHAR(64) NOT NULL,
	  STATUS DECIMAL
);
CREATE TABLE UPM_DEPARTMENTROLE (
	  ID           VARCHAR(36) NOT NULL,
	  NAME         VARCHAR(36) NOT NULL,
	  DEPARTMENTID VARCHAR(36) NOT NULL,
	  DESCRIPTION  VARCHAR(64)
);
