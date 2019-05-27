<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<link href="js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">
<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/lang/zh_CN.js"></script>
<table class="easyui-datagrid" id="materialList" title="数据字典" data-options="singleSelect:false,collapsible:true,
	pagination:true,rownumbers:true,url:'dictionary/list',method:'get',pageSize:10,fitColumns:true,
	toolbar:toolbar_material">
    <thead>
         <tr>
        	<th data-options="field:'ck',checkbox:true"></th>
        	<th data-options="field:'name',align:'center',width:100">名称</th>
            <th data-options="field:'value',align:'center',width:100">内容</th>
            <th data-options="field:'note',width:100,align:'center', formatter:formatMaterialNote">备注</th>
          
        </tr>
    </thead>
</table>

<div  id="toolbar_material" style=" height: 22px; padding: 3px 11px; background: #fafafa;">  
	
	<c:forEach items="${sessionScope.sysPermissionList}" var="per" >
		<c:if test="${per=='material:add' }" >
		    <div style="float: left;">  
		        <a href="#" class="easyui-linkbutton" plain="true" icon="icon-add" onclick="material_add()">新增</a>  
		    </div>  
		</c:if>
		<c:if test="${per=='material:edit' }" >
		    <div style="float: left;">  
		        <a href="#" class="easyui-linkbutton" plain="true" icon="icon-edit" onclick="material_edit()">编辑</a>  
		    </div>  
		</c:if>
	</c:forEach>
	
	<div class="datagrid-btn-separator"></div>  
	
	<div style="float: left;">  
		<a href="#" class="easyui-linkbutton" plain="true" icon="icon-reload" onclick="material_reload()">刷新</a>  
	</div>  
	

</div> 

<div  id="toolbar_material1" style=" height: 22px; padding: 3px 11px; background: #fafafa;">  
	<c:forEach items="${sessionScope.sysPermissionList}" var="per" >
		<c:if test="${per=='material:add' }" >
		    <div style="float: left;">  
		        <a href="#" class="easyui-linkbutton" plain="true" icon="icon-add" onclick="material_add1()">新增</a>  
		    </div>  
		</c:if>
		<c:if test="${per=='material:edit' }" >
		    <div style="float: left;">  
		        <a href="#" class="easyui-linkbutton" plain="true" icon="icon-edit" onclick="material_edit1()">编辑</a>  
		    </div>  
		</c:if>
	</c:forEach>
	<div class="datagrid-btn-separator"></div>  
	<div style="float: left;">  
		<a href="#" class="easyui-linkbutton" plain="true" icon="icon-reload" onclick="material_reload1()">刷新</a>  
	</div>  
</div>  

<div id="materialEditWindow" class="easyui-window" title="编辑字典" data-options="modal:true,closed:true,resizable:true,
	iconCls:'icon-save',href:'dictionary/edit'" style="width:65%;height:65%;padding:10px;">
</div>
<div id="materialEditWindow1" class="easyui-window" title="编辑词条" data-options="modal:true,closed:true,resizable:true,
	iconCls:'icon-save',href:'dictionary/edit_'" style="width:65%;height:65%;padding:10px;">
</div>
<div id="materialAddWindow" class="easyui-window" title="添加字典" data-options="modal:true,closed:true,resizable:true,
	iconCls:'icon-save',href:'dictionary/add'" style="width:65%;height:65%;padding:10px;">
</div>
<div id="materialAddWindow1" class="easyui-window" title="添加词条" data-options="modal:true,closed:true,resizable:true,
	iconCls:'icon-save',href:'dictionary/add_'" style="width:65%;height:65%;padding:10px;">
</div>
<div id="materialNoteDialog" class="easyui-dialog" title="显示词条" data-options="modal:true,closed:true,resizable:true,
	iconCls:'icon-save'" style="width:55%;height:65%;padding:10px;">
	<form id="materialNoteForm" class="itemForm" method="post">
		<input type="hidden" name="id"/>
	    <table class="easyui-datagrid" id="materialList1" title="数据词条" data-options="singleSelect:false,collapsible:true,
			pagination:true,rownumbers:true,method:'get',pageSize:50,fitColumns:true,
			toolbar:toolbar_material1">
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
	
