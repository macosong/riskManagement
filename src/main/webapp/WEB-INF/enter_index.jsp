<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>企业详细信息</title>
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
    <script type="text/javascript" src="/js/vue.js"></script>
    
<script type="text/javascript" src="/tax_risk/js/layer/layer.js"></script>


<link href="/tax_risk/css/style-bar.css" rel="stylesheet"
	type="text/css">
<link href="/tax_risk/css/sb-admin.css" rel="stylesheet">
<script type="text/javascript" src="/js/vue.js"></script>
    <script  type="text/javascript">

        function modifyEnterInfo() {
         	layer.open({
    			type : 2,
    			title : '修改信息',
    			maxmin : false,
    			closeBtn : 2,
    			shadeClose : false, //点击遮罩关闭层
    			scrollbar : true,
    			area : [ '700px', '400px' ],
    			content : 'modify_enter_info'

    		}); 
    		
        }
        
      
        $(document).ready(function() {
        	var vue = new Vue({
            	el :"#show_enter_detail_form",
            	data :{
            		enterDetailInfo:''
            	}
            	
            });
        	
			$.get("show_enter_detail.action", null, function(data) {
				
				vue.enterDetailInfo = data;
				
			}, "json");

		});
        </script>
</head>
<body class="demo-1"
      style="background: linear-gradient(120deg, #84fab0, #8fd3f4);">
<!--左侧边栏-->
<div class="container" style="padding-top: 7%;padding-right: 800px;padding-left: 0px;border-left-style: solid;border-left-width: 0px;margin-left: 50px;">

    <div class="col-md-12 col-md-offset-0">
    <ul class="list-group">
        <li class="list-group-item" style="color: #1b81ea;height: 60px;background: rgba(255,252,249,0);border: 0px"></li>
        <a href="enter_index">
            <li class="list-group-item active" style="height: 50px;text-align: center" >企业信息</li>
        </a>
        <a href="up_invoice">
            <li class="list-group-item" style="color: #1b81ea;height: 50px;text-align: center">上传发票</li>
        </a>

        <a href="view_invoice">
            <li class="list-group-item" style="color: #1b81ea;height: 50px;text-align: center">查看发票</li>
        </a>
        <a href="view_buy">
            <li class="list-group-item" style="color: #1b81ea;height: 50px;text-align: center">查看购货台账</li>
        </a>
        <a href="view_pur">
            <li class="list-group-item" style="color: #1b81ea;height: 50px;text-align: center">查看销售台账</li>
        </a>
        <a href="view_blacklist">
            <li class="list-group-item" style="color: #1b81ea;height: 50px;text-align: center">查看黑名单</li>
        </a>

    </ul>
