<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>企业注册</title>
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
     function backToLog(){
	       window.location.href="login"
     }
    
    $(document).ready(function(){
    	//一行代码搞定，提交表单的时候会自动触发验证程序
    	$('#register_form').Validform({
    		tiptype:function(msg,o,cssctl){
    		    
    		},
    		ajaxPost:true,	
    		callback:function(data){
    			backToLog();
    			
    		}
    		
    	});
    	
    	
    });
    </script>
</head>
<body class="demo-1"
      style="background: linear-gradient(120deg, #84fab0, #8fd3f4);">
<div>

    <div class="container" style="padding-top: 9%;">


            <form  id="register_form"
                  action="enter_register.action" >
                <h3 class="form-title" >注册</h3>

                    <!-- <table border="0">
                        <tr>
                            <td style="width: 700px"> -->
                                <div class="form-group">
                                    <label class="col-sm-2 control-label float-left">企业纳税人ID</label>
                                    <div class="col-sm-4 ">
                                        <input name="taxPayerId" id="taxPayerId" class="form-control" placeholder="ID"  type="text">
                                    </div>
                               
                           <!--  </td>
                            <td style="width: 800px"> -->
                               
                                    <label class="col-sm-2 control-label float-left">企业登录密码</label>
                                    <div class="col-sm-4 ">
                                        <input name="enterLog.enterLogPass" id="enterLog.enterLogPass" class="form-control" placeholder="密码"  type="text">
                                    </div>
                                </div>
                                <div class="form-group">
                               <br>
                               <br>
                               </div>
                              
                           <!--  </td>
                        </tr>
                        <tr>
                            <td style="width: 700px"> -->
                                <div class="form-group" >
                                    <label class="col-sm-2 control-label float-left">企业纳税人姓名</label>
                                    <div class="col-sm-4 ">
                                        <input name="taxPayerName" id="taxPayerName" class="form-control" placeholder="姓名"  type="text">
                                    </div>
                               
                            <!-- </td>
                            <td style="width: 800px"> -->
                                
                                    <label class="col-sm-2 control-label float-left">企业地址</label>
                                    <div class="col-sm-4 ">
                                        <input name="enterAddress" id="enterAddress" class="form-control" placeholder="地址"  type="text">
                                    </div>
                                </div>
                                <div class="form-group">
                               <br>
                               <br>
                               </div>
                           <!--  </td>
                        </tr>
                        <tr>
                            <td style="width: 700px"> -->
                                <div class="form-group" >
                                    <label class="col-sm-2 control-label float-left">税务登记日期</label>
                                    <div class="col-sm-4 ">
                                        <input name="taxLogDate" id="taxLogDate" class="form-control" placeholder="1997-05-19"  type="text">
                                    </div>
                               
                          <!--   </td>
                            <td style="width: 800px"> -->
                               
                                    <label class="col-sm-2 control-label float-left">主管税务机构名</label>
                                    <div class="col-sm-4 ">
                                        <input name="taxAuthorityName" id="taxAuthorityName" class="form-control" placeholder="机构名称"  type="text">
                                    </div>
                                </div>
                                <div class="form-group">
                               <br>
                               <br>
                               </div>
                           <!--  </td>
                        </tr>
                        <tr>
                            <td style="width: 700px"> -->
                                <div class="form-group" >
                                    <label class="col-sm-2 control-label float-left">所属行政区</label>
                                    <div class="col-sm-4 ">
                                        <input name="admRegion" id="admRegion" class="form-control" placeholder="行政区"  type="text">
                                    </div>
                               </div>
                               <div class="form-group">
                               <br>
                               <br>
                               </div>
                          <!--   </td>

                        </tr>
                        <tr>
                            <td style="width: 700px"> -->
                               <div class="form-group">
                          
                                    <label class="col-sm-2 control-label float-left">法定代表人ID</label>
                                    <div class="col-sm-4 ">
                                        <input name="legalRepId" id="legalRepId" class="form-control" placeholder="法人ID"  type="text">
                                    </div>
                                
                          <!--   </td>
                            <td style="width: 800px"> -->
                               
                                    <label class="col-sm-2 control-label float-left">法定代表人姓名</label>
                                    <div class="col-sm-4 ">
                                        <input name="legalRepName" id="legalRepName" class="form-control" placeholder="法人姓名"  type="text">
                                    </div>
                                </div>
                                <div class="form-group">
                               <br>
                               <br>
                               </div>
                           <!--  </td>
                        </tr>
                        <tr>
                            <td style="width: 700px"> -->
                                <div class="form-group">
                                    <label class="col-sm-2 control-label float-left">财务负责人ID</label>
                                    <div class="col-sm-4 ">
                                        <input name="finPefinancialPerIdrID" id="financialPerId" class="form-control" placeholder="财务负责人ID"  type="text">
                                    </div>
                           
                          <!--   </td>
                            <td style="width: 800px"> -->
                              
                                    <label class="col-sm-2 control-label float-left">财务负责人姓名</label>
                                    <div class="col-sm-4 ">
                                        <input name="financialPerName" id="financialPerName" class="form-control" placeholder="财务负责人姓名"  type="text">
                                    </div>
                                </div>
                                <div class="form-group">
                               <br>
                               <br>
                               </div>
                           <!--  </td>
                        </tr>

                    </table> -->
                <div class="form-group">
                    <button class="btn btn-default btn-lg col-md-3 col-md-offset-5" id="btn_enter_register"  type="submit">注册</button>
                </div>


            </form>


    </div>

</div>

</body>
</html>