<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<link href="js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">
<style type="text/css">
	.div_chart{
		width:33%;
		max-height: 400px;
		min-height: 360px;
		float:left;
		margin-left: 2px;
	}
</style>

<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/lang/zh_CN.js"></script>

<div id="monthSaleReportForm" class="div_chart"></div>
<div id="salePercent" class="div_chart"></div>
<div id="saleTotalMoneyStatistic" class="div_chart"></div>
<div style="float:left;width:100%;">
<table class="easyui-datagrid" id="customList" title="门店销售列表" data-options="singleSelect:false,collapsible:true,
		pagination:true,rownumbers:true,url:'custom/list', method:'get',pageSize:10, fitColumns:true,
		toolbar:toolbar_custom,onClickRow:onClickRowshop,onAfterEdit:onAfterEditshop">
    <thead>
        <tr>
        	<th data-options="field:'ck',checkbox:true"></th>
        	<th data-options="field:'id',hidden:true">id</th>
        	<!-- <th data-options="field:'month',align:'center',width:50">Time   |    月     份</th> -->
			<!-- <th data-options="field:'date',align:'center',width:200,formatter:function(value,row){debugger;var nv = new Date(value).format('yyyy-MM-dd hh:mm:ss');value = nv;return nv;},editor:{type:'datetimebox',options:{required:true}}">Time   |    日      期</th> -->
			<th data-options="field:'date',align:'center',width:230,editor:{type:'datetimebox',options:{required:true}}">Time   |    日      期</th>
        	<th data-options="field:'stylenumCode',width:100,align:'center',
        					formatter:function(value,row){
								return row.stylenumName;
							},
							editor:{
							type:'combobox',
							options:{
								valueField:'id',
								textField:'name',
								method:'get',
								url:'dictionary/parentListOption/1',
								required:true
							}
						}">款        号</th>
			<th data-options="field:'stylenumName',hidden:true">stylenumName</th>
            <th data-options="field:'ma100',width:100,align:'center',editor:'numberbox'">100码</th>
            <th data-options="field:'ma110',width:100,align:'center',editor:'numberbox'">110码</th>
            <th data-options="field:'ma120',width:100,align:'center',editor:'numberbox'">120码</th>
            <th data-options="field:'ma130',width:100,align:'center',editor:'numberbox'">130码</th>
            <th data-options="field:'ma140',width:100,align:'center',editor:'numberbox'">140码</th>
            <th data-options="field:'ma150',width:100,align:'center',editor:'numberbox'">150码</th>
            <th data-options="field:'ma160',width:100,align:'center',editor:'numberbox'">160码</th>
            <th data-options="field:'ma170',width:100,align:'center',editor:'numberbox'">170码</th>
            <th data-options="field:'ma180',width:100,align:'center',editor:'numberbox'">180码</th>
            <th data-options="field:'ma190',width:100,align:'center',editor:'numberbox'">190码</th>
            <th data-options="field:'ltNumPrice',width:100,align:'center',editor:{type:'numberbox',options:{precision:1}}">小码单价</th>
            <th data-options="field:'gtNumPrice',width:100,align:'center',editor:{type:'numberbox',options:{precision:1}}">大码单价</th>
            <th data-options="field:'totalPiece',width:100,align:'center',editor:{type:'numberbox',options:{readonly:true}}">总件数</th>
            <th data-options="field:'totalMoney',width:100,align:'center',editor:{type:'numberbox',options:{precision:1,readonly:true}}">总金额</th>
            <th data-options="field:'afterSubsidyMoney',width:100,align:'center',editor:{type:'numberbox',options:{precision:1}}">折后总金额</th>
        </tr>
    </thead>
