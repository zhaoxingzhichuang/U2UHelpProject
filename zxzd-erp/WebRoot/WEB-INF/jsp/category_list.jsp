<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<link href="js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">
<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/lang/zh_CN.js"></script>
<table class="easyui-datagrid" id="categoryList" title="分类名称" data-options="singleSelect:false,collapsible:true,
	pagination:true,rownumbers:true,url:'categoryName/list',method:'get',pageSize:10,fitColumns:true,
	toolbar:toolbar_category">
    <thead>
         <tr>
        	<th data-options="field:'ck',checkbox:true"></th>
        	<th data-options="field:'cateName',align:'center',width:100">名称</th>
        	<th data-options="field:'cateName',align:'center',width:100">备注</th>
            <th data-options="field:'',width:100,align:'center', formatter:formatcategoryNote">操作</th>
          
        </tr>
    </thead>
</table>

<div  id="toolbar_category" style=" height: 22px; padding: 3px 11px; background: #fafafa;">  
	
	<c:forEach items="${sessionScope.sysPermissionList}" var="per" >
		<c:if test="${per=='material:add' }" >
		    <div style="float: left;">  
		        <a href="#" class="easyui-linkbutton" plain="true" icon="icon-add" onclick="category_add()">新增</a>  
		    </div>  
		</c:if>
		<c:if test="${per=='material:edit' }" >
		    <div style="float: left;">  
		        <a href="#" class="easyui-linkbutton" plain="true" icon="icon-edit" onclick="category_edit()">编辑</a>  
		    </div>  
		</c:if>
	</c:forEach>
	
	<div class="datagrid-btn-separator"></div>  
	
	<div style="float: left;">  
		<a href="#" class="easyui-linkbutton" plain="true" icon="icon-reload" onclick="category_reload()">刷新</a>  
	</div>  
	

</div> 

<div  id="toolbar_category1" style=" height: 22px; padding: 3px 11px; background: #fafafa;">  
	<c:forEach items="${sessionScope.sysPermissionList}" var="per" >
		<c:if test="${per=='material:add' }" >
		    <div style="float: left;">  
		        <a href="#" class="easyui-linkbutton" plain="true" icon="icon-add" onclick="category_add1()">新增</a>  
		    </div>  
		</c:if>
		<c:if test="${per=='material:edit' }" >
		    <div style="float: left;">  
		        <a href="#" class="easyui-linkbutton" plain="true" icon="icon-edit" onclick="category_edit1()">编辑</a>  
		    </div>  
		</c:if>
	</c:forEach>
	<div class="datagrid-btn-separator"></div>  
	<div style="float: left;">  
		<a href="#" class="easyui-linkbutton" plain="true" icon="icon-reload" onclick="category_reload1()">刷新</a>  
	</div>  
</div>  

<div id="categoryEditWindow" class="easyui-window" title="编辑字典" data-options="modal:true,closed:true,resizable:true,
	iconCls:'icon-save',href:'categoryName/edit'" style="width:65%;height:65%;padding:10px;">
</div>
<div id="categoryEditWindow1" class="easyui-window" title="编辑词条" data-options="modal:true,closed:true,resizable:true,
	iconCls:'icon-save',href:'categoryName/edit_'" style="width:65%;height:65%;padding:10px;">
</div>
<div id="categoryAddWindow" class="easyui-window" title="添加字典" data-options="modal:true,closed:true,resizable:true,
	iconCls:'icon-save',href:'categoryName/add'" style="width:65%;height:65%;padding:10px;">
</div>
<div id="categoryAddWindow1" class="easyui-window" title="添加词条" data-options="modal:true,closed:true,resizable:true,
	iconCls:'icon-save',href:'categoryName/add_'" style="width:65%;height:65%;padding:10px;">
</div>
<div id="categoryNoteDialog" class="easyui-dialog" title="显示词条" data-options="modal:true,closed:true,resizable:true,
	iconCls:'icon-save'" style="width:55%;height:65%;padding:10px;">
	<form id="categoryNoteForm" class="itemForm" method="post">
		<input type="hidden" name="id"/>
	    <table class="easyui-datagrid" id="categoryList1" title="数据词条" data-options="singleSelect:false,collapsible:true,
			pagination:true,rownumbers:true,method:'get',pageSize:50,fitColumns:true,
			toolbar:toolbar_category1">
		    <thead>
		         <tr>
		        	<th data-options="field:'ck',checkbox:true"></th>
		        	<th data-options="field:'name',align:'center',width:100">名称</th>
		            <th data-options="field:'value',align:'center',width:100">内容</th>
		        </tr>
		    </thead>
		</table>
	</form>
