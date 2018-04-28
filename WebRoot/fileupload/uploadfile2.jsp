<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>上传文件的页面</title>
<!-- 1    jQuery的js包 -->
<script type="text/javascript" src="../jquery-easyui-1.5.4.5/jquery.min.js" charset="UTF-8"></script>

<!-- 2    css资源 -->
<link rel="stylesheet" type="text/css" href="../jquery-easyui-1.5.4.5/themes/default/easyui.css" charset="UTF-8">

<!-- 3    图标资源 -->
<link rel="stylesheet" type="text/css" href="../jquery-easyui-1.5.4.5/themes/icon.css" charset="UTF-8"> 

<!-- 4    EasyUI的js包 -->
<script type="text/javascript" src="../jquery-easyui-1.5.4.5/jquery.easyui.min.js" charset="UTF-8"></script>
 
<!-- 5    本地语言 -->
<script type="text/javascript" src="../jquery-easyui-1.5.4.5/locale/easyui-lang-zh_CN.js" charset="UTF-8"></script>

<script type="text/javascript" src="../jquery-easyui-1.5.4.5/ajaxfileupload.js" charset="UTF-8"></script>

		
		<script type="text/javascript">
		$(function(){
			$('#UploadDiv').show();
			$('#UploadDiv').dialog({
				title:'文件上传',
				width:400,
				height:150,
				modal:true,
				buttons:[{
				    		text:'上传',
				    		handler:function(){
				    			if ($("#file").val()) {
									$.ajaxFileUpload({
										url:'<c:url value="/fuc/importExcel.htm"/>',
										secureuri:false,
										fileElementId:'file',
										dataType: 'text',
										success:function(data,status){
											/* alert(data);
											alert(status);
											alert(data.msg); */
											//if (callback) callback.call(this, data);
											alert(data);
										}
									});
								} else {
									$.messager.alert("系统提示", "请选择要导入的Excel文件", "error");
								}
				    		}
				        } ,
				        {
				        	text:'取消',
				        	handler:function(){
				        		$('#UploadDiv').dialog('close');
				        	}
				        }
					]
			});
		});
		</script>
	</head>
	
	<body>
		<div id="UploadDiv" style="padding:10px; display: none; overflow:hidden;">
			<form name="importXml"  action="${ctx }/upload.do" method="post" enctype="multipart/form-data">  
				<input type="file" name="file" id="file" />
			</form>
		</div>
	
		<%-- <form action="${pageContext.request.contextPath }/users/fileUploadAction" method="post" enctype="multipart/form-data">
		    文件名：<input type="text" name="filename"/><br/>
		    文件：<input type="file" name="file1"/><br/>
		         <input type="submit" value="上传文件">
		</form> --%>
		
		<%-- <div>
			<a href="${pageContext.request.contextPath }/users/down_list">文件下载</a>
		</div> --%>
		
	</body>
</html>