</table>
<table class="easyui-datagrid" id="customStatisticList" title="销量统计" data-options="singleSelect:false,collapsible:true,
		pagination:true,rownumbers:true,url:'custom/findltandgtpercent', method:'get',pageSize:10, fitColumns:true">
    <thead>
        <tr>
        	<th data-options="field:'id',hidden:true">id</th>
        	<th data-options="field:'stylenumName',width:100,align:'center'">款        号</th>
			<th data-options="field:'stylenumCode',hidden:true">stylenumCode</th>
            <th data-options="field:'ma100',width:100,align:'center'">100码</th>
            <th data-options="field:'ma110',width:100,align:'center'">110码</th>
            <th data-options="field:'ma120',width:100,align:'center'">120码</th>
            <th data-options="field:'ma130',width:100,align:'center'">130码</th>
            <th data-options="field:'ma140',width:100,align:'center'">140码</th>
            <th data-options="field:'ma150',width:100,align:'center'">150码</th>
            <th data-options="field:'ma160',width:100,align:'center'">160码</th>
            <th data-options="field:'ma170',width:100,align:'center'">170码</th>
            <th data-options="field:'ma180',width:100,align:'center'">180码</th>
            <th data-options="field:'ma190',width:100,align:'center'">190码</th>
            <th data-options="field:'sumCount',width:100,align:'center'">合计</th>
            <th data-options="field:'ltPiece',width:100,align:'center'">小码</th>
            <th data-options="field:'ltPercent',width:100,align:'center'">占比</th>
            <th data-options="field:'gtPiece',width:100,align:'center'">大码</th>
            <th data-options="field:'gtPrcent',width:100,align:'center'">占比</th>
        </tr>
    </thead>
</table>
</div>
<div  id="toolbar_custom" style=" height: 22px; padding: 3px 11px; background: #fafafa;">  
	
	<c:forEach items="${sessionScope.sysPermissionList}" var="per" >
		<c:if test="${per=='custom:add' }" >
		    <div style="float: left;">  
		        <a href="#" class="easyui-linkbutton" plain="true" icon="icon-add" onclick="shop_append()">新增</a>  
		    </div>  
		</c:if>
		<c:if test="${per=='custom:edit' }" >
		    <div style="float: left;">  
		        <a href="#" class="easyui-linkbutton" plain="true" icon="icon-edit" onclick="shop_add()">保存</a>  
		    </div>  
		</c:if>
		<c:if test="${per=='custom:edit' }" >
		    <div style="float: left;">  
		        <a href="#" class="easyui-linkbutton" plain="true" icon="icon-undo" onclick="shop_removeit()">撤销修改</a>  
		    </div>  
		</c:if>
		<c:if test="${per=='custom:delete' }" >
		    <div style="float: left;">  
		        <a href="#" class="easyui-linkbutton" plain="true" icon="icon-cancel"
		        	 onclick="shop_delete()">删除</a>  
		    </div>  
		</c:if>
	</c:forEach>
	
	<div class="datagrid-btn-separator"></div>  
	
	<div style="float: left;">  
		<a href="#" class="easyui-linkbutton" plain="true" icon="icon-reload" onclick="shop_reload()">刷新</a>  
	</div>  
	
    <!-- <div id="search_custom" style="float: right;">
        <input id="search_text_custom" class="easyui-searchbox"  
            data-options="searcher:doSearch_custom,prompt:'请输入...',menu:'#menu_custom'"  
            style="width:250px;vertical-align: middle;">
        </input>
        <div id="menu_custom" style="width:120px"> 
			<div data-options="name:'customId'">客户编号</div> 
			<div data-options="name:'customName'">客户名称</div>
		</div>     
    </div>  --> 

</div>

<div id="customEditWindow" class="easyui-window" title="编辑客户" 
	data-options="modal:true,closed:true,resizable:true,iconCls:'icon-save',href:'custom/edit'" 
	style="width:65%;height:80%;padding:10px;">
</div>

<div id="customAddWindow" class="easyui-window" title="添加客户" 
	data-options="modal:true,closed:true,resizable:true,iconCls:'icon-save',href:'custom/add'" 
	style="width:65%;height:80%;padding:10px;">
</div>

