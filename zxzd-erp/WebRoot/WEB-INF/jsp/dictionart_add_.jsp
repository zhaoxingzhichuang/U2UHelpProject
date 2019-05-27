<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">
<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/lang/zh_CN.js"></script>
<div style="padding:10px 10px 10px 10px">
	<form id="materialAddForm_" class="materialForm" method="post">
		<input type=hidden name="parentId"/>
	    <table cellpadding="5" >
	         <tr>
	            <td>名称:</td>
	            <td>
	            	<input class="easyui-textbox" type="text" name="name" data-options="required:true"
						   style="width: 160px;"/>
	            </td>
	        </tr>
	        <tr>
	            <td>内容</td>
	            <td>
	            	<input class="easyui-textbox" type="text" name="value" data-options="required:true"
	            			style="width: 160px;"/>
	            </td>
	        </tr>
	    </table>
	</form>
	<div style="padding:5px">
	    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitMaterialAddForm()">提交</a>
	    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearMaterialForm()">重置</a>
	</div>
</div>
<script type="text/javascript">
	var materialAddEditor ;
	//页面初始化完毕后执行此方法
	$(function(){
		var parentId = $("#materialNoteForm [name=id]").val();
		$("#materialAddForm_ [name=parentId]").val(parentId);
		//创建富文本编辑器
		//customAddEditor = TAOTAO.createEditor("#customAddForm [name=file]");
		//materialAddEditor = KindEditor.create("#materialAddForm [name=note]", TT.kingEditorParams);
	});
	//提交表单
	function submitMaterialAddForm(index){
		//有效性验证
		if(!$('#materialAddForm_').form('validate')){
			$.messager.alert('提示','表单还未填写完成!');
			return ;
		}
		//同步文本框中的备注
		//materialAddEditor.sync();
		//ajax的post方式提交表单
		//$("#customAddForm").serialize()将表单序列号为key-value形式的字符串
		$.post("dictionary/insertParent",$("#materialAddForm_").serialize(), function(data){
			if(data.status == 200){
				$.messager.alert('提示','新增成功!');
				clearMaterialForm();
				updateMaterialForm();	
			}else{
				$.messager.alert('提示',data.msg);
			}  
		}
		
		);
	}
	
	function clearMaterialForm(){
		$('#materialAddForm_').form('reset');
		//materialAddEditor.html('');
	}
	$('#cc').combo({    
	    required:true,    
	    multiple:true   
	});
	function updateMaterialForm(){
			$("#materialAddWindow1").window('close');
			$("#materialList1").datagrid("reload");
	}
</script>
