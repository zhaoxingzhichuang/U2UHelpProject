<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<link href="js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">
<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/lang/zh_CN.js"></script>
<style type="text/css">
.div_left{
	width:100%;
	float:left;
	max-height: 400px;
	min-height: 360px;
}
.div_right{
	width:32%;
	max-height: 500px;
	min-height: 400px;
	float:left;
	margin-left: 2px;
}
</style>
<div id="search_process">
        <!-- <input id="queryName" name="queryName" class="easyui-searchbox"  
            data-options="searcher:doSearch_process,prompt:'请输入月份...例  4月份输入4'"  
            style="width:250px;vertical-align: middle;" /> -->
        <input id="queryName" name="queryName" class="easyui-combobox"
			data-options="valueField:'id',textField:'name',url:'dictionary/parentListOption/110',onSelect: function(rec){
			$('stylenumName').val(rec.name);}">
        
</div>
<div>
	<div class="div_right">
		<div>
			<table class="easyui-datagrid" id="dyszhz" title="当月收支汇总" data-options="singleSelect:false,collapsible:true,
					pagination:false,rownumbers:true,fitColumns:true">
				<thead>
			        <tr>
			        	<th data-options="field:'',width:150,align:'center'">Income  销售总额</th>
			           	<th data-options="field:'monthxsze',width:150,align:'center'"><span id="monthxsze"></span></th>
			         </tr>
			         <tr>
			        	<th data-options="field:'',width:150,align:'center'">Expenditure 支出</th>
			           	<th data-options="field:'monthzc',width:150,align:'center'"><span id="monthzc"></span></th>
			         </tr>
			         <tr>
			        	<th data-options="field:'',width:150,align:'center'">Profit 盈 利 状 况 </th>
			           	<th data-options="field:'monthylzk',width:150,align:'center'"><span id="monthylzk"></span></th>
			         </tr>
			     </thead>
			  </table>
		</div>
		<div>
			<table class="easyui-datagrid" id="gdyyszb" title="各单元营收占比" data-options="singleSelect:false,collapsible:true,
					pagination:false,rownumbers:true,fitColumns:true">
				<thead>
			        <tr>
			        	<th data-options="field:'',width:150,align:'center'">Alibaba/阿里巴巴</th>
			           	<th data-options="field:'albbzb',width:150,align:'center'"><span id="albbzb2"></span></th>
			         </tr>
			         <tr>
			        	<th data-options="field:'',width:150,align:'center'">Taobao/靓童衣社</th>
			           	<th data-options="field:'jtyszb',width:150,align:'center'"><span id="jtyszb2"></span></th>
			         </tr>
			         <tr>
			        	<th data-options="field:'',width:150,align:'center'">Taobao/潮品壹族</th>
			           	<th data-options="field:'cpyzzb',width:150,align:'center'"><span id="cpyzzb2"></span></th>
			         </tr>
			         <tr>
			        	<th data-options="field:'',width:150,align:'center'">Taobao /  顽皮堂</th>
			           	<th data-options="field:'rptzb',width:150,align:'center'"><span id="rptzb2"></span></th>
			         </tr>
			         <tr>
			        	<th data-options="field:'',width:150,align:'center'">Store   /门店销售</th>
			           	<th data-options="field:'mdxszb',width:150,align:'center'"><span id="mdxszb2"></span></th>
			         </tr>
			     </thead>
			  </table>
		</div>
		<div>
			<table class="easyui-datagrid" id="txzczb" title="各项支出占比" data-options="singleSelect:false,collapsible:true,
					pagination:false,rownumbers:true,fitColumns:true">
				<thead>
			        <tr>
			        	<th data-options="field:'',width:150,align:'center'">线下拿货</th>
			           	<th data-options="field:'xxnhzb',width:150,align:'center'"><span id="xxnhzb2"></span></th>
			         </tr>
			         <tr>
			        	<th data-options="field:'',width:150,align:'center'">工人工资</th>
			           	<th data-options="field:'grgzzb',width:150,align:'center'"><span id="grgzzb2"></span></th>
			         </tr>
			         <tr>
			        	<th data-options="field:'',width:150,align:'center'">快递运费</th>
			           	<th data-options="field:'kdyfzb',width:150,align:'center'"><span id="kdyfzb2"></span></th>
			         </tr>
			         <tr>
			        	<th data-options="field:'',width:150,align:'center'">系统维护</th>
			           	<th data-options="field:'xtwhzb',width:150,align:'center'"><span id="xtwhzb2"></span></th>
			         </tr>
			         <tr>
			        	<th data-options="field:'',width:150,align:'center'">其他用途</th>
			           	<th data-options="field:'qtytzb',width:150,align:'center'"><span id="qtytzb2"></span></th>
			         </tr>
			         <tr>
			        	<th data-options="field:'',width:150,align:'center'">加工厂货款</th>
			           	<th data-options="field:'jgchkzb',width:150,align:'center'"><span id="jgchkzb2"></span></th>
			         </tr>
			         <tr>
			        	<th data-options="field:'',width:150,align:'center'">lk拿货</th>
			           	<th data-options="field:'lknhzb',width:150,align:'center'"><span id="lknhzb2"></span></th>
			         </tr>
			         <tr>
			        	<th data-options="field:'',width:150,align:'center'">lk拿货其他</th>
			           	<th data-options="field:'lkqtzb',width:150,align:'center'"><span id="lkqtzb2"></span></th>
			         </tr>
			     </thead>
			  </table>
		</div>
	</div>
	<div id="danweiyingshou" class="div_right"></div>
	<div id="gexiangzhichu" class="div_right"></div>