<div id="customNoteDialog" class="easyui-dialog" title="备注" 
	data-options="modal:true,closed:true,resizable:true,iconCls:'icon-save'" 
	style="width:55%;height:65%;padding:10px;">
	<form id="customNoteForm" class="itemForm" method="post">
		<input type="hidden" name="customId"/>
	    <table cellpadding="5" >
	        <tr>
	            <td>备注:</td>
	            <td>
	                <textarea style="width:800px;height:450px;visibility:hidden;" name="note"></textarea>
	            </td>
	        </tr>
	    </table>
	</form>
	<div style="padding:5px">
	    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="updateCustomNote()">保存</a>
	</div>
</div>
<script>
$(function(){
	$.get("custom/getTotalShopsaleData", function(data){
		if(data){
			console.log(data.length);
			var monthSaleReportForm = echarts.init(document.getElementById('monthSaleReportForm'));
			
			// 指定图表的配置项和数据
			var option = {
			    title: {
			        text: '月销量报表'
			    },
			    tooltip: {},
			    legend: {
			        data:['数量统计','金额统计']
			    },
			    xAxis: {
			        data: ["1月份","2月份","3月份","4月份","5月份","6月份","7月份","8月份","9月份","10月份","11月份","12月份"]
			    },
			    yAxis: {},
			    series: [{
					        name: '数量统计',
					        type: 'bar',
					        data: [data[0]['TOTAL_PIECE'], data[1]['TOTAL_PIECE'], data[2]['TOTAL_PIECE'], data[3]['TOTAL_PIECE'],data[4]['TOTAL_PIECE'],data[5]['TOTAL_PIECE'],data[6]['TOTAL_PIECE'],data[7]['TOTAL_PIECE'],data[8]['TOTAL_PIECE'],data[9]['TOTAL_PIECE'],data[10]['TOTAL_PIECE'],data[11]['TOTAL_PIECE']]
					    },{
					    	name: '金额统计', 
					    	type: 'bar',
					    	data: [data[0]['TOTAL_MONEY'], data[1]['TOTAL_MONEY'], data[2]['TOTAL_MONEY'], data[3]['TOTAL_MONEY'],data[4]['TOTAL_MONEY'],data[5]['TOTAL_MONEY'],data[6]['TOTAL_MONEY'],data[7]['TOTAL_MONEY'],data[8]['TOTAL_MONEY'],data[9]['TOTAL_MONEY'],data[10]['TOTAL_MONEY'],data[11]['TOTAL_MONEY']]}]
			};
			
			monthSaleReportForm.setOption(option);
			
		}else{
			$.messager.alert("操作提示", "查询统计数据失败！","error");
		}
	});
	
	$.get("custom/getTotalShopsaleDataByYear", function(data){
		if(data){
			console.log(JSON.stringify(data));
			var salePercent = echarts.init(document.getElementById('salePercent'));
			var saleTotalMoneyStatistic = echarts.init(document.getElementById('saleTotalMoneyStatistic'));
			var option2 = {
				    title : {
				        text: '销售占比',
				        subtext: '',
				        x:'center'
				    },
				    tooltip : {
				    	trigger: 'item',
				        formatter: "{a} <br/>{b} : {c} ({d}%)"
				    },
				    legend: {
				        orient : 'vertical',
				        x : 'left',
				        data:['小码销售占比','大码销售占比']
				    },
				    toolbox: {},
				    series : [
				        {
				            name:'销售占比',
				            type:'pie',
				            radius : '55%',
				            center: ['50%', '50%'],
				            data:[
				                {value:data['LT_PIECE'], name:'小码销售占比'},
				                {value:data['GT_PIECE'], name:'大码销售占比'}
				            ]
				        }
				    ]
				};
			var option3 = {
				    title: {
				        text: '销量总数量/金额'
				    },
				    tooltip: {},
				    legend: {
				        data:['小码','大码']
				    },
				    xAxis: {
				        data: ["销售总数量","销售总金额"]
				    },
				    yAxis: {},
				    series: [{
						        name: '小码',
						        type: 'bar',
						        data: [data['LT_PIECE'], data['LT_SUM_MONEY']]
						    },{
						    	name: '大码', 
						    	type: 'bar',
						    	data: [data['GT_PIECE'], data['GT_SUM_MONEY']]}]
				};
			salePercent.setOption(option2);
			saleTotalMoneyStatistic.setOption(option3);
		}else{
			$.messager.alert("操作提示", "查询统计数据失败！","error");
		}
	});
	
})