function doSearch_material(value,name){ //用户输入用户名,点击搜素,触发此函数  
	if(value == null || value == ''){
		$("#materialList").datagrid({
	        title:'物料信息', singleSelect:false, collapsible:true, pagination:true, rownumbers:true, method:'get',
			nowrap:true, toolbar:"toolbar_material", url:'dictionary/list', method:'get', loadMsg:'数据加载中......',
			fitColumns:true,//允许表格自动缩放,以适应父容器
	        columns : [ [ 	       
				{field : 'ck', checkbox:true },
				{field : 'name', width : 100, title : '名称', align:'center'},
				{field : 'value', width : 100, align : 'center', title : '内容'},
				{field : 'note', width : 100, title : '备注', align:'center',formatter:formatMaterialNote}
	        ] ],  
	    });
	}else{
		$("#materialList").datagrid({  
	        title:'物料信息', singleSelect:false, collapsible:true, pagination:true, rownumbers:true, method:'get',
			nowrap:true, toolbar:"toolbar_material", url:'dictionary/search_material_by_'+name+'?searchValue='+value,
			loadMsg:'数据加载中......',  fitColumns:true,//允许表格自动缩放,以适应父容器
	        columns : [ [ 
				{field : 'ck', checkbox:true },
				{field : 'name', width : 100, title : '名称', align:'center'},
				{field : 'value', width : 100, align : 'center', title : '内容'},
				{field : 'note', width : 100, title : '备注', align:'center',formatter:formatMaterialNote}
	        ] ],  
	    });
	    $("#materialList1").datagrid({  
	        title:'物料信息', singleSelect:false, collapsible:true, pagination:true, rownumbers:true, method:'get',
			nowrap:true, toolbar:"toolbar_material", url:'dictionary/search_material_by_'+name+'?searchValue='+value,
			loadMsg:'数据加载中......',  fitColumns:true,//允许表格自动缩放,以适应父容器
	        columns : [ [ 
				{field : 'ck', checkbox:true },
				{field : 'name', width : 100, title : '名称', align:'center'},
				{field : 'value', width : 100, align : 'center', title : '内容'},
				{field : 'note', width : 100, title : '备注', align:'center',formatter:formatMaterialNote}
	        ] ],  
	    });
	}
}

	var materialNoteEditor;
	
	//根据index拿到该行值
	function onMaterialClickRow(index) {
		var rows = $('#materialList').datagrid('getRows');
		return rows[index];
		
	}
	
	//格式化客户介绍
	function formatMaterialNote(value, row, index){
		return "<a href=javascript:openMaterialNote("+row.id+")>"+"进入词条"+"</a>";
	}
	
	function jumpDictionary() {
		var tabid = navTab.getCurrentNavTab().attr("tabid");
		navTab.reloadFlag(tabid);
	}
	
	function  openMaterialNote(id){ 
		//var row = onMaterialClickRow(index);
		$("#materialList1").propertygrid({url:'dictionary/parentList?parentId='+id});
		$("#materialList1").datagrid({queryParams:{parentId:id}});
	
		$("#materialNoteForm [name=id]").val(id);
		$.get("dictionary/parentList/"+id,'',function(data){
			$("#materialNoteDialog").window({
	    		onLoad :function(){
	    			//回显数据
	    			$("#materialNoteForm").form("load", data);
	    		}
	    	}).window("open");
    	});
		/* $("#materialNoteDialog").dialog({
			onOpen :function(){
				$("#materialNoteForm [name=id]").val(row.id);
				//materialNoteEditor = TAOTAO.createEditor("#materialNoteForm [name=note]");
				//materialNoteEditor.html(row.note);
				//回显数据
				$.get("dictionary/parentList",'',function(data){
					$("#materialNoteForm").form("load", data);
				})
  	    		
				
			},
		
			onBeforeClose: function (event, ui) {
				// 关闭Dialog前移除编辑器
			   	//KindEditor.remove("#materialNoteForm [name=note]");
			}
		}).dialog("open"); */
	};
	
	function updateMaterialNote(){
		$.get("dictionary/edit",'',function(data){
    		if(data.msg != null){
    			$.messager.alert('提示', data.msg);
    		}else{
    			materialNoteEditor.sync();
    			$.post("dictionary/update_note",$("#materialNoteForm").serialize(), function(data){
    				if(data.status == 200){
    					$("#materialNoteDialog").dialog("close");
    					$("#materialList").datagrid("reload");
    					$.messager.alert("操作提示", "更新物料详情成功！");
    				}else{
    					$.messager.alert('提示', data.msg);
    				}
    			});
    		}
    	});
	}
	
	function getMaterialSelectionsIds(){
		var materialList = $("#materialList");
		var sels = materialList.datagrid("getSelections");
		var ids = [];
		for(var i in sels){
			ids.push(sels[i].id);
		}
		ids = ids.join(","); 
		
		return ids;
	}
	
	function getMaterialSelectionsIds1(){
		var materialList = $("#materialList1");
		var sels = materialList.datagrid("getSelections");
		var ids = [];
		for(var i in sels){
			ids.push(sels[i].id);
		}
		ids = ids.join(","); 
		
		return ids;
	}
	
	function material_add(){
    	$.get("dictionary/add",'',function(data){
        		if(data.msg != null){
        			$.messager.alert('提示', data.msg);
        		}else{
        			$("#materialAddWindow").window("open");
        		}
        	});
	    }
	    
	function material_add1(){
	debugger;
		var parentId = getMaterialSelectionsIds();
		if(parentId.length == 0){
    		$.messager.alert('提示','请重新进入词条!');
    		return ;
    	}
    	if(parentId.indexOf(',') > 0){
    		$.messager.alert('提示','只能选择一个记录!');
    		return ;
    	}    
		$("#materialAddForm_ [name=parentId]").val(parentId);
    	$.get("dictionary/add_?id="+parentId,'',function(data){
        		if(data.msg != null){
        			$.messager.alert('提示', data.msg);
        		}else{
        			//$("#materialList1").attr("data-options", "url:dictionary/parentList/"+parentId);
        			$("#materialAddWindow1").window("open");
        			
        		}
        	});
	    }
    
    function material_edit(){
    	$.get("dictionary/edit",'',function(data){
        		if(data.msg != null){
        			$.messager.alert('提示', data.msg);
        		}else{
        			var ids = getMaterialSelectionsIds();
        	    	if(ids.length == 0){
        	    		$.messager.alert('提示','必须选择一个记录才能编辑!');
        	    		return ;
        	    	}
        	    	if(ids.indexOf(',') > 0){
        	    		$.messager.alert('提示','只能选择一个记录!');
        	    		return ;
        	    	}     	    	
        	    	$("#materialEditWindow").window({
        	    		onLoad :function(){
        	    			//回显数据
        	    			var data = $("#materialList").datagrid("getSelections")[0];
        	    			$("#materialEditForm").form("load", data);
        	    			//materialEditEditor.html(data.note);
        	    		}
        	    	}).window("open");
        		}
        	});
	    }
    
    function material_edit1(){
    	$.get("dictionary/edit_",'',function(data){
        		if(data.msg != null){
        			$.messager.alert('提示', data.msg);
        		}else{
        			var ids = getMaterialSelectionsIds1();
        	    	
        	    	if(ids.length == 0){
        	    		$.messager.alert('提示','必须选择一个记录才能编辑!');
        	    		return ;
        	    	}
        	    	if(ids.indexOf(',') > 0){
        	    		$.messager.alert('提示','只能选择一个记录!');
        	    		return ;
        	    	}     	    	
        	    	$("#materialEditWindow1").window({
        	    		onLoad :function(){
        	    			//回显数据
        	    			var data = $("#materialList1").datagrid("getSelections")[0];
        	    			$("#materialEditForm1").form("load", data);
        	    			//materialEditEditor.html(data.note);
        	    		}
        	    	}).window("open");
        		}
        	});
	    }
    
    function material_delete(){
    		$.get("dictionary/delete",'',function(data){
        		if(data.msg != null){
        			$.messager.alert('提示', data.msg);
        		}else{
        			var ids = getMaterialSelectionsIds();
        	    	if(ids.length == 0){
        	    		$.messager.alert('提示','未选中记录!');
        	    		return ;
        	    	}
        	    	$.messager.confirm('确认','确定删除编号为 '+ids+' 的记录吗？',function(r){
        	    	    if (r){
        	    	    	var params = {"ids":ids};
        	            	$.post("dictionary/delete_batch",params, function(data){
        	        			if(data.status == 200){
        	        				$.messager.alert('提示','删除成功!',undefined,function(){
        	        					$("#materialList").datagrid("reload");
        	        					$("#materialList1").datagrid("reload");
        	        				});
        	        			}
        	        		});
        	    	    }
        	    	});
        		}
        	});
	    
    }
    
    function material_reload(){
    	$("#materialList").datagrid("reload");
    }
     function material_reload1(){
    	$("#materialList1").datagrid("reload");
    }
</script>