function newItem(){
	$('#dg').datagrid('appendRow',{isNewRecord:true});
	var index = $('#dg').datagrid('getRows').length - 1;
	$('#dg').datagrid('expandRow', index);
	$('#dg').datagrid('selectRow', index);
}

function destroyItem(url){
	var row = $('#dg').datagrid('getSelected');
	if (row){
		//alert(JSON.stringify(row));	{"id":36,"phone":"123","email":"12","lastname":"bady","firstname":"bady"}
		$.messager.confirm('Confirm','Are you sure you want to remove this user?',function(r){
			if (r){
				var index = $('#dg').datagrid('getRowIndex',row);
				$.post(url,{'id':row.id},function(){
					$('#dg').datagrid('deleteRow',index);
				});
			}
		});
	}
}

function saveItem(index){
	var url;
	var row = $('#dg').datagrid('getRows')[index];
	if (row.isNewRecord){
		url = inserturl;
	} else {
		url = editurl+'?id='+row.id;
	}
	
	$('#dg').datagrid('getRowDetail',index).find('form').form('submit',{
		url: url,
		onSubmit: function(){
			return $(this).form('validate');
		},
		success: function(data){
			data = eval('('+data+')');
			data.isNewRecord = false;
			$('#dg').datagrid('collapseRow',index);
			$('#dg').datagrid('updateRow',{
				index: index,
				row: data
			});
		}
	});
}

function cancelItem(index){
	var row = $('#dg').datagrid('getRows')[index];
	if (row.isNewRecord){
		$('#dg').datagrid('deleteRow',index);
	} else {
		$('#dg').datagrid('collapseRow',index);			//	折叠一行。修改的不会保存
	}
}