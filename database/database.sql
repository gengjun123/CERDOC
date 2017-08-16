-- 添加数据库脚本时，以['-- ' + 当前日期 + 操作人]为开头，下面跟数据库脚本。脚本中不可以加额外字符，以方便运维人员直接复制。
--2017-08-16 武子超
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
