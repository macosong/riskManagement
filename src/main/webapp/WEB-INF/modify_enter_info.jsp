<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>修改企业信息</title>
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
    	$('#enter_info_modify_form').Validform({
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

    <!--右侧信息-->
    <div class="container" style="padding-top: 9%;">

        <form class="form-horizontal" id="enter_info_modify_form"
              action="enter_info_modify.action" >
            <h3 class="form-title" >修改企业信息</h3>

           <!--  <table border="0">
                <tr>
                    <td style="width: 900px"> -->
                        <div class="form-group">
                            <label class="col-sm-2  control-label float-left">企业纳税人ID</label>
                            <div class="col-sm-4 ">
                                <input  value="" name="taxPayerId" id="taxPayerId" class="form-control"  type="text" readonly="readonly">
                            </div>
                            <script >
                            var taxPayerId=$(window.parent.document).find('#taxPayerId').val();
            				document.getElementById("taxPayerId").value=taxPayerId;
                            </script>
                     <!--    </div>
                    </td>
                    <td style="width: 900px">
                        <div class="form-group"> -->
                            <label class="col-sm-2  control-label float-left">企业登录密码</label>
                            <div class="col-sm-4 ">
                                <input name="enterLog.enterLogPass" id="enterLog.enterLogPass" class="form-control" type="text">
                            </div>
                             <script >
                            var taxPayerPass=$(window.parent.document).find('#taxPayerPass').val();
            				document.getElementById("enterLog.enterLogPass").value=taxPayerPass;
                            </script>
                        </div>
                  <!--   </td>
                </tr>
                <tr>
                    <td style="width: 700px"> -->
                        <div class="form-group" >
                            <label class="col-sm-2  control-label float-left">企业纳税人姓名</label>
                            <div class="col-sm-4 ">
                                <input name="taxPayerName" id="taxPayerName" class="form-control"  type="text">
                            </div>
                             <script >
                            var taxPayerName=$(window.parent.document).find('#taxPayerName').val();
            				document.getElementById("taxPayerName").value=taxPayerName;
                            </script>
                       <!--  </div>
                    </td>
                    <td style="width: 800px">
                        <div class="form-group"> -->
                            <label class="col-sm-2  control-label float-left">企业地址</label>
                            <div class="col-sm-4 ">
                                <input name="enterAddress" id="enterAddress" class="form-control"  type="text">
                            </div>
                             <script >
                            var enterAddress=$(window.parent.document).find('#enterAddress').val();
            				document.getElementById("enterAddress").value=enterAddress;
                            </script>
                        </div>
                  <!--   </td>
                </tr>
                <tr>
                    <td style="width: 700px"> -->
                        <div class="form-group" >
                            <label class="col-sm-2  control-label float-left">税务登记日期</label>
                            <div class="col-sm-4 ">
                                <input name="taxLogDate" id="taxLogDate" class="form-control"   type="text">
                            </div>
                             <script >
                            var taxDate=$(window.parent.document).find('#taxDate').val();
            				document.getElementById("taxLogDate").value=taxDate;
                            </script>
                       <!--  </div>
                    </td>
                    <td style="width: 800px">
                        <div class="form-group"> -->
                            <label class="col-sm-2  control-label float-left">主管税务机构名</label>
                            <div class="col-sm-4 ">
                                <input name="taxAuthorityName" id="taxAuthorityName" class="form-control"  type="text">
                            </div>
                             <script >
                            var authorityName=$(window.parent.document).find('#authorityName').val();
            				document.getElementById("taxAuthorityName").value=authorityName;
                            </script>
                        </div>
                   <!--  </td>
                </tr>
                <tr>
                    <td style="width: 700px"> -->
                        <div class="form-group" >
                            <label class="col-sm-2  control-label float-left">所属行政区</label>
                            <div class="col-sm-4 ">
                                <input name="admRegion" id="admRegion" class="form-control"  type="text">
                            </div>
                             <script >
                            var taxRegion=$(window.parent.document).find('#taxRegion').val();
            				document.getElementById("admRegion").value=taxRegion;
                            </script>
                        </div>
                   <!--  </td>

                </tr>
                <tr>
                    <td style="width: 700px"> -->
                        <div class="form-group">
                            <label class="col-sm-2  control-label float-left">法定代表人ID</label>
                            <div class="col-sm-4 ">
                                <input name="legalRepId" id="legalRepId" class="form-control"   type="text">
                            </div>
                            <script >
                            var legalPerID=$(window.parent.document).find('#legalPerID').val();
            				document.getElementById("legalRepId").value=legalPerID;
                            </script>
                        <!-- </div>
                    </td>
                    <td style="width: 800px">
                        <div class="form-group"> -->
                            <label class="col-sm-2  control-label float-left">法定代表人姓名</label>
                            <div class="col-sm-4 ">
                                <input name="legalRepName" id="legalRepName" class="form-control"  type="text">
                            </div>
                             <script >
                            var legalPerName=$(window.parent.document).find('#legalPerName').val();
            				document.getElementById("legalRepName").value=legalPerName;
                            </script>
                        </div>
                   <!--  </td>
                </tr>
                <tr>
                    <td style="width: 700px"> -->
                        <div class="form-group">
                            <label class="col-sm-2  control-label float-left">财务负责人ID</label>
                            <div class="col-sm-4 ">
                                <input name="financialPerId" id="financialPerId" class="form-control"   type="text">
                            </div>
                              <script >
                            var finPerID=$(window.parent.document).find('#finPerID').val();
            				document.getElementById("financialPerId").value=finPerID;
                            </script>
                       <!--  </div>
                    </td>
                    <td style="width: 800px">
                        <div class="form-group"> -->
                            <label class="col-sm-2  control-label float-left">财务负责人姓名</label>
                            <div class="col-sm-4 ">
                                <input name="financialPerName" id="financialPerName" class="form-control"  type="text">
                            </div>
                              <script >
                            var finPerName=$(window.parent.document).find('#finPerName').val();
            				document.getElementById("financialPerName").value=finPerName;
                            </script>
                        </div>
                  <!--   </td>
                </tr>

            </table> -->
            <div class="form-group" align="center">
                <button type="submit" class="btn btn-default btn-lg col-sm-4 col-sm-offset-4" id="btn_enter_submit">提交</button>
            </div>


        </form>
    </div>

    <!--右侧信息结束-->

</body>

</html>