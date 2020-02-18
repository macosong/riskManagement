//全选
function selectAll(e){
	if($(e).prop("checked") == true){
		$('input[name="selected"]').prop("checked", true);
	}else{
		$('input[name="selected"]').prop("checked", false);
	}
}

//检查是不是全选
function checkAll(){
	if($('input[name="selected"]').length==$('input[name="selected"]:checked').length){
		$('input[name="selectAll"]').prop("checked", true);
	}else{
		$('input[name="selectAll"]').prop("checked", false);
	}
}

function submitList(e){
	var is_exist = e.indexOf("setReaded.action");
	if (is_exist == -1) {
		var flag = window.confirm("你确定要删除所选数据吗?");
		if (flag) {
			var messageId = [];
			$('input[name="selected"]:checked').each(function(i){
				messageId.push($(this).parent().parent().find('td').eq(1).text());
			});
			window.location.href = "" + e + "?messageId=" + messageId;
		}	
	} else {
		var recvmessage = "";
		$('input[name="selected"]:checked').each(function(i){
			recvmessage = recvmessage + $(this).parent().parent().find('td').eq(6).text() + ";";
		});
		$.ajax({
			type: 'POST',
			url: e,
			data: {recvmessage:recvmessage},
			dataType: "text",
			async:false,
			success : function(data) {
				window.location.href = "http://localhost:8080/OA_yujuan/MessageUnchecked.jsp";
			},
			error:function(){
				console.log("出错啦！");
			}
	})	
}
}

//补齐表格空列
$(document).ready(function(e){
	while ($('tr').length<10)
	{
		$('tr').last().after('<tr><th>&nbsp;</th><th></th><th></th><th></th></tr>');
	}
});
