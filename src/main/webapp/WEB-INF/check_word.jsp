<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>审查</title>
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
    	$('#check_word_form').Validform({
    		tiptype:function(msg,o,cssctl){
    		   
    		},
    		ajaxPost:true,	
    		callback:function(data){
    			parent.layer.msg('审查成功');
    			
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

    <div class="container" style="padding-top: 5%;">


        <form class="form-horizontal" id="check_word_form"
              action="check_word.action" >
            <h3 class="form-title" >匹配审查</h3>

            <!-- <table border="0">
                <tr>
                    <td style="width: 700px"> -->
                        <div class="form-group">
                            <label class="col-sm-2 control-label float-left">ID</label>
                            <div class="col-sm-4 ">
                                <input name="matchId" id="matchId" class="form-control" readonly="readonly" type="text">
                            </div>
                             <script>
                var matchId = $(window.parent.document).find('#matchId').val();
                document.getElementById("matchId").value=matchId;
               </script>
                        </div>
                  <!--   </td>

                </tr>
                <tr>
                    <td style="width: 700px"> -->
                        <div class="form-group" >
                            <label class="col-sm-2 control-label float-left">货物名称</label>
                            <div class="col-sm-4 ">
                                <input name="purName" id="purName" class="form-control"   readonly="readonly" type="text">
                                <script>
                var purName = $(window.parent.document).find('#purName').val();
                document.getElementById("purName").value=purName;
               </script>
                            </div>
                       <!--  </div>
                    </td>
                    <td style="width: 800px">
                        <div class="form-group"> -->
                            <label class="col-sm-2 control-label float-left">发票id</label>
                            <div class="col-sm-4 ">
                                <input name="invoiceId" id="invoiceId" class="form-control"  readonly="readonly" type="text">
                            <script>
                var invoiceId = $(window.parent.document).find('#invoiceId').val();
                document.getElementById("invoiceId").value=invoiceId;
               </script>
                            </div>
                        </div>
                    <!-- </td>
                </tr>
                <tr>
                    <td style="width: 700px"> -->
                        <div class="form-group" >
                            <label class="col-sm-2 control-label float-left">匹配项</label>
                            <div class="col-sm-4 ">
                                <input name="matchContent" id="matchContent" class="form-control" placeholder="从前一页" readonly="readonly" type="text">
                            <script>
                    var matchContent = $(window.parent.document).find('#matchContent').val();
                document.getElementById("matchContent").value=matchContent;
               </script>
                            </div>
                        </div>
                  <!--   </td>

                </tr>
                <tr>
                    <td style="width: 700px"> -->
                        <div class="form-group" >
                            <label class="col-sm-2 control-label float-left">输入匹配项ID</label>
                            <div class="col-sm-4 ">
                                <input name="simulation_words.simulationId" id="simulation_words.simulationId" class="form-control"   type="text">
                            </div>
                        </div>
                   <!--  </td>

                </tr>


            </table> -->
            <!--隐藏一个审核标志，设置为1！！！-->
            <div class="form-group">
                <button class="btn btn-default btn-lg col-sm-4 col-sm-offset-4" id="btn_check_word"  type="submit">审核</button>
            </div>


        </form>


    </div>

</div>

</body>
</html>