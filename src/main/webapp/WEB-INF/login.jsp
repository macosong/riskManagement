<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>登录</title>
    <script src="./tax_risk/js/jquery.js"></script>
    <link
            href="./css/bootstrap.min.css"
            rel="stylesheet">
    <link
            href="./tax_risk/css/font-awesome/css/font-awesome.min.css"
            rel="stylesheet">
    <script
            src="./js/bootstrap.min.js"></script>
    <script type="text/javascript"
            src="./tax_risk/js/Validform/js/Validform_v5.3.2.js"></script>
    <link rel="stylesheet" href="./tax_risk/css/style.css">
    <link rel="stylesheet" type="text/css" href="css/base.css" />

    <script language="javascript" type="text/javascript">
        function goToRegister() {
        	window.location.href="register.jsp";
          

        }

        function adminLogPage() {
            document.getElementById("enterLog").setAttribute("class","");
            document.getElementById("adminLog").setAttribute("class","active");
            $("#AForm").show();
            $("#EForm").hide();
           

        }

        function enterLogPage() {
            document.getElementById("adminLog").setAttribute("class","");
            document.getElementById("enterLog").setAttribute("class","active");
            $("#EForm").show();
            $("#AForm").hide();

        }
        function goToHome() {
        	document.getElementById("login_form").setAttribute("action","enter_log.action");
        	document.getElementById("personLog").setAttribute("name","taxPayerId");
        	document.getElementById("password").setAttribute("name","enterLogPass");
        	document.getElementById('login_form').submit();
        }
        function goToAHome(){
        	document.getElementById("a_login_form").setAttribute("action","admin_log.action");
        	document.getElementById("personLogName").setAttribute("name","adminName");
        	document.getElementById("adminPassword").setAttribute("name","adminPass");
        	document.getElementById('a_login_form').submit();
        }
    </script>
</head>

<body class="demo-1"
      style="background: linear-gradient(120deg, #84fab0, #8fd3f4);">
<div>

    <div class="container" style="padding-top: 9%">


        <div class="form row">
            <ul class="nav nav-tabs col-md-4 col-md-offset-4">
                <li id="enterLog" role="presentation" class="active"><a style="color: #1b81ea" onclick="enterLogPage()">企业登录</a></li>
                <li id="adminLog" role="presentation" ><a style="color: #1b81ea" onclick="adminLogPage()">管理员登录</a></li>

            </ul>
        </div>
        <div class="form row" id="EForm">
<span
				style="text-align: center; display: block; color: #FF3030; font-size: 15px; font-weight: bold; text-align: center;">${msg}</span>
            <form class="form-horizontal col-md-offset-4" id="login_form" method="post">

                <div class="col-md-6">
                    <div class="form-group">
                        <i class="fa fa-user fa-lg"></i> <input
                            class="form-control required" type="text" placeholder="ID"
                            id="personLog" name="" autofocus="autofocus"
                            datatype="*" errormsg="请输入ID" maxlength="20" />
                    </div>
                    <div class="form-group">
                        <i class="fa fa-lock fa-lg"></i> <input
                            class="form-control required" type="password"
                            placeholder="密码" id="password" name=""
                            datatype="*" errormsg="请输入密码" maxlength="8" />
                    </div>

                    <div class="form-group ">
                       
                    </div>

                </div>
            </form>
            <div class="col-md-4 col-md-offset-4">
             <button class="btn btn-default btn-lg col-sm-6" id="btn_register"  onclick="goToRegister();">注册</button>
             <button class="btn btn-primary btn-lg col-md-6" id="btn_login" type="button" onclick="goToHome();">登录</button>

            </div>
        </div>
        
         <div class="form row" id="AForm" style="display:none;">
<span
				style="text-align: center; display: block; color: #FF3030; font-size: 15px; font-weight: bold; text-align: center;">${msg}</span>
            <form class="form-horizontal col-md-offset-4" id="a_login_form" method="post">

                <div class="col-md-6">
                    <div class="form-group">
                        <i class="fa fa-user fa-lg"></i> <input
                            class="form-control required" type="text" placeholder="姓名"
                            id="personLogName" name="" autofocus="autofocus"
                            datatype="*" errormsg="请输入姓名" maxlength="20" />
                    </div>
                    <div class="form-group">
                        <i class="fa fa-lock fa-lg"></i> <input
                            class="form-control required" type="password"
                            placeholder="密码" id="adminPassword" name=""
                            datatype="*" errormsg="请输入密码" maxlength="8" />
                    </div>

                    <div class="form-group ">
                        <button class="btn btn-primary btn-lg col-md-6" id="btn_login_admin" type="button" onclick="goToAHome();">登录</button>
                    </div>

                </div>
            </form>


        </div>
    </div>

</div>

</body>
</html>