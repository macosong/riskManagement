<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>编辑模拟词条</title>
    <script src="/tax_risk/js/jquery.js"></script>
    <link
            href="/css/bootstrap.min.css"
            rel="stylesheet">
    <link
            href="/tax_risk/css/font-awesome/css/font-awesome.min.css"
            rel="stylesheet">
    <script
            src="/js/bootstrap.min.js"></script>
    <script type="text/javascript"
            src="/tax_risk/js/Validform/js/Validform_v5.3.2.js"></script>
    <link rel="stylesheet" href="/tax_risk/css/style.css">
    <link rel="stylesheet" type="text/css" href="/css/base.css" />
    <script  type="text/javascript">

    $(document).ready(function(){
    	//一行代码搞定，提交表单的时候会自动触发验证程序
    	$('#edit_simulation_form').Validform({
    		tiptype:function(msg,o,cssctl){
    		   
    		},
    		ajaxPost:true,	
    		callback:function(data){
    			parent.layer.msg('添加成功');
    			
    			parent.location.reload();//刷新父窗口
    			
    			parent.layer.close(index);//关闭当前层
    		}
    		
    	});
    	
    	
    });
    </script>
</head>
<body class="demo-1"
      style="background: linear-gradient(120deg, #84fab0, #8fd3f4);">

<div>

    <div class="container" style="padding-top: 9%;">


        <form class="form-horizontal" id="edit_simulation_form"
              action="edit_simulation.action" >
            <h3 class="form-title" >修改模拟词条</h3>
<div class="form-group" >
               <input id="simulationId" name="simulationId" class="form-control" type="hidden">
               <script>
                var simulationId = $(window.parent.document).find('#simulationId').val();
                document.getElementById("simulationId").value=simulationId;
               </script>
               </div>
           
                        <div class="form-group" >
                            <label class="col-sm-2 control-label float-left">名称</label>
                            <div class="col-sm-4 ">
                                <input name="simulationName" id="simulationName" class="form-control"  type="text">
                            </div>
                             <script>
                var simulationName = $(window.parent.document).find('#simulationName').val();
                document.getElementById("simulationName").value=simulationName;
               </script>
                        </div>
                  <div class="form-group">
                               <br>
                         
                               </div>
            <!--隐藏一个审核标志，设置为1！！！-->
            <div class="form-group">
                <button class="btn btn-default btn-lg col-sm-4 col-sm-offset-4" id="btn_edit_simulation"  type="submit">修改</button>
            </div>


        </form>


    </div>

</div>

</body>


</html>