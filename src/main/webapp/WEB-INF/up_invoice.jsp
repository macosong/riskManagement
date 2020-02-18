<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>发票上传</title>
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
     function backToInvoice(){
	       window.location.href="up_invoice"
     }
    
    $(document).ready(function(){
    	//一行代码搞定，提交表单的时候会自动触发验证程序
    	$('#up_invoice_form').Validform({
    		tiptype:function(msg,o,cssctl){
    		    
    		},
    		ajaxPost:true,	
    		callback:function(data){
    			backToInvoice();
    			
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

            <a href="enter_index">
                <li class="list-group-item " style="color: #1b81ea;height: 50px;text-align: center" >企业信息</li>
            </a>
            <a href="up_invoice">
                <li class="list-group-item active" style="height: 50px;text-align: center">上传发票</li>
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

        <form  id="up_invoice_form" action="up_invoice.action" >
            <h3 class="form-title" >上传发票</h3>

           <!--  <table border="0">
                <tr>
                    <td style="width: 700px"> -->
                        <div class="form-group">
                            <label class="col-sm-2 control-label float-left">购货方ID</label>
                            <div class="col-sm-4">
                                <input name="buyerTaxPayerId" id="buyerTaxPayerId" class="form-control" placeholder="购货方ID"  type="text">
                            </div>
                        <!--  </div> -->
                    <!-- </td>
                    <td style="width: 800px"> -->
                       <!--  <div class="form-group">  -->
                            <label class="col-sm-2 control-label float-left">供货方ID</label>
                            <div class="col-sm-4">
                                <input name="providerTaxPayerId" id="providerTaxPayerId" class="form-control" placeholder="供货方ID"  type="text">
                            </div>
                        </div>
                        
                                <div class="form-group">
                               <br>
                               <br>
                               </div>
                 <!--    </td>
                </tr>
                <tr>
                    <td style="width: 700px"> -->
                        <div class="form-group" >
                            <label class="col-sm-2 control-label float-left">货物名称</label>
                            <div class="col-sm-4 ">
                                <input name="purName" id="purName" class="form-control" placeholder="货物名称"  type="text">
                            </div>
                        <!-- </div>
                    </td>
                    <td style="width: 800px">
                        <div class="form-group"> -->
                            <label class="col-sm-2 control-label float-left">货物金额</label>
                            <div class="col-sm-4 ">
                                <input name="purAmount" id="purAmount" class="form-control" placeholder="货物金额"  type="text">
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
                            <label class="col-sm-2 control-label float-left">销售日期</label>
                            <div class="col-sm-4 ">
                                <input name="purSaleDate" id="purSaleDate" class="form-control" placeholder="2019-05-19"  type="text">
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
                            <label class="col-sm-2 control-label float-left">发票ID</label>
                            <div class="col-sm-4 ">
                                <input name="invoiceId" id="invoiceId" class="form-control" placeholder="发票ID"  type="text">
                            </div>
                      <!--   </div>
                    </td>
                    <td style="width: 800px">
                        <div class="form-group"> -->
                            <label class="col-sm-2 control-label float-left">发票日期</label>
                            <div class="col-sm-4 ">
                                <input name="invoiceDate" id="invoiceDate" class="form-control" placeholder="2019-05-19"  type="text">
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
                <button class="btn btn-default btn-lg col-md-3 col-md-offset-4" id="btn_up_invoice" type="submit">上传</button>
            </div>


        </form>
    </div>

    <!--右侧信息结束-->
</div>

</body>
</html>