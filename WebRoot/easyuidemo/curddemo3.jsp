<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CURD demo2</title>
<!-- 1    jQuery的js包 -->
<script type="text/javascript" src="../jquery-easyui-1.5.4.5/jquery.min.js" charset="UTF-8"></script>

<!-- 2    css资源 -->
<link rel="stylesheet" type="text/css" href="../jquery-easyui-1.5.4.5/themes/default/easyui.css" charset="UTF-8">

<!-- 3    图标资源 -->
<link rel="stylesheet" type="text/css" href="../jquery-easyui-1.5.4.5/themes/icon.css" charset="UTF-8"> 

<style type="text/css">
		form{
			margin:0;
			padding:0;
		}
		.dv-table td{
			border:0;
		}
		.dv-table input{
			border:1px solid #ccc;
		}
	</style>

<!-- 4    EasyUI的js包 -->
<script type="text/javascript" src="../jquery-easyui-1.5.4.5/jquery.easyui.min.js" charset="UTF-8"></script>
 
<!-- 5    本地语言 -->
<script type="text/javascript" src="../jquery-easyui-1.5.4.5/locale/easyui-lang-zh_CN.js" charset="UTF-8"></script>

<!-- 6    jquery_easyui_edatagrid -->
<script type="text/javascript" src="../jquery-easyui-1.5.4.5/jquery.edatagrid.js"></script>

<!-- 7	datagrid-detailview -->	
<script type="text/javascript" src="../jquery-easyui-1.5.4.5/datagrid-detailview.js"></script>

<!-- 8    针对此jsp的js文件 -->
<script type="text/javascript" src="curddemo3.js" charset="UTF-8"></script>

<script type="text/javascript">
	var inserturl = '<c:url value = "/users/insertUserView.action"></c:url>';
	var editurl = '<c:url value = "/users/editUserView.action"></c:url>';
	var removeurl = '<c:url value = "/users/removeUser"></c:url>';

	$(function(){
		$('#dg').datagrid({
			pagination:true,//分页
			pageSize: 5, 
	        pageList: [5, 10, 50, 100],
		    view: detailview,	//重点
		    detailFormatter:function(index,row){	//返回行明细内容的格式化函数
		    	/* alert(index);
				//JSON.stringify(datas)
				alert(JSON.stringify(row)); */
		        return 	'<div class="ddv">'+
							/**
							*	采用直接返回，无法使用 easyui的样式以及校验
							*/
							/*'编辑信息：'+
		        			'<form method="post">'+
								'<table class="dv-table" style="width:100%;background:#fafafa;padding:5px;margin-top:5px;">'+
									'<tr>'+
										'<td>First Name</td>'+
										'<td><input name="firstname" class="easyui-validatebox" required="true"></input></td>'+
										'<td>Last Name</td>'+
										'<td><input name="lastname" class="easyui-validatebox" required="true"></input></td>'+
									'</tr>'+
									'<tr>'+
										'<td>Phone</td>'+
										'<td><input name="phone"></input></td>'+
										'<td>Email</td>'+
										'<td><input name="email" class="easyui-validatebox" validType="email"></input></td>'+
									'</tr>'+
								'</table>'+
								'<div style="padding:5px 0;text-align:right;padding-right:30px">'+
									'<a href="#" class="easyui-linkbutton" iconCls="icon-save" plain="true" onclick="saveItem('+
											index+
											')">Save</a> '+
									'<a href="#" class="easyui-linkbutton" iconCls="icon-cancel" plain="true" onclick="cancelItem('+
											index+
											')">Cancel</a>'+
								'</div>'+
							'</form>'+ */
						'</div>';
		    },
		    onExpandRow: function(index,row){		//当展开一行时触发。
		    	//alert(JSON.stringify(row))
		        var ddv = $(this).datagrid('getRowDetail',index).find('div.ddv');	//getRowDetail:	获取 行明细 容器。
		        ddv.panel({
		        	border:false,
					cache:true,
					href:'curddemo3form.jsp?index='+index,
					onLoad:function(){
						$('#dg').datagrid('fixDetailRowHeight',index);
						$('#dg').datagrid('selectRow',index);
						$('#dg').datagrid('getRowDetail',index).find('form').form('load',row);
					}
		        });
		        $('#dg').datagrid('fixDetailRowHeight',index);
		    }
		});
	})
	
</script>
</head>
<body>
	<h2>CRUD DataGrid3</h2>
	
	<table id="dg" title="My Users" style="width:550px;height:350px"
        url="<c:url value = "/users/getPageUsers.do"></c:url>"
        toolbar="#toolbar"
        fitColumns="true" singleSelect="true">
    <thead>
        <tr>
            <th field="firstname" width="50">First Name</th>
            <th field="lastname" width="50">Last Name</th>
            <th field="phone" width="50">Phone</th>
            <th field="email" width="50">Email</th>
        </tr>
    </thead>
	</table>
	<div id="toolbar">
	    <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newItem()">New</a>
	    <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyItem('<c:url value = "/users/removeUserdatagrid.action"></c:url>')">Destroy</a>
	</div>

</body>
</html>