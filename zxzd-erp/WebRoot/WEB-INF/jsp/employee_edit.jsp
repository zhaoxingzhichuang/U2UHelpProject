<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">

<link href="css/uploadfile.css" rel="stylesheet"> 
<script src="js/jquery.uploadfile.js"></script>
<script src="js/malsup.github.iojquery.form.js"></script>

<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/lang/zh_CN.js"></script>
<div style="padding:10px 10px 10px 10px">
	<form id="employeeEditForm" class="employeeForm" method="post">
		<input type="hidden" name="empId"/>
	    <table cellpadding="5">
	    	<tr>
	            <td>会员编号:</td>
	            <td>
	            	<input class="easyui-textbox" type="text" name="empId" data-options="required:true"/>
	            </td>
	        </tr>
	    	<tr>
	            <td>会员姓名:</td>
	            <td>
	            	<input class="easyui-textbox" type="text" name="empName" data-options="required:true"/>
    			</td>  
	        </tr>
	        <tr>
	            <td>性别:</td>
	            <td>
	            	<select id="cc" class="easyui-combobox" name="sex" panelHeight="auto" 
	            		data-options="required:true, width:150, editable:false">
						<option value="1">男</option>
						<option value="2">女</option>
					</select>
    			</td>  
	        </tr>
	        <tr>
	            <td>QQ:</td>
	            <td>
	            	<input class="easyui-textbox" type="text" name="education"/>
    			</td>  
	        </tr>
	        <tr>
	            <td>手机号:</td>
	            <td>
	            	<input class="easyui-textbox" type="text" name="educationForm"/>
    			</td>  
	        </tr>
	    </table>
	</form>
	<div style="padding:5px">
	    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitEmployeeEditForm()">提交</a>
	</div>
</div>
<script type="text/javascript">
	
	function submitEmployeeEditForm(){
		if(!$('#employeeEditForm').form('validate')){
			$.messager.alert('提示','表单还未填写完成!');
			return ;
		}
		
		$.post("employee/update_all",$("#employeeEditForm").serialize(), function(data){
			if(data.status == 200){
				$.messager.alert('提示','修改会员成功!','info',function(){
					$("#employeeEditWindow").window('close');
					$("#employeeList").datagrid("reload");
				});
			}else{
				$.messager.alert('提示', data.msg);
			}
		});
	}
</script>