</div>

<div class="div_left">
<table class="easyui-datagrid" id="tjlb" title="统计列表" data-options="singleSelect:false,collapsible:true,
		pagination:false,rownumbers:true,fitColumns:true">
	<thead>
        <tr>
        	<th data-options="field:'',width:100,align:'center'"></th>
           	<th data-options="field:'',width:100,align:'center'">阿里巴巴</th>
           	<th data-options="field:'',width:100,align:'center'">靓童衣社</th>
           	<th data-options="field:'',width:100,align:'center'">潮品壹族</th>
           	<th data-options="field:'',width:100,align:'center'">顽皮堂</th>
           	<th data-options="field:'',width:100,align:'center'">门店销售</th>
           	<th data-options="field:'',width:100,align:'center'">线下拿货</th>
           	<th data-options="field:'',width:100,align:'center'">工人工资</th>
           	<th data-options="field:'',width:100,align:'center'">快递费用</th>
           	<th data-options="field:'',width:100,align:'center'">系统维护</th>
           	<th data-options="field:'',width:100,align:'center'">其他用途</th>
           	<th data-options="field:'',width:100,align:'center'">加工厂货款</th>
           	<th data-options="field:'',width:100,align:'center'">lk拿货</th>
           	<th data-options="field:'',width:100,align:'center'">lk其他</th>
           	<th data-options="field:'',width:100,align:'center'">卖货总数</th>
        </tr>
        <tr>
    		<th data-options="field:'',width:100,align:'center'"><span id="month"></span>月份</th>
    		<th data-options="field:'albbSum',width:100,align:'center'"><span  id="albbSum" ></span></th>
    		<th id="jtysSum" data-options="field:'jtysSum',width:100,align:'center'"><span  id="jtysSum" ></span></th>
    		<th id="cpyzSum" data-options="field:'cpyzSum',width:100,align:'center'"><span  id="cpyzSum" ></span></th>
    		<th id="rptSum" data-options="field:'rptSum',width:100,align:'center'"><span  id="rptSum" ></span></th>
    		<th id="mdxsSum" data-options="field:'mdxsSum',width:100,align:'center'"><span  id="mdxsSum" ></span></th>
    		<th id="xxnhSum" data-options="field:'xxnhSum',width:100,align:'center'"><span  id="xxnhSum" ></span></th>
    		<th id="grgzSum" data-options="field:'xjlySum',width:100,align:'center'"><span  id="grgzSum" ></span></th>
    		<th id="kdyfSum" data-options="field:'kdyfSum',width:100,align:'center'"><span  id="kdyfSum" ></span></th>
    		<th id="xtwhSum" data-options="field:'xtwhSum',width:100,align:'center'"><span  id="xtwhSum" ></span></th>
    		<th id="qtytSum" data-options="field:'qtytSum',width:100,align:'center'"><span  id="qtytSum" ></span></th>
    		<th id="jgchkSum" data-options="field:'jgchkSum',width:100,align:'center'"><span  id="jgchkSum" ></span></th>
    		<th id="lknhSum" data-options="field:'lknhSum',width:100,align:'center'"><span  id="lknhSum" ></span></th>
    		<th id="lkqtSum" data-options="field:'lkqtSum',width:100,align:'center'"><span  id="lkqtSum" ></span></th>
    		<th id="listSum" rowspan="3" data-options="field:'listSum',width:100,align:'center'"><span id="listSum" ></span></th>
    	</tr>
        <tr>
    		<th>合计</th>
    		<th id="listSum1" colspan="5" align="center"><span id="listSum1"></span></th>
    		<th id="listSum2" colspan="8" align="center"><span id="listSum2"></span></th>
    	</tr>
    	<tr>
    		<th data-options="field:'',width:100,align:'center'">占比</th>
    		<th data-options="field:'albbzb',width:100,align:'center'"><span id="albbzb1"></span></th>
    		<th data-options="field:'jtyszb',width:100,align:'center'"><span id="jtyszb1"></span></th>
    		<th data-options="field:'cpyzzb',width:100,align:'center'"><span id="cpyzzb1"></span></th>
    		<th data-options="field:'rptzb',width:100,align:'center'"><span id="rptzb1"></span></th>
    		<th data-options="field:'mdxszb',width:100,align:'center'"><span id="mdxszb1"></span></th>
    		<th data-options="field:'xxnhzb',width:100,align:'center'"><span id="xxnhzb1"></span></th>
    		<th data-options="field:'grgzzb',width:100,align:'center'"><span id="grgzzb1"></span></th>
    		<th data-options="field:'kdyfzb',width:100,align:'center'"><span id="kdyfzb1"></span></th>
    		<th data-options="field:'xtwhzb',width:100,align:'center'"><span id="xtwhzb1"></span></th>
    		<th data-options="field:'qtytzb',width:100,align:'center'"><span id="qtytzb1"></span></th>
    		<th data-options="field:'jgchkzb',width:100,align:'center'"><span id="jgchkzb1"></span></th>
    		<th data-options="field:'lknhzb',width:100,align:'center'"><span id="lknhzb1"></span></th>
    		<th data-options="field:'lkqtzb',width:100,align:'center'"><span id="lkqtzb1"></span></th>
    	</tr>
    </thead>
