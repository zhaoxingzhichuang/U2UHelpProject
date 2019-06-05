<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">
<div style="padding:10px 10px 10px 10px">
	<form id="categoryAddForm" class="materialForm" method="post">
	    <table cellpadding="5" >
	         <tr>
	            <td>名称:</td>
	            <td>
	            	<input class="easyui-textbox" type="text" name="cateName" data-options="required:true"
						   style="width: 160px;"/>
						   <input type="hidden" name="level" value="1">
	            </td>
	        </tr>
	        <tr>
	            <td>备注：</td>
	            <td>
	            	<input class="easyui-textbox" type="text" name="cateDesc" data-options="required:false"
	            			style="width: 160px;"/>
	            </td>
	        </tr>
	    </table>
	</form>
	<div style="padding:5px">
	    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitcategoryAddForm()">提交</a>
	    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearMaterialForm()">重置</a>
	</div>
</div>
<script type="text/javascript">
	//提交表单
	function submitcategoryAddForm(){
		//有效性验证
		if(!$('#categoryAddForm').form('validate')){
			$.messager.alert('提示','表单还未填写完成!');
			return ;
		}
		//同步文本框中的备注
		//materialAddEditor.sync();
		//ajax的post方式提交表单
		//$("#customAddForm").serialize()将表单序列号为key-value形式的字符串
		$.post("categoryName/insert",$("#categoryAddForm").serialize(), function(data){
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
		$('#categoryAddForm').form('reset');
		//materialAddEditor.html('');
	}
	$('#cc').combo({    
	    required:true,    
	    multiple:true   
	});
	function updateMaterialForm(){
			$("#categoryAddWindow").window('close');
			$("#categoryList").datagrid("reload");
	}
</script>
