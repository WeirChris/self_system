<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CURD demo</title>
<!-- 1    jQuery的js包 -->
<script type="text/javascript" src="../jquery-easyui-1.5.4.5/jquery.min.js" charset="UTF-8"></script>

<!-- 2    css资源 -->
<link rel="stylesheet" type="text/css" href="../jquery-easyui-1.5.4.5/themes/default/easyui.css" charset="UTF-8">

<!-- 3    图标资源 -->
<link rel="stylesheet" type="text/css" href="../jquery-easyui-1.5.4.5/themes/icon.css" charset="UTF-8"> 

<style type="text/css">
		#fm{
			margin:0;
			padding:10px 30px;
		}
		.ftitle{
			font-size:14px;
			font-weight:bold;
			color:#666;
			padding:5px 0;
			margin-bottom:10px;
			border-bottom:1px solid #ccc;
		}
		.fitem{
			margin-bottom:5px;
		}
		.fitem label{
			display:inline-block;
			width:80px;
		}
	</style>

<!-- 4    EasyUI的js包 -->
<script type="text/javascript" src="../jquery-easyui-1.5.4.5/jquery.easyui.min.js" charset="UTF-8"></script>
 
<!-- 5    本地语言 -->
<script type="text/javascript" src="../jquery-easyui-1.5.4.5/locale/easyui-lang-zh_CN.js" charset="UTF-8"></script>

<script type="text/javascript">
	var inserturl = '<c:url value = "/users/insertUser.do"></c:url>';
	var editurl = '<c:url value = "/users/editUser.do"></c:url>';
	var removeurl = '<c:url value = "/users/removeUser.do"></c:url>';
/* 	document.write('<c:url value = "/users/getUsers"></c:url>');
	document.write('<br/>')
	document.write(inserturl); */
</script>
<!-- 6    针对此jsp的js文件 -->
<script type="text/javascript" src="curddemo.js" charset="UTF-8"></script>

</head>
<body>
	<table id="dg" title="MyUsers" class="easyui-datagrid" style="width:1350px;height:2500px"
		url='<c:url value = "/users/getUsers.do"></c:url>'
		toolbar='#toolbar'
		rownumbers='true'
		fitColumns='true'
		singleSelect='true'>
		<thead>
	        <tr>
	        	<!-- <th field="id" width="50">ID</th> -->
	            <th field="firstname" width="50">First Name</th>
	            <th field="lastname" width="50">Last Name</th>
	            <th field="phone" width="50">Phone</th>
	            <th field="email" width="50">Email</th>
	        </tr>
	    </thead>
	</table>
	
	<div id="toolbar">
	    <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newUser()">New User</a>
	    <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editUser()">Edit User</a>
	    <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyUser()">Remove User</a>
	</div>
	<!-- <script type="text/javascript">
		document.write('<c:url value = "/users/getUsers"></c:url>')
	</script> -->
	
	<div id="dlg" class="easyui-dialog" style="width:400px;height:280px;padding:10px 20px"
        closed="true" buttons="#dlg-buttons">
    	
    	<div class="ftitle">User Information</div>
	    
	    <form id="fm" method="post">
	        <div class="fitem">
	            <label>First Name:</label>
	            <input name="insertUserVo.firstname" class="easyui-validatebox" required="true">
	        </div>
	        <div class="fitem">
	            <label>Last Name:</label>
	            <input name="insertUserVo.lastname" class="easyui-validatebox" required="true">
	        </div>
	        <div class="fitem">
	            <label>Phone:</label>
	            <input name="insertUserVo.phone">
	        </div>
	        <div class="fitem">
	            <label>Email:</label>
	            <input name="insertUserVo.email" class="easyui-validatebox" validType="email">
	        </div>
	    </form>
	</div>
	<div id="dlg-buttons">
	    <a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveUser()">Save</a>
	    <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">Cancel</a>
	</div>
</body>
</html>