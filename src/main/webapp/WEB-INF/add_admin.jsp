<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>添加管理员账号</title>
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
   function backToAdd(){
       window.location.href="add_admin"
 }

   
    $(document).ready(function(){
    	//一行代码搞定，提交表单的时候会自动触发验证程序
    	$('#add_admin_form').Validform({
    		tiptype:function(msg,o,cssctl){
    		   
    		},
    		ajaxPost:true,	
    		callback:function(data){
    			backToAdd();
    		}
    		
    	});
    	
    	
    });
    </script>
</head>
<body class="demo-1"
      style="background: linear-gradient(120deg, #84fab0, #8fd3f4);">
<!--左侧边栏-->
<div class="container" style="padding-top: 15%;padding-right: 800px;padding-left: 0px;border-left-style: solid;border-left-width: 0px;margin-left: 50px;">

    <div class="col-md-12 col-md-offset-0">
        <ul class="list-group">

            <a href="admin_index">
                <li class="list-group-item" style="color: #1b81ea;height: 50px;text-align: center" >匹配审查</li>
            </a>
            <a href="a_view_blacklist">
                <li class="list-group-item" style="color: #1b81ea;height: 50px;text-align: center">查看黑名单</li>
            </a>

            <a href="view_standard">
                <li class="list-group-item" style="color: #1b81ea;height: 50px;text-align: center">查看标准词库</li>
            </a>
            <a href="view_simulation">
                <li class="list-group-item  " style="color: #1b81ea;height: 50px;text-align: center">查看模拟词库</li>
            </a>
            <a href="view_unmatch">
                <li class="list-group-item" style="color: #1b81ea;height: 50px;text-align: center">查看不匹配企业</li>
            </a>
            <a href="view_false_enter">
                <li class="list-group-item " style="color: #1b81ea;height: 50px;text-align: center">查看虚开企业</li>
            </a>
            <a href="view_false_team">
                <li class="list-group-item" style="color: #1b81ea;height: 50px;text-align: center">查看虚开团伙</li>
            </a>
            <a href="add_admin">
                <li class="list-group-item   active" style="height: 50px;text-align: center">添加管理员</li>
            </a>

        </ul>
    </div>
    <!--左侧边栏结束-->

    <!--右侧信息-->
    <div class="container" style="padding-top: 0px;padding-right: 7px;padding-left: 150px;border-left-style: solid;border-left-width: 0px;margin-left: 50px;">

        <form class="form-horizontal" id="add_admin_form"
              action="add_admin.action" >
            <h3 class="form-title" >添加管理员账号</h3>

            <table border="0">
                <tr>
                    <td style="width: 700px">
                        <div class="form-group">
                            <label class="col-md-offset-0 col-xs-4 control-label float-left">用户名</label>
                            <div class="col-md-4 ">
                                <input name="adminName" id="adminName" class="form-control" placeholder="登录用户名"  type="text">
                            </div>
                        </div>
                    </td>

                </tr>
                <tr>
                    <td style="width: 700px">
                        <div class="form-group" >
                            <label class="col-md-offset-0 col-xs-4 control-label float-left">密码</label>
                            <div class="col-md-4 ">
                                <input name="adminPass" id="adminPass" class="form-control" placeholder="密码"  type="text">
                            </div>
                        </div>
                    </td>

                </tr>


            </table>
            <div class="form-group">
                <button class="btn btn-default btn-lg col-md-2 col-md-offset-4" id="btn_admin_register"  type="submit">添加</button>
            </div>


        </form>
    </div>

    <!--右侧信息结束-->



</div>

</body>
</html>