function doSearch_custom(value,name){ //用户输入用户名,点击搜素,触发此函数  
	if(value == null || value == ''){
		$("#customList").datagrid({
	        title:'客户列表', singleSelect:false, collapsible:true, pagination:true, rownumbers:true, 
	        	method:'get', nowrap:true,  
	        toolbar:"toolbar_custom", url:'custom/list', method:'get', loadMsg:'数据加载中......',  
	        	fitColumns:true,//允许表格自动缩放,以适应父容器  
	        columns : [ [ 
	             	{field : 'ck', checkbox:true }, 
	             	{field : 'customId', width : 100, title : '客户编号', align:'center'},
	             	{field : 'customName', width : 100, align : 'center', title : '客户名称'},
	             	{field : 'fullName', width : 200, align : 'center', title : '客户全称'}, 
	             	{field : 'address', width : 200, title : '地址', align:'center'}, 
	             	{field : 'fax', width : 100, title : '传真', align:'center'}, 
	            	{field : 'email', width : 70, title : '邮箱', align:'center'}, 
	             	{field : 'ownerName', width : 60, title : '经理姓名', align:'center'}, 
	             	{field : 'ownerTel', width : 100, title : '联系电话', align:'center'}, 
	             	{field : 'status', width : 60, title : '客户状态', align:'center', 
	             			formatter:TAOTAO.formatCustomStatus}, 
	             	{field : 'note', width : 100, title : '备注', align:'center', formatter:formatCustomNote}, 
	        ] ],  
	    });
	}else{
		$("#customList").datagrid({  
	        title:'客户列表', singleSelect:false, collapsible:true, pagination:true, rownumbers:true, 
	        	method:'get', nowrap:true,  
	        toolbar:"toolbar_custom", url:'custom/search_custom_by_'+name+'?searchValue='+value, 
	        	loadMsg:'数据加载中......',  fitColumns:true,//允许表格自动缩放,以适应父容器  
	        columns : [ [ 
					{field : 'ck', checkbox:true }, 
					{field : 'customId', width : 100, title : '客户编号', align:'center'},
					{field : 'customName', width : 100, align : 'center', title : '客户名称'},
					{field : 'fullName', width : 200, align : 'center', title : '客户全称'}, 
					{field : 'address', width : 200, title : '地址', align:'center'}, 
					{field : 'fax', width : 100, title : '传真', align:'center'}, 
					{field : 'email', width : 70, title : '邮箱', align:'center'}, 
					{field : 'ownerName', width : 60, title : '经理姓名', align:'center'}, 
					{field : 'ownerTel', width : 100, title : '联系电话', align:'center'}, 
					{field : 'status', width : 60, title : '客户状态', align:'center', 
							formatter:TAOTAO.formatCustomStatus}, 
					{field : 'note', width : 100, title : '备注', align:'center', formatter:formatCustomNote}, 
	        ] ],  
	    });
	}
}	
	var customNoteEditor ;
	
	//根据index拿到该行值
	function onCustomClickRow(index) {
		var rows = $('#customList').datagrid('getRows');
		return rows[index];
		
	}
	
	//格式化客户介绍
	function formatCustomNote(value, row, index){ 
		if(value !=null && value != ''){
			return "<a href=javascript:openCustomNote("+index+")>"+"客户介绍"+"</a>";
		}else{
			return "无";
		}
	}
	
	function  openCustomNote(index){ 
		
		var row = onCustomClickRow(index);
		$("#customNoteDialog").dialog({
			onOpen :function(){
				$("#customNoteForm [name=customId]").val(row.customId);
				customNoteEditor = TAOTAO.createEditor("#customNoteForm [name=note]");
				customNoteEditor.html(row.note);
				
			},
		
			onBeforeClose: function (event, ui) {
				// 关闭Dialog前移除编辑器
			   	KindEditor.remove("#customNoteForm [name=note]");
			}
		}).dialog("open");
	};
	
	function updateCustomNote(){
		$.get("custom/edit_judge",'',function(data){
    		if(data.msg != null){
    			$.messager.alert('提示', data.msg);
    		}else{
    			customNoteEditor.sync();
    			$.post("custom/update_note",$("#customNoteForm").serialize(), function(data){
    				if(data.status == 200){
    					$("#customNoteDialog").dialog("close");
    					$("#customList").datagrid("reload");
    					$.messager.alert("操作提示", "更新客户介绍成功！");
    				}else{
    					$.messager.alert("操作提示", "更新客户介绍失败！","error");
    				}
    			});
    		}
    	});
	}
	
	function getCustomSelectionsIds(){
		var customList = $("#customList");
		var sels = customList.datagrid("getSelections");
		var ids = [];
		for(var i in sels){
			ids.push(sels[i].id);
		}
		ids = ids.join(","); 
		
		return ids;
	}
	
	
	//---------add shop sale----------
	//重构编辑表格事件
	var shopSaleObject = new Object();
	shopSaleObject.editIndex = undefined;
	shopSaleObject.addFlag = false;
	shopSaleObject.endEditing = function(){
		if (shopSaleObject.editIndex == undefined){return true}
		if ($('#customList').datagrid('validateRow', shopSaleObject.editIndex)){
			var ed = $('#customList').datagrid('getEditor', {index:shopSaleObject.editIndex,field:'stylenumCode'});
			var stylenumName = $(ed.target).combobox('getText');
			$('#customList').datagrid('getRows')[shopSaleObject.editIndex]['stylenumName'] = stylenumName;
			$('#customList').datagrid('endEdit', shopSaleObject.editIndex); 
			shopSaleObject.editIndex = undefined;
			return true;
		} else {
			return false;
		}
	}
	function onClickRowshop(index){
		if (shopSaleObject.editIndex != index){
			if (shopSaleObject.endEditing()){
				$('#customList').datagrid('selectRow', index).datagrid('beginEdit', index);
				shopSaleObject.editIndex = index;
			} else {
				$('#customList').datagrid('selectRow', shopSaleObject.editIndex);
			}
		}
	}
	function shop_append(){
		if (shopSaleObject.endEditing()){
			$('#customList').datagrid('appendRow',{date:'new Date()'});
			shopSaleObject.editIndex = $('#customList').datagrid('getRows').length-1;
			$('#customList').datagrid('selectRow', shopSaleObject.editIndex)
					.datagrid('beginEdit', shopSaleObject.editIndex);
		}
	}
	function shop_removeit(){
		if (shopSaleObject.editIndex == undefined){return}
		$('#customList').datagrid('cancelEdit', shopSaleObject.editIndex);
				//.datagrid('deleteRow', shopSaleObject.editIndex);
		shopSaleObject.editIndex = undefined;
	}
	function shop_add(){
			shopSaleObject.addFlag = true;
		if (shopSaleObject.endEditing()){
			$('#customList').datagrid('acceptChanges');
			//接下来执行：onAfterEdit
			
		}
	}
	
	function onAfterEditshop(rowIndex, rowData, changes){
		/* if(rowData['id']){//修改
			if(changes && 'undefined' != changes){
				
			}
		}else{ *///新增
			if(rowData['ma100'] != '' || rowData['ma110'] != '' || rowData['ma120'] != '' || rowData['ma130'] != ''
				|| rowData['ma140'] != '' || rowData['ma150'] != ''){
				
				rowData['totalPiece'] = Number(rowData['ma100']) + Number(rowData['ma110']) + Number(rowData['ma120']) + Number(rowData['ma130']) + Number(rowData['ma140']) + Number(rowData['ma150']);
				
				if(rowData['ltNumPrice'] != ''){
					rowData['totalMoney'] = rowData['totalPiece']*rowData['ltNumPrice'];
				}
				//设置修改后的总件数和总金额
				/* $('#customList').datagrid('beginEdit', rowIndex);
				var ed = $('#customList').datagrid('getEditor', {index:rowIndex,field:'totalPiece'});
				$(ed.target).numberbox('setValue',rowData['totalPiece']);
				ed = $('#customList').datagrid('getEditor', {index:rowIndex,field:'totalMoney'}).target;
				$(ed).numberbox('setValue',rowData['totalMoney']);
				$('#customList').datagrid('endEdit', rowIndex); */
			}
			
			if(rowData['ma160'] != '' || rowData['ma170'] != '' || rowData['ma180'] != '' || rowData['ma190'] != ''){
				 var gtNums = Number(rowData['ma160']) + Number(rowData['ma170']) + Number(rowData['ma180']) + Number(rowData['ma190']);
				 rowData['totalPiece'] += gtNums;
				 if(rowData['gtNumPrice'] != ''){
					rowData['totalMoney'] += gtNums*rowData['gtNumPrice'];
				}
			}
			console.log('totalPiece='+rowData['totalPiece']);
			console.log('totalMoney='+rowData['totalMoney']);
			rowData['afterSubsidyMoney'] = Number(rowData['afterSubsidyMoney']);
			if(shopSaleObject.addFlag){
				$.post("custom/insertorupdate",rowData, function(data){
					if(data.status == 200){
						$.messager.alert('提示','更新门店销售成功!');
						$("#customList").datagrid("reload");
					}else{
						$.messager.alert('提示',data.msg);
					}
					shopSaleObject.editIndex = undefined;
					shopSaleObject.addFlag = false;
				});
			}
		//}
	}
	
    function custom_edit(){
    	$.get("custom/edit_judge",'',function(data){
       		if(data.msg != null){
       			$.messager.alert('提示', data.msg);
       		}else{
       			var ids = getCustomSelectionsIds();
    	    	
    	    	if(ids.length == 0){
    	    		$.messager.alert('提示','必须选择一个客户才能编辑!');
    	    		return ;
    	    	}
    	    	if(ids.indexOf(',') > 0){
    	    		$.messager.alert('提示','只能选择一个客户!');
    	    		return ;
    	    	}
    	    	
    	    	$("#customEditWindow").window({
    	    		onLoad :function(){
    	    			//回显数据
    	    			var data = $("#customList").datagrid("getSelections")[0];
    	    			$("#customEditForm").form("load", data);
    	    			customEditEditor.html(data.note);
    	    		}
    	    	}).window("open");
       		}
       	});
    }
    
    function shop_delete(){
    	$.get("custom/delete_judge",'',function(data){
      		if(data.msg != null){
      			$.messager.alert('提示', data.msg);
      		}else{
      			var ids = getCustomSelectionsIds();
              	if(ids.length == 0){
              		$.messager.alert('提示','未选中销售数据!');
              		return ;
              	}
              	$.messager.confirm('确认','确定删除ID为 '+ids+' 的销售数据吗？',function(r){
              	    if (r){
              	    	var params = {"ids":ids};
                      	$.post("custom/delete_batch",params, function(data){
                  			if(data.status == 200){
                  				$.messager.alert('提示','删除销售数据成功!',undefined,function(){
                  					$("#customList").datagrid("reload");
                  				});
                  			}
                  		});
              	    }
              	});
      		}
      	});
    }
    function shop_reload(){
    	shopSaleObject.editIndex = undefined;
    	$("#customList").datagrid("reload");
    }
    
</script>