</table>
</div>

 
<script>

var danwei = echarts.init(document.getElementById('danweiyingshou'));
var gexiang = echarts.init(document.getElementById('gexiangzhichu'));
var albb,jtys,cpyz,rwt,mdxs;
var xxnh,grgz,kdyf,xtwh,qtyt,jgchk,lknh,lkqt;


$(function(){
	debugger;
	$("#queryName").combobox({
		onSelect:function(record){
			var qn=$("#queryName").combobox('getText');
			doSearch_process(qn,qn);
			
		}
	})
})

var option1 = {
	    title: {
	         text: '各单位营收报表'
	     },
	     tooltip: {},
	     legend: {
	         data:['']
	     },
	     xAxis: {
            data : ['阿里巴巴','靓童衣社','潮品壹族','顽皮堂','门店销售']
            },
	     yAxis: {},
	     series: [{
	         name: '总数',
	         type: 'bar',
	         data: [albb, jtys, cpyz, rwt, mdxs]
	     }]
};

var option2 = {
	    title: {
	         text: '各项支出报表'
	     },
	     tooltip: {},
	     legend: {
	         data:['']
	     },
	     xAxis: {
            data : ['线下拿货','工人工资','快递费用','系统维护','其他用途','加工厂货款','lk拿货','lk其他']
            },
	     yAxis: {},
	     series: [{
	         name: '总数',
	         type: 'bar',
	         data: [xxnh, grgz, kdyf , xtwh, qtyt, jgchk, lknh, lkqt]
	     }]
};

danwei.setOption(option1);
gexiang.setOption(option2);