</div>
<script>
	
function doSearch_category(value,name){ //用户输入用户名,点击搜素,触发此函数  
	if(value == null || value == ''){
		$("#categoryList").datagrid({
	        title:'物料信息', singleSelect:false, collapsible:true, pagination:true, rownumbers:true, method:'get',
			nowrap:true, toolbar:"toolbar_category", url:'categoryName/list', method:'get', loadMsg:'数据加载中......',
			fitColumns:true,//允许表格自动缩放,以适应父容器
	        columns : [ [ 	       
				{field : 'ck', checkbox:true },
				{field : 'name', width : 100, title : '名称', align:'center'},
				{field : 'value', width : 100, align : 'center', title : '内容'},
				{field : 'note', width : 100, title : '备注', align:'center',formatter:formatcategoryNote}
	        ] ],  
	    });
	}else{
		$("#categoryList").datagrid({  
	        title:'物料信息', singleSelect:false, collapsible:true, pagination:true, rownumbers:true, method:'get',
			nowrap:true, toolbar:"toolbar_category", url:'categoryName/search_category_by_'+name+'?searchValue='+value,
			loadMsg:'数据加载中......',  fitColumns:true,//允许表格自动缩放,以适应父容器
	        columns : [ [ 
				{field : 'ck', checkbox:true },
				{field : 'name', width : 100, title : '名称', align:'center'},
				{field : 'value', width : 100, align : 'center', title : '内容'},
				{field : 'note', width : 100, title : '备注', align:'center',formatter:formatcategoryNote}
	        ] ],  
	    });
	    $("#categoryList1").datagrid({  
	        title:'物料信息', singleSelect:false, collapsible:true, pagination:true, rownumbers:true, method:'get',
			nowrap:true, toolbar:"toolbar_category", url:'categoryName/search_category_by_'+name+'?searchValue='+value,
			loadMsg:'数据加载中......',  fitColumns:true,//允许表格自动缩放,以适应父容器
	        columns : [ [ 
				{field : 'ck', checkbox:true },
				{field : 'name', width : 100, title : '名称', align:'center'},
				{field : 'value', width : 100, align : 'center', title : '内容'},
				{field : 'note', width : 100, title : '备注', align:'center',formatter:formatcategoryNote}
	        ] ],  
	    });
	}
}

	var categoryNoteEditor;
	
	//根据index拿到该行值
	function oncategoryClickRow(index) {
		var rows = $('#categoryList').datagrid('getRows');
		return rows[index];
		
	}
	
	//格式化客户介绍
	function formatcategoryNote(value, row, index){
		return "<a href=javascript:opencategoryNote("+row.id+")>"+"进入词条"+"</a>";
	}
	
	function jumpcategoryName() {
		var tabid = navTab.getCurrentNavTab().attr("tabid");
		navTab.reloadFlag(tabid);
	}
	
	function  opencategoryNote(id){ 
		//var row = oncategoryClickRow(index);
		$("#categoryList1").propertygrid({url:'categoryName/parentList?parentId='+id});
		$("#categoryList1").datagrid({queryParams:{parentId:id}});
	
		$("#categoryNoteForm [name=id]").val(id);
		$.get("categoryName/parentList/"+id,'',function(data){
			$("#categoryNoteDialog").window({
	    		onLoad :function(){
	    			//回显数据
	    			$("#categoryNoteForm").form("load", data);
	    		}
	    	}).window("open");
    	});
		/* $("#categoryNoteDialog").dialog({
			onOpen :function(){
				$("#categoryNoteForm [name=id]").val(row.id);
				//categoryNoteEditor = TAOTAO.createEditor("#categoryNoteForm [name=note]");
				//categoryNoteEditor.html(row.note);
				//回显数据
				$.get("categoryName/parentList",'',function(data){
					$("#categoryNoteForm").form("load", data);
				})
  	    		
				
			},
		
			onBeforeClose: function (event, ui) {
				// 关闭Dialog前移除编辑器
			   	//KindEditor.remove("#categoryNoteForm [name=note]");
			}
		}).dialog("open"); */
	};
	
	function updatecategoryNote(){
		$.get("categoryName/edit",'',function(data){
    		if(data.msg != null){
    			$.messager.alert('提示', data.msg);
    		}else{
    			categoryNoteEditor.sync();
    			$.post("categoryName/update_note",$("#categoryNoteForm").serialize(), function(data){
    				if(data.status == 200){
    					$("#categoryNoteDialog").dialog("close");
    					$("#categoryList").datagrid("reload");
    					$.messager.alert("操作提示", "更新物料详情成功！");
    				}else{
    					$.messager.alert('提示', data.msg);
    				}
    			});
    		}
    	});
	}
	
	function getcategorySelectionsIds(){
		var categoryList = $("#categoryList");
		var sels = categoryList.datagrid("getSelections");
		var ids = [];
		for(var i in sels){
			ids.push(sels[i].id);
		}
		ids = ids.join(","); 
		
		return ids;
	}
	
	function getcategorySelectionsIds1(){
		var categoryList = $("#categoryList1");
		var sels = categoryList.datagrid("getSelections");
		var ids = [];
		for(var i in sels){
			ids.push(sels[i].id);
		}
		ids = ids.join(","); 
		
		return ids;
	}
	
	function category_add(){
    	$.get("categoryName/add",'',function(data){
        		if(data.msg != null){
        			$.messager.alert('提示', data.msg);
        		}else{
        			$("#categoryAddWindow").window("open");
        		}
        	});
	    }
	    
	function category_add1(){
	debugger;
		var parentId = getcategorySelectionsIds();
		if(parentId.length == 0){
    		$.messager.alert('提示','请重新进入词条!');
    		return ;
    	}
    	if(parentId.indexOf(',') > 0){
    		$.messager.alert('提示','只能选择一个记录!');
    		return ;
    	}    
		$("#categoryAddForm_ [name=parentId]").val(parentId);
    	$.get("categoryName/add_?id="+parentId,'',function(data){
        		if(data.msg != null){
        			$.messager.alert('提示', data.msg);
        		}else{
        			//$("#categoryList1").attr("data-options", "url:categoryName/parentList/"+parentId);
        			$("#categoryAddWindow1").window("open");
        			
        		}
        	});
	    }
    
    function category_edit(){
    	$.get("categoryName/edit",'',function(data){
        		if(data.msg != null){
        			$.messager.alert('提示', data.msg);
        		}else{
        			var ids = getcategorySelectionsIds();
        	    	if(ids.length == 0){
        	    		$.messager.alert('提示','必须选择一个记录才能编辑!');
        	    		return ;
        	    	}
        	    	if(ids.indexOf(',') > 0){
        	    		$.messager.alert('提示','只能选择一个记录!');
        	    		return ;
        	    	}     	    	
        	    	$("#categoryEditWindow").window({
        	    		onLoad :function(){
        	    			//回显数据
        	    			var data = $("#categoryList").datagrid("getSelections")[0];
        	    			$("#categoryEditForm").form("load", data);
        	    			//categoryEditEditor.html(data.note);
        	    		}
        	    	}).window("open");
        		}
        	});
	    }
    
    function category_edit1(){
    	$.get("categoryName/edit_",'',function(data){
        		if(data.msg != null){
        			$.messager.alert('提示', data.msg);
        		}else{
        			var ids = getcategorySelectionsIds1();
        	    	
        	    	if(ids.length == 0){
        	    		$.messager.alert('提示','必须选择一个记录才能编辑!');
        	    		return ;
        	    	}
        	    	if(ids.indexOf(',') > 0){
        	    		$.messager.alert('提示','只能选择一个记录!');
        	    		return ;
        	    	}     	    	
        	    	$("#categoryEditWindow1").window({
        	    		onLoad :function(){
        	    			//回显数据
        	    			var data = $("#categoryList1").datagrid("getSelections")[0];
        	    			$("#categoryEditForm1").form("load", data);
        	    			//categoryEditEditor.html(data.note);
        	    		}
        	    	}).window("open");
        		}
        	});
	    }
    
    function category_delete(){
    		$.get("categoryName/delete",'',function(data){
        		if(data.msg != null){
        			$.messager.alert('提示', data.msg);
        		}else{
        			var ids = getcategorySelectionsIds();
        	    	if(ids.length == 0){
        	    		$.messager.alert('提示','未选中记录!');
        	    		return ;
        	    	}
        	    	$.messager.confirm('确认','确定删除编号为 '+ids+' 的记录吗？',function(r){
        	    	    if (r){
        	    	    	var params = {"ids":ids};
        	            	$.post("categoryName/delete_batch",params, function(data){
        	        			if(data.status == 200){
        	        				$.messager.alert('提示','删除成功!',undefined,function(){
        	        					$("#categoryList").datagrid("reload");
        	        					$("#categoryList1").datagrid("reload");
        	        				});
        	        			}
        	        		});
        	    	    }
        	    	});
        		}
        	});
	    
    }
    
    function category_reload(){
    	$("#categoryList").datagrid("reload");
    }
     function category_reload1(){
    	$("#categoryList1").datagrid("reload");
    }
</script>