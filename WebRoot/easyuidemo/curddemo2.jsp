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
	</style>

<!-- 4    EasyUI的js包 -->
<script type="text/javascript" src="../jquery-easyui-1.5.4.5/jquery.easyui.min.js" charset="UTF-8"></script>
 
<!-- 5    本地语言 -->
<script type="text/javascript" src="../jquery-easyui-1.5.4.5/locale/easyui-lang-zh_CN.js" charset="UTF-8"></script>

<!-- jquery_easyui_edatagrid -->
<script type="text/javascript" src="../jquery-easyui-1.5.4.5/jquery.edatagrid.js"></script>

<script type="text/javascript">
	var inserturl = '<c:url value = "/users/insertUser"></c:url>';
	var editurl = '<c:url value = "/users/editUser"></c:url>';
	var removeurl = '<c:url value = "/users/removeUser"></c:url>';
/* 	document.write('<c:url value = "/users/getUsers"></c:url>');
	document.write('<br/>')
	document.write(inserturl); */
	
	
	$(function(){
		//var row = $('#dg').datagrid('getSelected');
		$('#dg').edatagrid({
			url: '<c:url value = "/users/getUsers.do"></c:url>',
			saveUrl: '<c:url value = "/users/insertUserdatagrid.do"></c:url>',
			updateUrl: '<c:url value = "/users/editUserdatagrid.do"></c:url>',
			destroyUrl: '<c:url value = "/users/removeUserdatagrid.do"></c:url>'
		});
	});
</script>
<!-- 6    针对此jsp的js文件 -->
<!-- 
	<script type="text/javascript" src="curddemo2.js" charset="UTF-8"></script>
 -->
</head>
<body>
	<h2>CRUD DataGrid</h2>
	<div class="demo-info" style="margin-bottom:10px">
		<div class="demo-tip icon-tip">&nbsp;</div>
		<div>Double click the row to begin editing.</div>
	</div>
	
	<table id="dg" title="My Users" style="width:1500px;height:650px"
        toolbar="#toolbar" idField="id"
        rownumbers="true" fitColumns="true" singleSelect="true">
	    <thead>
	        <tr>
	            <th field="firstname" width="50"  editor="{type:'validatebox',options:{required:true}}">First Name</th>
	            <th field="lastname" width="50"  editor="{type:'validatebox',options:{required:true}}">Last Name</th>
	            <th field="phone" width="50"  editor="text">Phone</th>
	            <th field="email" width="50"  editor="{type:'validatebox',options:{validType:'email'}}">Email</th>
	        </tr>
	    </thead>
	</table>
	<div id="toolbar">
	    <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="javascript:$('#dg').edatagrid('addRow')">New</a>
	    <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="javascript:$('#dg').edatagrid('destroyRow')">Destroy</a>
	    <a href="#" class="easyui-linkbutton" iconCls="icon-save" plain="true" onclick="javascript:$('#dg').edatagrid('saveRow')">Save</a>
	    <a href="#" class="easyui-linkbutton" iconCls="icon-undo" plain="true" onclick="javascript:$('#dg').edatagrid('cancelRow')">Cancel</a>
	</div>


</body>
</html>