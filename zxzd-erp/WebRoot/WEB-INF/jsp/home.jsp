<%@page import="org.springframework.web.context.request.SessionScope"%>
<%@page import="org.apache.shiro.session.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="/WEB-INF/jsp/commons/common_js.jsp"%>
<%@ include file="/WEB-INF/jsp/commons/common_css.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>玲珑进销存系统</title>
<style type="text/css">
.content {
	padding: 10px 10px 10px 10px;
}
.divNorth{
	/* background:url('image/TitleBackground.jpg') no-repeat center center; */
	background-color: #06f7e9;
	background-size:100% 100%;
}
</style>
</head>
<body class="easyui-layout">

	<!-- North Title -->
	<div class="divNorth" style="height:100px;" data-options="region:'north'" >
		<table id="_TableHeader" width="100%" border="0" cellpadding="0"
		cellspacing="0" class="bluebg">
		<tbody>
			<tr>
				<td valign="top">
					<div style="position:relative;">
						<div style="text-align:left;font-size: 10px;margin: 30px 0px 0px 30px;display:inline-block;">
    						<span style="display:inline-block;font-size: 30px;font-family: serif;color:#fb058b;margin:0 0 8px 0;">
								R R B M&nbsp;&nbsp;人人帮忙
							</span>
						</div>
						<div style="float:right;text-align:right;font-size:15px;margin: 15px 25px 0px 0px;display:inline-block;">
							<span style="display:inline-block;font-size:20px;color:#fb058b;margin:0 0 8px 0;">
								人人帮忙
							</span><br>
							
							<span style="color:black;">${activeUser.rolename}:</span>
							<span style="color:black;">
								${activeUser.username}
							</span>
						    &nbsp;<a href="logout" style="text-decoration:none;color:black;"> 退出</a>&nbsp;  &nbsp; 
						</div>
					</div>
				</td>
			</tr>
		</tbody>
	</table>
	</div>
	
	<!-- <div data-options="region:'west',title:'功能菜单',split:true"
		style="width:213px;"> -->
	<div id="HomeFuncAccordion" class="easyui-accordion" style="width:213px;"
		data-options="region:'west',title:'功能菜单',split:false">
		<div title="功能搜索"
			data-options="iconCls:'icon-search',collapsed:false,collapsible:false"
			style="padding:10px;">
			<input id="HomeFuncSearch" class="easyui-searchbox" 
				data-options={prompt:'请输入想要搜索的功能'}
				searcher="doSearch" 
				style="width:178px;height:25px;">
			<!---------------------------------------------------->
			<!-- http://www.jeasyui.net/demo/408.html#  ExpandTo-->
			<!---------------------------------------------------->
		</div>

		<div title="仓库管理" data-options="selected:true" style="padding:10px;">
			<ul id="scheduleMonitor" class="easyui-tree" data-options="animate:true,lines:true">
				<li><span>仓库管理</span>
					<ul>
						<!-- <li id=12 data-options="attributes:{'url':'custom/find'}">门店销售</li> -->
					</ul>
					<!-- <ul>
						<li id=14 data-options="attributes:{'url':'work/find'}">作业管理</li>
					</ul>
					<ul>
						<li id=15 data-options="attributes:{'url':'manufacture/find'}">生产计划管理</li>
					</ul>
					<ul>
						<li id=16 data-options="attributes:{'url':'task/find'}">生产派工管理</li>
					</ul> -->
				</li>
			</ul>
		</div>

		<div title="线上销售" data-options="selected:true" style="padding:10px">
			<ul id="deviceMonitor" class="easyui-tree" data-options="animate:true,lines:true">
				<li><span>线上销售</span>
					<ul>
						<!-- <li id=21 data-options="attributes:{'url':'onlineSale/list'}">线上销售</li> -->
					</ul></li>
			</ul>
		</div>
		
		<c:if test="${activeUser.rolename == '超级管理员' }">
		<div title="后台管理" data-options="selected:true" style="padding:10px">
			<ul id="backgroundMonitor" class="easyui-tree" data-options="animate:true,lines:true">
				<li><span>后台管理</span>
					<ul>
						<li id=6 data-options="attributes:{'url':'categoryName/find'}">分类名称管理</li>
					</ul>
				</li>
			</ul>
		</div>
		</c:if>
		
		<c:if test="${activeUser.rolename == '超级管理员' }">
			<div title="系统管理" style="padding:10px;">
	
				<ul id="sysManager" class="easyui-tree"
					data-options="animate:true,lines:true">
					<li><span>系统管理</span>
						<ul>
							<li id=41 data-options="attributes:{'url':'dictionary/find'}">数据字典</li>
						</ul>
						<ul>
							<li data-options="attributes:{'url':'user/find'}">用户管理</li>
						</ul>
						<ul>
							<li data-options="attributes:{'url':'role/find'}">角色管理</li>
						</ul>
					</li>
				</ul>
			</div>
		</c:if>
	</div>

	<!-- </div> -->
	<div id="MainPage" data-options="region:'center',title:''">
		<div id="tabs" class="easyui-tabs">
			<div title="首页" style="padding:20px;">
				<span style="font-size: 25px;">Welcom!</span>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">

		var allItem = [
						["计划进度","订单管理","客户管理","产品管理","作业管理","生产计划管理","生产派工管理"], 
						["设备管理","设备台账","设备种类","设备例检","设备故障","设备维修"],
						["工艺监控","工艺","工艺要求","工艺计划","工序"],
						["物料监控","物料信息","物料收入","物料消耗"],
						["质量监控","不合格品管理","成品计量质检","成品计数质检","工序计量质检","工序计数质检"],
						["人员监控","部门管理","员工管理"]
					  ];
					  
		function isContains(str, substr) {
		    return new RegExp(substr).test(str);
		}
		
		//HomeFuncSearch
		function doSearch(value){
			var subItem;
			var ifElseContain = false;
			for (var i = 0; i < allItem.length; i++) {
				for (var j = 0; j < allItem[i].length; j++) {
					subItem = allItem[i][j];
					if(isContains(subItem,value) && value!=""){
						ifElseContain=true;
						if(j==0){
							switch(i){
								case 0 : 
									$('#HomeFuncAccordion').accordion('select',allItem[0][0]);
									var node = $('#scheduleMonitor').tree('find',11);
									$('#scheduleMonitor').tree('expandTo', node.target).tree('select', node.target);
									break;
								case 1 :
									$('#HomeFuncAccordion').accordion('select',allItem[1][0]);
									var node = $('#deviceMonitor').tree('find',21);
									$('#deviceMonitor').tree('expandTo', node.target).tree('select', node.target);
									break;
								case 2 :
									$('#HomeFuncAccordion').accordion('select',allItem[2][0]);
									var node = $('#technologyMonitor').tree('find',31);
									$('#technologyMonitor').tree('expandTo', node.target).tree('select', node.target);
									break;
								case 3 :
									$('#HomeFuncAccordion').accordion('select',allItem[3][0]);
									var node = $('#materialMonitor').tree('find',41);
									$('#materialMonitor').tree('expandTo', node.target).tree('select', node.target);
									break;
								case 4 :
									$('#HomeFuncAccordion').accordion('select',allItem[4][0]);
									var node = $('#qualifyMonitor').tree('find',51);
									$('#qualifyMonitor').tree('expandTo', node.target).tree('select', node.target);
									break;
								case 5 :
									$('#HomeFuncAccordion').accordion('select',allItem[5][0]);
									var node = $('#employeeMonitor').tree('find',61);
									$('#employeeMonitor').tree('expandTo', node.target).tree('select', node.target);
									break;
								default:
									break; 
							}
						}else if(j>0){
							var k = (i+1)*10+j;
							switch(i){
								case 0 : 
									$('#HomeFuncAccordion').accordion('select',allItem[0][0]);
									var node = $('#scheduleMonitor').tree('find',k);
									$('#scheduleMonitor').tree('expandTo', node.target).tree('select', node.target);
									break;
								case 1 :
									$('#HomeFuncAccordion').accordion('select',allItem[1][0]);
									var node = $('#deviceMonitor').tree('find',k);
									$('#deviceMonitor').tree('expandTo', node.target).tree('select', node.target);
									break;
								case 2 :
									$('#HomeFuncAccordion').accordion('select',allItem[2][0]);
									var node = $('#technologyMonitor').tree('find',k);
									$('#technologyMonitor').tree('expandTo', node.target).tree('select', node.target);
									break;
								case 3 :
									$('#HomeFuncAccordion').accordion('select',allItem[3][0]);
									var node = $('#materialMonitor').tree('find',k);
									$('#materialMonitor').tree('expandTo', node.target).tree('select', node.target);
									break;
								case 4 :
									$('#HomeFuncAccordion').accordion('select',allItem[4][0]);
									var node = $('#qualifyMonitor').tree('find',k);
									$('#qualifyMonitor').tree('expandTo', node.target).tree('select', node.target);
									break;
								case 5 :
									$('#HomeFuncAccordion').accordion('select',allItem[5][0]);
									var node = $('#employeeMonitor').tree('find',k);
									$('#employeeMonitor').tree('expandTo', node.target).tree('select', node.target);
									break;
								default:
									break; 
							}
							
						}
						break;
					}
				}
				if(ifElseContain==true){
					break;
				}
			}
		}  
		
		$(function() {
			/* Schedule Manager Tree onClick Event */
			$('#scheduleMonitor').tree({
				onClick : function(node) {
					if ($('#scheduleMonitor').tree("isLeaf", node.target)) {
						var tabs1 = $("#tabs");
						var tab1 = tabs1.tabs("getTab", node.text);
						if (tab1) {
							tabs1.tabs("select", node.text);
						} else {
							tabs1.tabs('add', {
								title : node.text,
								href : node.attributes.url,
								closable : true,
								bodyCls : "content"
							});
						}
					}
				}
			});
	
			/* Device Manager Tree onClick Event */
			$('#deviceMonitor').tree({
				onClick : function(node) {
					/* debugger; */
					if ($('#deviceMonitor').tree("isLeaf", node.target)) {
						var tabs2 = $("#tabs");
						var tab2 = tabs2.tabs("getTab", node.text);
						if (tab2) {
							tabs2.tabs("select", node.text);
						} else {
							tabs2.tabs('add', {
								title : node.text,
								href : node.attributes.url,
								closable : true,
								bodyCls : "content"
							});
						}
					}
				}
			});
			
			/* Material Manager Tree onClick Event */
			$('#materialMonitor').tree({
				onClick : function(node) {
					if ($('#materialMonitor').tree("isLeaf", node.target)) {
					var tabs2 = $("#tabs");
						var tab2 = tabs2.tabs("getTab", node.text);
						if (tab2) {
							tabs2.tabs("select", node.text);
						} else {
							tabs2.tabs('add', {
								title : node.text,
								href : node.attributes.url,
								closable : true,
								bodyCls : "content"
							});
						}
					}
				}
			});
			
			/* qualify Manager Tree onClick Event */
			$('#qualifyMonitor').tree({
				onClick : function(node) {
					if ($('#qualifyMonitor').tree("isLeaf", node.target)) {
						var tabs1 = $("#tabs");
						var tab1 = tabs1.tabs("getTab", node.text);
						if (tab1) {
							tabs1.tabs("select", node.text);
						} else {
							tabs1.tabs('add', {
								title : node.text,
								href : node.attributes.url,
								closable : true,
								bodyCls : "content"
							});
						}
					}
				}
			});
			
			/* Technology Manager Tree onClick Event */
			$('#technologyMonitor').tree({
				onClick : function(node) {
					if ($('#technologyMonitor').tree("isLeaf", node.target)) {
						var tabs3 = $("#tabs");
						var tab3 = tabs3.tabs("getTab", node.text);
						if (tab3) {
							tabs3.tabs("select", node.text);
						} else {
							tabs3.tabs('add', {
								title : node.text,
								href : node.attributes.url,
								closable : true,
								bodyCls : "content"
							});
						}
					}
				}
			});
			
			/* Device Manager Tree onClick Event */
			$('#employeeMonitor').tree({
				onClick : function(node) {
					/* debugger; */
					if ($('#deviceMonitor').tree("isLeaf", node.target)) {
						var tabs2 = $("#tabs");
						var tab2 = tabs2.tabs("getTab", node.text);
						if (tab2) {
							tabs2.tabs("select", node.text);
						} else {
							tabs2.tabs('add', {
								title : node.text,
								href : node.attributes.url,
								closable : true,
								bodyCls : "content"
							});
						}
					}
				}
			});
			
			/* Sys Manager Tree onClick Event */
			$('#sysManager').tree({
				onClick : function(node) {
					if ($('#sysManager').tree("isLeaf", node.target)) {
						var tabs3 = $("#tabs");
						var tab3 = tabs3.tabs("getTab", node.text);
						if (tab3) {
							tabs3.tabs("select", node.text);
						} else {
							tabs3.tabs('add', {
								title : node.text,
								href : node.attributes.url,
								closable : true,
								bodyCls : "content"
							});
						}
					}
				}
			});
			
			/* Sys backgroundMonitor Tree onClick Event */
			$('#backgroundMonitor').tree({
				onClick : function(node) {
					if ($('#backgroundMonitor').tree("isLeaf", node.target)) {
						var tabs3 = $("#tabs");
						var tab3 = tabs3.tabs("getTab", node.text);
						if (tab3) {
							tabs3.tabs("select", node.text);
						} else {
							tabs3.tabs('add', {
								title : node.text,
								href : node.attributes.url,
								closable : true,
								bodyCls : "content"
							});
						}
					}
				}
			});
						
	});
		
	</script>
</body>
</html>