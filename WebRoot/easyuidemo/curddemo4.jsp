<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>RSS Reader Demo - jQuery EasyUI</title>
<!-- 1    jQuery的js包 -->
<script type="text/javascript" src="../jquery-easyui-1.5.4.5/jquery.min.js" charset="UTF-8"></script>

<!-- 2    css资源 -->
<link rel="stylesheet" type="text/css" href="../jquery-easyui-1.5.4.5/themes/default/easyui.css" charset="UTF-8">

<!-- 3    图标资源 -->
<link rel="stylesheet" type="text/css" href="../jquery-easyui-1.5.4.5/themes/icon.css" charset="UTF-8"> 

<style type="text/css">
		.rtitle{
			font-size:18px;
			font-weight:bold;
			padding:5px 10px;
			background:#336699;
			color:#fff;
		}
		.icon-channels{
			background:url('images/tree_channels.gif') no-repeat;
		}
		.icon-feed{
			background:url('images/rss.png') no-repeat;
		}
		.icon-rss{
			background:url('images/rss.gif') no-repeat;
		}
	</style>

<!-- 4    EasyUI的js包 -->
<script type="text/javascript" src="../jquery-easyui-1.5.4.5/jquery.easyui.min.js" charset="UTF-8"></script>
 
<!-- 5    本地语言 -->
<script type="text/javascript" src="../jquery-easyui-1.5.4.5/locale/easyui-lang-zh_CN.js" charset="UTF-8"></script>

<script type="text/javascript">
$(function(){
	$('#dg').datagrid({
		onSelect: function(index,row){
			$('#cc').attr('src', row.link);
		},
		onLoadSuccess:function(){
			var rows = $(this).datagrid('getRows');
			if (rows.length){
				$(this).datagrid('selectRow',0);
			}
		}
	});
	
	$('#t-channels').tree({
		onSelect: function(node){
			var url = node.attributes.url;
			$('#dg').datagrid('load',{
				url: url
			});
		},
		onLoadSuccess:function(node,data){
			if (data.length){
				var id = data[0].children[0].children[0].id;
				var n = $(this).tree('find', id);
				$(this).tree('select', n.target);
			}
		}
	});
});
</script>
</head>
<body class="easyui-layout">
	<div region="north" border="false" class="rtitle">
		jQuery EasyUI RSS Reader Demo
	</div>
	<div region="west" title="Channels Tree" split="true" border="false" style="width:200px;background:#EAFDFF;">
		<ul id="t-channels" url="data/channels.json"></ul>
	</div>
	<div region="center" border="false">
		<div class="easyui-layout" fit="true">
			<div region="north" split="true" border="false" style="height:200px">
				<table id="dg" 
						url="get_feed.php" border="false" rownumbers="true"
						fit="true" fitColumns="true" singleSelect="true">
					<thead>
						<tr>
							<th field="title" width="100">Title</th>
							<th field="description" width="200">Description</th>
							<th field="pubdate" width="80">Publish Date</th>
						</tr>
					</thead>
				</table>
			</div>
			<div region="center" border="false" style="overflow:hidden">
				<iframe id="cc" scrolling="auto" frameborder="0" style="width:100%;height:100%"></iframe>
			</div>
		</div>
	</div>

</body>
</html>