</div>
<!--左侧边栏结束-->

    <!--右侧信息-->
    <div class="container" style="padding-top: 0px;padding-right: 7px;padding-left: 150px;border-left-style: solid;border-left-width: 0px;margin-left: 50px;">

        <form class="form-horizontal" id="show_enter_detail_form">
            <h3 class="form-title" >企业详细信息</h3>

            <table class="table" border="0">
                <tr>
                    <td style="width: 800px">
                        <div class="form-group">
                            <label class="col-md-offset-0 col-xs-4 control-label float-left">企业纳税人ID</label>
                            <div class="col-md-4 ">
                                <input value="<%=request.getSession().getAttribute("enter_ID") %>" id="taxPayerId" class="control-label float-left" style= "background-color:transparent;border:0;width:70px;text-align:center;font-weight:bold"></input>

                            </div>
                        </div>
                    </td>
                    <td style="width: 800px">
                        <div class="form-group">
                            <label class="col-md-offset-0 col-xs-4 control-label float-left">企业登录密码</label>
                            <div class="col-md-4 ">
                                <input v-model="enterDetailInfo.enterLog.enterLogPass" id="taxPayerPass" class="control-label float-left" style= "background-color:transparent;border:0;width:70px;text-align:center;font-weight:bold"></input>

                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td style="width: 700px">
                        <div class="form-group" >
                            <label class="col-md-offset-0 col-xs-4 control-label float-left">企业纳税人姓名</label>
                            <div class="col-md-4 ">
                             <input v-model="enterDetailInfo.taxPayerName" id="taxPayerName" class="control-label float-left" style= "background-color:transparent;border:0;width:70px;text-align:center;font-weight:bold"></input>
                               
                            </div>
                        </div>
                    </td>
                    <td style="width: 800px">
                        <div class="form-group">
                            <label class="col-md-offset-0 col-xs-4 control-label float-left">企业地址</label>
                            <div class="col-md-4 ">
                             <input v-model="enterDetailInfo.enterAddress" id="enterAddress" class="control-label float-left" style= "background-color:transparent;border:0;width:70px;text-align:center;font-weight:bold"></input>
                                
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td style="width: 700px">
                        <div class="form-group" >
                            <label class="col-md-offset-0 col-xs-4 control-label float-left">税务登记日期</label>
                            <div class="col-md-4 ">
                             <input v-model="enterDetailInfo.taxLogDate" id="taxDate" class="control-label float-left" style= "background-color:transparent;border:0;width:90px;text-align:center;font-weight:bold"></input>
                                
                            </div>
                        </div>
                    </td>
                    <td style="width: 800px">
                        <div class="form-group">
                            <label class="col-md-offset-0 col-xs-4 control-label float-left">主管税务机构名</label>
                            <div class="col-md-4 ">
                             <input v-model="enterDetailInfo.taxAuthorityName" id="authorityName" class="control-label float-left" style= "background-color:transparent;border:0;width:70px;text-align:center;font-weight:bold"></input>
                                
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td style="width: 700px">
                        <div class="form-group" >
                            <label class="col-md-offset-0 col-xs-4 control-label float-left">所属行政区</label>
                            <div class="col-md-4 ">
                             <input v-model="enterDetailInfo.admRegion" id="taxRegion" class="control-label float-left" style= "background-color:transparent;border:0;width:70px;text-align:center;font-weight:bold"></input>
                               
                            </div>
                        </div>
                    </td>
                    <td style="width: 800px">

                    </td>

                </tr>
                <tr>
                    <td style="width: 700px">
                        <div class="form-group">
                            <label class="col-md-offset-0 col-xs-4 control-label float-left">法定代表人ID</label>
                            <div class="col-md-4 ">
                             <input v-model="enterDetailInfo.legalRepId" id="legalPerID" class="control-label float-left" style= "background-color:transparent;border:0;width:70px;text-align:center;font-weight:bold"></input>
                              

                            </div>
                        </div>
                    </td>
                    <td style="width: 800px">
                        <div class="form-group">
                            <label class="col-md-offset-0 col-xs-4 control-label float-left">法定代表人姓名</label>
                            <div class="col-md-4 ">
                             <input v-model="enterDetailInfo.legalRepName" id="legalPerName" class="control-label float-left" style= "background-color:transparent;border:0;width:70px;text-align:center;font-weight:bold"></input>
                               

                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td style="width: 700px">
                        <div class="form-group">
                            <label class="col-md-offset-0 col-xs-4 control-label float-left">财务负责人ID</label>
                            <div class="col-md-4 ">
                             <input v-model="enterDetailInfo.financialPerId" id="finPerID" class="control-label float-left" style= "background-color:transparent;border:0;width:70px;text-align:center;font-weight:bold"></input>
                                
                            </div>
                        </div>
                    </td>
                    <td style="width: 800px">
                        <div class="form-group">
                            <label class="col-md-offset-0 col-xs-4 control-label float-left">财务负责人姓名</label>
                            <div class="col-md-4 ">
                             <input v-model="enterDetailInfo.financialPerName" id="finPerName" class="control-label float-left" style= "background-color:transparent;border:0;width:70px;text-align:center;font-weight:bold"></input>
                                
                            </div>
                        </div>
                    </td>
                </tr>

            </table>
           
        </form>
         <div >
                <a href="javascript:modifyEnterInfo()" class="btn btn-default btn-lg col-md-3 col-md-offset-4" id="btn_enter_edit">修改</a>
            </div>
        
        
    </div>

    <!--右侧信息结束-->

</div>

</body>
</html>