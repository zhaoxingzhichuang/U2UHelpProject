<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">
<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/lang/zh_CN.js"></script>
<div style="padding:10px 10px 10px 10px">
	<form id="categoryEditForm" class="categoryForm" method="post">
		<input type="hidden" name="id"/>
	    <table cellpadding="5" >
	         <tr>
	            <td>名称:</td>
	            <td>
	            	<input class="easyui-textbox" type="text" name="cateName" data-options="required:true"
						   style="width: 160px;"/>
						   <input type="hidden" name="id"/>
						   <input type="hidden" name="parentId"/>
						   <input type="hidden" name="level"/>
	            </td>
	        </tr>
	        <tr>
	            <td>内容:</td>
	            <td>
	            	<input class="easyui-textbox" type="text" name="cateDesc" data-options="required:false"
	            			style="width: 160px;"/>
	            </td>
	        </tr>
	    </table>
	</form>
	<div style="padding:5px">
	    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitcategoryEditForm()">提交</a>
	</div>
</div>
<script type="text/javascript">
	var categoryEditEditor ;
	$(function(){
		//实例化编辑器
		//categoryEditEditor = TAOTAO.createEditor("#categoryEditForm [name=note]");
	});
	
	function submitcategoryEditForm(){
		$.get("dictionary/edit",'',function(data){
    		if(data.msg != null){
    			$.messager.alert('提示', data.msg);
    		}else{
    			if(!$('#categoryEditForm').form('validate')){
    				$.messager.alert('提示','表单还未填写完成!');
    				return ;
    			}
    			//同步文本框中的备注
    			//categoryEditEditor.sync();
    			$.post("categoryName/update",$("#categoryEditForm").serialize(), function(data){
    				if(data.status == 200){
    					$.messager.alert('提示','修改成功!','info',function(){
    						$("#categoryEditWindow").window('close');
    						$("#categoryList").datagrid("reload");
    					});
    				}else{
    					$.messager.alert('提示', data.msg);
    				}
    			});
    		}
    	});	
	}
</script>
