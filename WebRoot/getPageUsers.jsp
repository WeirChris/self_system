<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>联系人</title>
<!-- 1    jQuery的js包 -->
<script type="text/javascript" src="jquery-easyui-1.5.4.5/jquery.min.js" charset="UTF-8"></script>

<!-- 2    css资源 -->
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.5.4.5/themes/default/easyui.css" charset="UTF-8">

<!-- 3    图标资源 -->
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.5.4.5/themes/icon.css" charset="UTF-8"> 

<!-- 4    EasyUI的js包 -->
<script type="text/javascript" src="jquery-easyui-1.5.4.5/jquery.easyui.min.js" charset="UTF-8"></script>
 
<!-- 5    本地语言 -->
<script type="text/javascript" src="jquery-easyui-1.5.4.5/locale/easyui-lang-zh_CN.js" charset="UTF-8"></script>

</head>
<body>
<script type="text/javascript" charset="UTF-8">
$(function(){
    
    $("#dg").datagrid({
        url:'<c:url value = "/users/getPageUsers"></c:url>' ,
        idField:'pNumber',
        columns:[[    
                  {field:'id',title:'id',width:100,align:'center'},    
                  {field:'firstname',title:'姓',width:100,align:'center'},    
                  {field:'lastname',title:'名',width:100,align:'right',align:'center'},   
                  {field:'phone',title:'电话',width:100,align:'right',align:'center'},
                  {field:'email',title:'email',width:100,align:'right',align:'center'}
              ]],
		pagination:true,//分页
		fitColumns:true,//列自适应宽度
		rownumbers:true,//显示行号
		striped:true,//斑马线
		singleSelect:true,//是否单选
    	
		pageSize: 5, 
        pageList: [5, 10, 50, 100]
    }) ;
    
    var p = $("#dg").datagrid("getPager"); 
    $(p).pagination({ 
	    /* pageSize: 5,//每页显示的记录条数，默认为10 
	    pageList: [2,5,20],//可以设置每页记录条数的列表  */
	    beforePageText: '这是第',//页数文本框前显示的汉字 
	    pageNumber: 1, 
	    afterPageText: '页 共 {pages} 页', 
	    displayMsg: '当前显示 {from} - {to} 条记录 共 {total} 条记录', 
	    onBeforeRefresh:function(){ 
		    $(this).pagination('loading'); 
		    alert('before refresh'); 
		    $(this).pagination('loaded'); 
		    } 
    });
})
</script>
<table id="dg"></table> 
</body>
</html>