function doSearch_process(value,name){ //用户输入用户名,点击搜素,触发此函数  
debugger;
	if(value != null || value != ''){
		$("#albbSum").text("");$("#jtysSum").text("");$("#cpyzSum").text("");
     	$("#rptSum").text("");$("#mdxsSum").text("");$("#xxnhSum").text("");
     	$("#grgzSum").text("");$("#kdyfSum").text("");$("#xtwhSum").text("");
     	$("#qtytSum").text("");$("#jgchkSum").text("");$("#lknhSum").text("");
     	$("#lkqtSum").text("");$("#listSum1").text("");$("#listSum2").text("");
        $("#listSum").text("");$("#monthxsze").text("");$("#monthzc").text("");
        $("#monthylzk").text("");$("#albbzb1").text("");$("#jtyszb1").text("");
        $("#cpyzzb1").text("");$("#rptzb1").text("");$("#mdxszb1").text("");
        $("#xxnhzb1").text("");$("#grgzzb1").text(""); $("#kdyfzb1").text("");
        $("#xtwhzb1").text("");$("#qtytzb1").text("");$("#jgchkzb1").text("");
        $("#lknhzb1").text("");$("#lkqtzb1").text("");$("#albbzb2").text("");
        $("#jtyszb2").text("");$("#cpyzzb2").text("");$("#rptzb2").text("");
        $("#mdxszb2").text("");$("#xxnhzb2").text(""); $("#grgzzb2").text("");
        $("#kdyfzb2").text("");$("#xtwhzb2").text("");$("#qtytzb2").text("");
        $("#jgchkzb2").text("");$("#lknhzb2").text("");$("#lkqtzb2").text("");
		$.ajax({
             url: "process/list?month="+value,  
             type: "get",
             dataType: "json",
             contentType: "application/json",
             traditional: true,
             success: function (data) {
            	albb=data[0].albbSum;jtys=data[0].jtysSum;cpyz=data[0].cpyzSum;rwt=data[0].rptSum;mdxs=data[0].mdxsSum;
				xxnh=data[0].xxnhSum;grgz=data[0].grgzSum;kdyf=data[0].kdyfSum;xtwh=data[0].xtwhSum;qtyt=data[0].qtytSum;jgchk=data[0].jgchkSum;lknh=data[0].lknhSum;lkqt=data[0].lkqtSum; 
             	danwei.setOption({
             		series: [{
				         name: '总数',
				         type: 'bar',
				         data: [albb, jtys, cpyz, rwt, mdxs]
				     }]
             	});
             	gexiang.setOption({
             		series: [{
				         name: '总数',
				         type: 'bar',
				         data: [xxnh, grgz, kdyf , xtwh, qtyt, jgchk, lknh, lkqt]
				     }]
             	});
             	
             	$("#month").text(data[0].month);
             	$("#albbSum").text("¥"+data[0].albbSum);
             	$("#jtysSum").text("¥"+data[0].jtysSum);
             	$("#cpyzSum").text("¥"+data[0].cpyzSum);
             	$("#rptSum").text("¥"+data[0].rptSum);
             	$("#mdxsSum").text("¥"+data[0].mdxsSum);
             	$("#xxnhSum").text("¥"+data[0].xxnhSum);
             	$("#grgzSum").text("¥"+data[0].grgzSum);
             	$("#kdyfSum").text("¥"+data[0].kdyfSum);
             	$("#xtwhSum").text("¥"+data[0].xtwhSum);
             	$("#qtytSum").text("¥"+data[0].qtytSum);
             	$("#jgchkSum").text("¥"+data[0].jgchkSum);
             	$("#lknhSum").text("¥"+data[0].lknhSum);
             	$("#lkqtSum").text("¥"+data[0].lkqtSum);
             	$("#listSum1").append("¥"+data[0].listSum1); 
                $("#listSum2").append("¥"+data[0].listSum2);
                $("#listSum").append("¥"+data[0].listSum);
                
                $("#monthxsze").append("¥"+data[0].monthxsze);
                $("#monthzc").append("¥"+data[0].monthzc);
                $("#monthylzk").append("¥"+data[0].monthylzk);
                
                $("#albbzb1").append(data[0].albbzb);
                $("#jtyszb1").append(data[0].jtyszb);
                $("#cpyzzb1").append(data[0].cpyzzb);
                $("#rptzb1").append(data[0].rptzb);
                $("#mdxszb1").append(data[0].mdxszb);
                $("#xxnhzb1").append(data[0].xxnhzb);
                $("#grgzzb1").append(data[0].grgzzb);
                $("#kdyfzb1").append(data[0].kdyfzb);
                $("#xtwhzb1").append(data[0].xtwhzb);
                $("#qtytzb1").append(data[0].qtytzb);
                $("#jgchkzb1").append(data[0].jgchkzb);
                $("#lknhzb1").append(data[0].lknhzb);
                $("#lkqtzb1").append(data[0].lkqtzb);
                
                $("#albbzb2").append(data[0].albbzb);
                $("#jtyszb2").append(data[0].jtyszb);
                $("#cpyzzb2").append(data[0].cpyzzb);
                $("#rptzb2").append(data[0].rptzb);
                $("#mdxszb2").append(data[0].mdxszb);
                $("#xxnhzb2").append(data[0].xxnhzb);
                $("#grgzzb2").append(data[0].grgzzb);
                $("#kdyfzb2").append(data[0].kdyfzb);
                $("#xtwhzb2").append(data[0].xtwhzb);
                $("#qtytzb2").append(data[0].qtytzb);
                $("#jgchkzb2").append(data[0].jgchkzb);
                $("#lknhzb2").append(data[0].lknhzb);
                $("#lkqtzb2").append(data[0].lkqtzb);
                
             },
             error: function (msg) {
                 alert("未查询到数据，请更换月份查询！");
             }
         });
	}
}


</script>