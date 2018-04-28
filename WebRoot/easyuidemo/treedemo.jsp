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

<!-- 4    EasyUI的js包 -->
<script type="text/javascript" src="../jquery-easyui-1.5.4.5/jquery.easyui.min.js" charset="UTF-8"></script>
 
<!-- 5    本地语言 -->
<script type="text/javascript" src="../jquery-easyui-1.5.4.5/locale/easyui-lang-zh_CN.js" charset="UTF-8"></script>

<script type="text/javascript">
	
</script>
<!-- 6    针对此jsp的js文件 -->
<script type="text/javascript" src="curddemo.js" charset="UTF-8"></script>

</head>
<body>
	<ul id="tt" class="easyui-tree" data-options="
		data:[{text:'Item1',state:'closed',children:[{text: 'Item11'},{text: 'Item12'}]},{text: 'Item2'}],
		animate:true,
		lines:true,
		formatter:function(node){return node.text;}
	">
	    <!-- <li>
			<span>Folder</span>
			<ul>
				<li>
					<span>Sub Folder 1</span>
					<ul>
						<li><span><a href="#">File 11</a></span></li>
						<li><span>File 12</span></li>
						<li><span>File 13</span></li>
					</ul>
				</li>
				<li><span>File 2</span></li>
				<li><span>File 3</span></li>
			</ul>
		</li>
	    <li><span>File21</span></li> -->
	</ul>
</body>
</html>