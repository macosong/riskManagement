<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" charset="width=device-width, initial-scale=1" user-scalable="no";>
	
	<link href="/OA_yujuan/cloud_oa/js/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="/OA_yujuan/cloud_oa/js/jquery.js"></script>
	<script type="text/javascript" src="/OA_yujuan/cloud_oa/js/bootstrap/js/bootstrap.js"></script>
	<script type="text/javascript" src="/OA_yujuan/cloud_oa/js/layer/layer.js"></script>
	<script type="text/javascript" src="/OA_yujuan/cloud_oa/js/Validform/js/Validform_v5.3.2.js"></script>
	<link rel="stylesheet" type="text/css" href="/OA_yujuan/cloud_oa/css/common.css">
	<link rel="stylesheet" type="text/css" href="/OA_yujuan/cloud_oa/css/style-bar.css">
	<link href="/OA_yujuan/cloud_oa/css/style.css" rel="stylesheet" type="text/css">
	<link href="/OA_yujuan/cloud_oa/css/sb-admin.css" rel="stylesheet">
	<script type="text/javascript">
		function add() {
			var title = $('#noticeTopic').val();
			var message = $('#deptInformation').val();
			

			 window.location.href='/OA_yujuan/addNotice.action?title='+title+'&message='+message;
			 parent.location.reload();//刷新父窗口
				
				parent.layer.close(index);//关闭当前层
			//$.post("/OA_yujuan/addNotice.action", {
			//	"title": title,
				//"message": message
			//})
		}
		
	</script>
</head>	
<body>
<div class="modal-body">
	<div id="deptForm" class="form-horizontal">
		<div class="form-group"> 
	        <div class="col-sm-6">
	        	<input type="hidden" datatype="*" name="deptId" id="deptId" class="form-control">               
	        </div>
	    </div>
	 
	    <div id="deptNameDiv" class="form-group">
	        <label class="col-sm-4 control-label">Notice Topic</label>
	        <div class="col-sm-6">
	        	<input datatype="*" type="text" name="title" id="noticeTopic" class="form-control" placeholder="notice topic">              
	        </div>
	    </div>
	    
	    <div class="form-group">
	        <label class="col-sm-4 control-label">Notice Content</label>
	        <div class="col-sm-6">
	        	<textarea ignore="ignore" type="text" name="message" id="deptInformation" class="form-control" placeholder="topic content"></textarea>              
	        </div>
	    </div>
	
	    <div id="addBtn" class="form-group">
	    	<div class="col-sm-2 col-sm-offset-8">	
	    		<button id="deptAdd" class="btn btn-primary btn-block" onclick="javascript:add()">Add</button> 		            		
	        </div>
	    </div>
	   
	</div>  
</div>


</body>
</html>