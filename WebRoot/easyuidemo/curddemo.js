var url 

function newUser(){
	//alert("demo")
	$('#dlg').dialog('open').dialog('setTitle','New User');
	$('#fm').form('clear');
	url = inserturl;
}


function saveUser(){
	$('#fm').form('submit',{
		url: url,
		onSubmit: function(){
			return $(this).form('validate');
		},
		success: function(result){
			//alert(result);
			var result = eval('('+result+')');
			if (result.success){
				$('#dlg').dialog('close');		// close the dialog
				$('#dg').datagrid('reload');	// reload the user data
			} else {
				$.messager.show({
					title: 'Error',
					msg: result.msg
				});
			}
		}
	});
}

function editUser(){
	//alert("edit");
	var row = $('#dg').datagrid('getSelected');
	//alert(row.id)
	if (row){
		$('#dlg').dialog('open').dialog('setTitle','Edit User');
		$('#fm').form('load',{
			'insertUserVo.firstname': 	row.firstname,
			'insertUserVo.lastname' : 	row.lastname,
			'insertUserVo.phone'    :	row.phone,
			'insertUserVo.email'    :	row.email
		});
		url = editurl+"?insertUserVo.id="+row.id;
	}
}
	
function destroyUser(){
    var row = $('#dg').datagrid('getSelected');
    
    if (row){
    	url = removeurl;
        $.messager.confirm('Confirm','Are you sure you want to destroy this user?',function(r){	//$.messager是easyui的确认信息的弹框
            if (r){
                $.post(url,{'insertUserVo.id':row.id},function(result){		//jquery的post请求
                    if (result.success){
                    	$('#dlg').dialog('close');		// close the dialog
                        $('#dg').datagrid('reload');    // reload the user data
                    } else {
                        $.messager.show({    // show error message
                            title: 'Error',
                            msg: result.errorMsg
                        });
                    }
                },'json');
            }
        });
    }
}