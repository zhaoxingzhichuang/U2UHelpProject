/*
Navicat MySQL Data Transfer

Source Server         : 111
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : production_ssm

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2018-01-23 22:04:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `custom`
-- ----------------------------
DROP TABLE IF EXISTS `custom`;
CREATE TABLE `custom` (
  `custom_id` varchar(40) NOT NULL,
  `custom_name` varchar(20) DEFAULT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `owner_name` varchar(20) DEFAULT NULL,
  `owner_tel` varchar(20) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `note` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`custom_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of custom
-- ----------------------------
INSERT INTO `custom` VALUES ('001', '阿里', '阿里巴巴网络技术有限公司', '中国杭州', '15615616', 'alibaba@126.com', '马云', '1851561561', '1', '<h4>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color:#E53333;\">阿里巴巴</span>网络技术有限公司（简称：阿里巴巴集团）是以曾担任英语教师的马云为首的18人，于1999年在杭州创立，他们相信互联网能够创造公平的竞争环境，让小企业通过创新与科技扩展业务，并在参与国内或全球市场竞争时处于更有利的位置。<br />\r\n阿里巴巴集团经营多项业务，另外也从关联公司的业务和服务中取得经营商业生态系统上的支援。业务和关联公司的业务包括：<span style=\"color:#E53333;\">淘宝网、天猫、聚划算、全球速卖通、阿里巴巴国际交易市场、1688、阿里妈妈、阿里云、蚂蚁金服、菜鸟网络</span>等。\r\n</h4>\r\n<h4>\r\n	2014年9月19日，阿里巴巴集团在纽约证券交易所正式挂牌上市，股票代码“BABA”，创始人和董事局主席为马云。\r\n</h4>\r\n<h4>\r\n	2015年全年，阿里巴巴总营收943.84亿元人民币，净利润688.44亿元人民币。\r\n</h4>\r\n<h4>\r\n	2016年4月6日，阿里巴巴正式宣布已经成为全球最大的零售交易平台。<br />\r\n2016年7月5日，第三方应用商店“豌豆荚”宣布，其应用分发业务并入阿里巴巴移动事业群，双方已正式签订并购协议。<br />\r\n2016年8月，阿里巴巴集团在\"2016中国企业500强\"中排名第148位。\r\n</h4>');
INSERT INTO `custom` VALUES ('002', '网易', '杭州网易养猪公司', '杭州滨江区', '4214324', '2432432', '丁磊', '32143214', '1', '网易 (NASDAQ: NTES)是中国领先的互联网公司，利用最先进的互联网技术，加强人与人之间信息的交流和共享，实现“网聚人的力量”。创始人兼CEO是丁磊。<br />\r\n在开发互联网应用、服务及其它技术方面，网易始终保持业界的领先地位，并在中国互联网行业内率先推出了包括中文全文检索、全中文大容量免费邮件系统、无限容量免费网络相册、免费电子贺卡站、网上虚拟社区、网上拍卖平台、24小时客户服务中心在内的业内领先产品或服务，还通过自主研发推出了一款率先取得白金地位的国产网络游戏。[1]&nbsp;<br />\r\n网易公司推出了门户网站、在线游戏、电子邮箱、在线教育、电子商务、在线音乐、网易bobo等多种服务。<br />');
INSERT INTO `custom` VALUES ('003', '京东', '北京京东世纪贸易有限公司', '中国北京市朝阳区北辰西路8号北辰世纪中心A座', '5001363', 'jd@126.com', '章泽天', '1565156456', '1', '<span style=\"color:#333333;font-family:Helvetica, Arial, Tahoma, &quot;font-size:15px;line-height:22px;background-color:#F2F2F2;\">京东JD.COM-专业的综合网上购物商城，销售超数万品牌、4020万种商品，囊括家电、手机、电脑、母婴、服装等13大品类。秉承客户为先的理念，京东所售商品为<span style=\"color:#E53333;\">正品行货、全国联保、机打发票</span>。1</span><span></span>');
INSERT INTO `custom` VALUES ('004', '新浪', '新浪网络技术股份有限公司', '北京市北四环西路58号理想国际大厦20层', '15612561', '15611561@163.com', '曹国伟', '15614145656', '1', '新浪（NASDAQ：SINA），是一家网络公司的名称，成立于1998年12月，服务大中华地区与海外华人，新浪拥有多家地区性网站，通过旗下五大业务主线为用户提供网络服务，网下的北京新浪、香港新浪、台北新浪、北美新浪等覆盖全球华人社区的全球最大中文门户网站，2012年11月新浪注册用户已突破4亿。<br />\r\n新浪公司是一家服务于中国及全球华人社群的网络媒体公司。新浪通过门户网站新浪网、移动门户手机新浪网和社交网络服务及微博客服务微博组成的数字媒体网络，帮助广大用户通过互联网和移动设备获得专业媒体和用户自生成的多媒体内容（UGC）并与友人进行兴趣分享。<br />');
INSERT INTO `custom` VALUES ('005', '美团', '北京三快在线科技有限公司', '北京市朝阳区望京东路6号 望京国际研发园三期', '15156156156', '156115115@126.com', '王兴', '1561511151', '2', '<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	新浪（NASDAQ：SINA），是一家网络公司的名称，成立于1998年12月，服务大中华地区与海外华人，新浪拥有多家地区性网站，通过旗下五大业务主线为用户提供网络服务，网下的北京新浪、香港新浪、台北新浪、北美新浪等覆盖全球华人社区的全球最大中文门户网站，2012年11月新浪注册用户已突破4亿。<br />\r\n新浪公司是一家服务于中国及全球华人社群的网络媒体公司。新浪通过门户网站新浪网、移动门户手机新浪网和社交网络服务及微博客服务微博组成的数字媒体网络，帮助广大用户通过互联网和移动设备获得专业媒体和用户自生成的多媒体内容（UGC）并与友人进行兴《美团网》是2010年3月4日成立的团购网站。美团网有着“美团一次，美一次”的宣传口号。为消费者发现最值得信赖的商家，让消费者享受超低折扣的优质服务；为商家找到最合适的消费者，给商家提供最大收益的互联网推广。<br />\r\n2014年美团全年交易额突破460亿元，较去年增长180%以上，市场份额占比超过60%，比2013年的53%增长了7个百分点。<br />\r\n2015年1月18日，美团网CEO王兴表示，美团已经完成7亿美元融资，美团估值达到70亿美元，最近两年不考虑上市。<br />\r\n2015年10月8日，大众点评与美团网宣布合并，美团CEO王兴和大众点评CEO张涛将会同时担任联席CEO和联席董事长。11月，阿里确认退出美团，阿里腾讯O2O正式开战。<br />\r\n2015年11月10日，美团CEO王兴发内部邮件表示，将不再担任联席董事长。[1]&nbsp;<br />\r\n2016年8月，北京市食药监局利用高科技手段对互联网违法行为进行搜索监测，为监管部门提供了一批违法线索，查处了一大批违法案件。8月10日，北京市食药监局对美团进行立案调查。<br />\r\n<br />\r\n</div>');
INSERT INTO `custom` VALUES ('006', '蒙牛', '内蒙古蒙牛乳业集团', '呼和浩特', '321321321', '3213321@111', '3132', '3213', '1', '31');
INSERT INTO `custom` VALUES ('007', '百度', '北京百度有限公司', '北京海淀区中关村软件园二期百度科技园', '156151', '561455@baidu.com', '李彦宏', '1561561511', '1', '全球最大的中文搜索引擎');
INSERT INTO `custom` VALUES ('1253', 'aaa', null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `department`
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `department_id` varchar(40) NOT NULL,
  `department_name` varchar(100) DEFAULT NULL,
  `note` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('001', '项目部', '负责接洽项目，并负责项目进度控制、人员配置调度与风险管控');
INSERT INTO `department` VALUES ('002', '生产部', '负责制定生产计划，并组织生产。');
INSERT INTO `department` VALUES ('003', '物料部', '负责物料收支与调配。');
INSERT INTO `department` VALUES ('004', '财务部', '负责公司财务运作。');
INSERT INTO `department` VALUES ('005', '人力部', '负责公司人事。');
INSERT INTO `department` VALUES ('006', '物流部', '<span style=\"font-size:14px;\">负责公司物流调配。</span>');
INSERT INTO `department` VALUES ('007', '礼仪部', '负责前台接待及会务礼仪。');


-- ----------------------------
-- Table structure for `employee`
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `emp_id` varchar(40) NOT NULL,
  `emp_name` varchar(40) DEFAULT NULL,
  `sex` char(1) DEFAULT NULL,
  `id_code` varchar(20) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `join_date` date DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `education` varchar(20) DEFAULT NULL,
  `degree` varchar(20) DEFAULT NULL,
  `major` varchar(40) DEFAULT NULL,
  `graduate_school` varchar(40) DEFAULT NULL,
  `education_form` varchar(40) DEFAULT NULL,
  `department_id` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`emp_id`),
  KEY `FK_Reference_30` (`department_id`),
  CONSTRAINT `FK_Reference_30` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('001', '王武', '1', '350321xxxxxxxxxxxx', null, null, '在职', '本科', '学士', '计算机', null, '全日制', '002');
INSERT INTO `employee` VALUES ('002', '张三', '2', '152346842123458618', '1970-01-01', '1970-01-01', '在职', '大专', '无', '软件工程', null, '全日制', '005');
INSERT INTO `employee` VALUES ('003', '刘高升', '1', '156423547861546872', null, null, '在职', '大专', '无', '人力资源', null, '全日制', '001');
INSERT INTO `employee` VALUES ('005', '刘亦菲', '2', '156432486625615156', null, null, '在职', '本科', '学士', '形体礼仪', null, '在职', '007');

-- ----------------------------
-- Table structure for `sys_permission`
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `name` varchar(128) NOT NULL COMMENT '资源名称',
  `type` varchar(32) NOT NULL COMMENT '资源类型：menu,button,',
  `url` varchar(128) DEFAULT NULL COMMENT '访问url地址',
  `percode` varchar(128) DEFAULT NULL COMMENT '权限代码字符串',
  `parentid` bigint(20) DEFAULT NULL COMMENT '父结点id',
  `parentids` varchar(128) DEFAULT NULL COMMENT '父结点id列表串',
  `sortstring` varchar(128) DEFAULT NULL COMMENT '排序号',
  `available` char(1) DEFAULT NULL COMMENT '是否可用,1：可用，0不可用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO `sys_permission` VALUES ('1', '权限', 'permission', '', 'order:edit', '0', '0/', '0', '1');
INSERT INTO `sys_permission` VALUES ('10', '订单管理', 'menu', '', null, '1', '0/1/', '1.', '1');
INSERT INTO `sys_permission` VALUES ('11', '订单新增', 'permission', 'order/add_judge', 'order:add', '11', '0/1/11/', '', '1');
INSERT INTO `sys_permission` VALUES ('12', '订单修改', 'permission', 'order/edit_judge', 'order:edit', '11', '0/1/11/', '', '1');
INSERT INTO `sys_permission` VALUES ('13', '订单删除', 'permission', 'order/delete_judge', 'order:delete', '11', '0/1/11/', '', '1');
INSERT INTO `sys_permission` VALUES ('20', '客户管理', 'menu', '', '', '1', '0/1/', '2.', '1');
INSERT INTO `sys_permission` VALUES ('21', '客户新增', 'permission', '', 'custom:add', '21', '0/1/21/', '', '1');
INSERT INTO `sys_permission` VALUES ('22', '客户修改', 'permission', '', 'custom:edit', '21', '0/1/21/', '', '1');
INSERT INTO `sys_permission` VALUES ('23', '客户删除', 'permission', '', 'custom:delete', '21', '0/1/21/', '', '1');
INSERT INTO `sys_permission` VALUES ('30', '产品管理', 'menu', null, null, null, null, null, '1');
INSERT INTO `sys_permission` VALUES ('31', '产品新增', 'permission', null, 'product:add', null, null, null, '1');
INSERT INTO `sys_permission` VALUES ('32', '产品修改', 'permission', null, 'product:edit', null, null, null, '1');
INSERT INTO `sys_permission` VALUES ('33', '产品删除', 'permission', null, 'product:delete', null, null, null, '1');
INSERT INTO `sys_permission` VALUES ('40', '部门管理', 'menu', null, null, null, null, null, '1');
INSERT INTO `sys_permission` VALUES ('41', '部门新增', 'permission', null, 'department:add', null, null, null, '1');
INSERT INTO `sys_permission` VALUES ('42', '部门修改', 'permission', null, 'department:edit', null, null, null, '1');
INSERT INTO `sys_permission` VALUES ('43', '部门删除', 'permission', null, 'department:delete', null, null, null, '1');
INSERT INTO `sys_permission` VALUES ('50', '员工管理', 'menu', null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('51', '员工新增', 'permission', null, 'employee:add', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('52', '员工修改', 'permission', null, 'employee:edit', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('53', '员工删除', 'permission', null, 'employee:delete', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('60', '作业管理', 'menu', null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('61', '作业新增', 'permission', null, 'work:add', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('62', '作业修改', 'permission', null, 'work:edit', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('63', '作业删除', 'permission', null, 'work:delete', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('70', '生产计划管理', 'menu', null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('71', '生产计划新增', 'permission', null, 'manufacture:add', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('72', '生产计划修改', 'permission', null, 'manufacture:edit', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('73', '生产计划删除', 'permission', null, 'manufacture:delete', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('80', '生产派工管理', 'menu', null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('81', '生产派工新增', 'permission', null, 'task:add', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('82', '生产派工修改', 'permission', null, 'task:edit', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('83', '生产派工删除', 'permission', null, 'task:delete', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('90', '工艺管理', 'menu', null, '', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('91', '工艺新增', 'permission', null, 'technology:add', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('92', '工艺修改', 'permission', null, 'technology:edit', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('93', '工艺删除', 'permission', null, 'technology:delete', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('100', '工序管理', 'menu', null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('101', '工序新增', 'permission', null, 'process:add', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('102', '工序修改', 'permission', null, 'process:edit', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('103', '工序删除', 'permission', null, 'process:delete', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('110', '工艺计划管理', 'menu', null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('111', '工艺计划新增', 'permission', null, 'technologyPlan:add', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('112', '工艺计划修改', 'permission', null, 'technologyPlan:edit', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('113', '工艺计划删除', 'permission', null, 'technologyPlan:delete', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('120', '工艺要求管理', 'menu', null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('121', '工艺要求新增', 'permission', null, 'technologyRequirement:add', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('122', '工艺要求修改', 'permission', null, 'technologyRequirement:edit', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('123', '工艺要求删除', 'permission', null, 'technologyRequirement:delete', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('130', '成品计数质检', 'menu', null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('131', '成品计数质检新增', 'permission', null, 'fCountCheck:add', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('132', '成品计数质检修改', 'permission', null, 'fCountCheck:edit', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('133', '成品计数质检删除', 'permission', null, 'fCountCheck:delete', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('140', '成品计量质检', 'menu', null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('141', '成品计量质检新增', 'permission', null, 'fMeasureCheck:add', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('142', '成品计量质检修改', 'permission', null, 'fMeasureCheck:edit', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('143', '成品计量质检删除', 'permission', null, 'fMeasureCheck:delete', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('150', '工序计数质检', 'menu', null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('151', '工序计数质检新增', 'permission', null, 'pCountCheck:add', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('152', '工序计数质检修改', 'permission', null, 'pCountCheck:edit', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('153', '工序计数质检删除', 'permission', null, 'pCountCheck:delete', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('160', '工序计量质检', 'menu', null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('161', '工序计量质检新增', 'permission', null, 'pMeasureCheck:add', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('162', '工序计量质检修改', 'permission', null, 'pMeasureCheck:edit', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('163', '工序计量质检删除', 'permission', null, 'pMeasureCheck:delete', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('170', '不合格品申请', 'menu', null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('171', '不合格品申请新增', 'permission', null, 'unqualify:add', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('172', '不合格品申请修改', 'permission', null, 'unqualify:edit', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('173', '不合格品申请删除', 'permission', null, 'unqualify:delete', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('180', '物料管理', 'menu', null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('181', '物料新增', 'permission', null, 'material:add', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('182', '物料修改', 'permission', null, 'material:edit', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('183', '物料删除', 'permission', null, 'material:delete', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('190', '物料收入', 'menu', null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('191', '物料收入新增', 'permission', null, 'materialReceive:add', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('192', '物料收入修改', 'permission', null, 'materialReceive:edit', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('193', '物料收入删除', 'permission', null, 'materialReceive:delete', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('200', '用户管理', 'menu', null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('201', '用户新增', 'permission', null, 'user:add', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('202', '用户修改', 'permission', null, 'user:edit', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('203', '用户删除', 'permission', null, 'user:delete', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('210', '角色管理', 'menu', null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('211', '角色新增', 'permission', null, 'role:add', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('212', '角色修改', 'permission', null, 'role:edit', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('213', '角色删除', 'permission', null, 'role:delete', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('220', '物料消耗', 'menu', null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('221', '物料消耗新增', 'permission', null, 'materialConsume:add', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('222', '物料消耗修改', 'permission', null, 'materialConsume:edit', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('223', '物料消耗删除', 'permission', null, 'materialConsume:delete', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('230', '设备管理', 'menu', null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('231', '设备新增', 'permission', null, 'deviceList:add', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('232', '设备修改', 'permission', null, 'deviceList:edit', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('233', '设备删除', 'permission', null, 'deviceList:delete', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('240', '设备例检管理', 'menu', null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('241', '设备例检新增', 'permission', null, 'deviceCheck:add', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('242', '设备例检修改', 'permission', null, 'deviceCheck:edit', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('243', '设备例检删除', 'permission', null, 'deviceCheck:delete', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('250', '设备故障管理', 'menu', null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('251', '设备故障新增', 'permission', null, 'deviceFault:add', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('252', '设备故障修改', 'permission', null, 'deviceFault:edit', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('253', '设备故障删除', 'permission', null, 'deviceFault:delete', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('260', '设备维修管理', 'menu', null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('261', '设备维修新增', 'permission', null, 'deviceMaintain:add', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('262', '设备维修修改', 'permission', null, 'deviceMaintain:edit', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('263', '设备维修删除', 'permission', null, 'deviceMaintain:delete', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('270', '设备种类管理', 'menu', null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('271', '设备种类新增', 'permission', null, 'deviceType:add', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('272', '设备种类修改', 'permission', null, 'deviceType:edit', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('273', '设备种类删除', 'permission', null, 'deviceType:delete', null, null, null, null);

-- ----------------------------
-- Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` varchar(36) NOT NULL,
  `role_name` varchar(128) NOT NULL,
  `available` char(1) DEFAULT NULL COMMENT '是否可用,1：可用，0不可用',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('001', '超级管理员', '1');
INSERT INTO `sys_role` VALUES ('002', '订单管理员', '1');
INSERT INTO `sys_role` VALUES ('004', '物料管理员', '1');
INSERT INTO `sys_role` VALUES ('005', '普通用户', '1');
INSERT INTO `sys_role` VALUES ('007', '设备管理员', '1');

-- ----------------------------
-- Table structure for `sys_role_permission`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission` (
  `id` varchar(50) NOT NULL,
  `sys_role_id` varchar(50) NOT NULL COMMENT '角色id',
  `sys_permission_id` varchar(300) DEFAULT NULL COMMENT '权限id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_permission
-- ----------------------------
INSERT INTO `sys_role_permission` VALUES ('1456115611515', '002', '11,12,13,201,202,203,');
INSERT INTO `sys_role_permission` VALUES ('147729449886163', '15615615151', '11,12,13,231,232,233,271,273,');
INSERT INTO `sys_role_permission` VALUES ('147737863632731', '005', '11,33,81,83,91,93,101,102,103,121,192,131,133,151,153,173,273,252,51,53,');
INSERT INTO `sys_role_permission` VALUES ('148007157091762', '004', '181,182,183,191,192,193,221,222,223,');
INSERT INTO `sys_role_permission` VALUES ('148255367614063', '007', null);
INSERT INTO `sys_role_permission` VALUES ('149122370655248', '31931', null);
INSERT INTO `sys_role_permission` VALUES ('149122382565714', '424', null);
INSERT INTO `sys_role_permission` VALUES ('149122469890916', '3213', null);
INSERT INTO `sys_role_permission` VALUES ('149122510431476', '3214321', null);
INSERT INTO `sys_role_permission` VALUES ('149122513769244', '213213213', '11,12,13,');
INSERT INTO `sys_role_permission` VALUES ('ebc8a441-c6f9-11e4-b137-0adc305c3f21', '001', '11,12,13,21,22,23,31,32,33,61,62,63,71,72,73,81,82,83,91,92,93,101,102,103,111,112,113,121,122,123,181,182,183,191,192,193,221,222,223,131,132,133,141,142,143,151,152,153,161,162,163,171,172,173,231,232,233,271,272,273,241,242,243,251,252,253,261,262,263,41,42,43,51,52,53,201,202,203,211,212,213,');

-- ----------------------------
-- Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` varchar(36) NOT NULL COMMENT '主键',
  `username` varchar(64) DEFAULT NULL COMMENT '姓名',
  `password` varchar(32) DEFAULT NULL COMMENT '密码',
  `locked` char(1) DEFAULT NULL COMMENT '账号是否锁定，1：锁定，0未锁定',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('001', '王经理', '11', '1');
INSERT INTO `sys_user` VALUES ('002', '22', '22', '1');
INSERT INTO `sys_user` VALUES ('003', '张三', 'aaa', '1');
INSERT INTO `sys_user` VALUES ('004', 'aa', 'aa', '1');
INSERT INTO `sys_user` VALUES ('005', '11', '11', '1');
INSERT INTO `sys_user` VALUES ('006', '王二', '12345', '2');
INSERT INTO `sys_user` VALUES ('007', '李大山', '11', '1');
INSERT INTO `sys_user` VALUES ('3213', 'ga', '22', '1');
INSERT INTO `sys_user` VALUES ('321321', '55', '55', '1');

-- ----------------------------
-- Table structure for `sys_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` varchar(36) NOT NULL,
  `sys_user_id` varchar(32) NOT NULL,
  `sys_role_id` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('001', '001', '001');
INSERT INTO `sys_user_role` VALUES ('147705484492576', '003', '002');
INSERT INTO `sys_user_role` VALUES ('148228593447685', '004', '005');
INSERT INTO `sys_user_role` VALUES ('148232608456017', '002', '001');
INSERT INTO `sys_user_role` VALUES ('148232650257115', '005', '002');
INSERT INTO `sys_user_role` VALUES ('148237251058254', '321321', '004');
INSERT INTO `sys_user_role` VALUES ('148237503507696', '3213', '005');
INSERT INTO `sys_user_role` VALUES ('148249856407793', '006', '002');
INSERT INTO `sys_user_role` VALUES ('148255363744945', '007', '004');

-- ----------------------------
-- Records of rr_category_info
-- ----------------------------
CREATE TABLE `rr_category_info` (
  `id` varchar(64) NOT NULL,
  `level` int(2) DEFAULT NULL COMMENT '分类级别',
  `cate_name` varchar(64) DEFAULT NULL COMMENT '分类名称',
  `parent_id` varchar(64) DEFAULT NULL COMMENT '父级ID',
  `cate_desc` varchar(128) DEFAULT NULL COMMENT '分类描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
