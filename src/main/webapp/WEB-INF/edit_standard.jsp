<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>编辑标准词库</title>
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
    	$('#edit_standard_form').Validform({
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


        <form class="form-horizontal" id="edit_standard_form"
              action="edit_standard.action" >
            <h3 class="form-title" >编辑标准词库</h3>
            <div class="form-group" >
               <input id="standardPurId" name="standardPurId" class="form-control" type="hidden">
               <script>
                var standardPurId = $(window.parent.document).find('#standardPurId').val();
                document.getElementById("standardPurId").value=standardPurId;
               </script>
               </div>
            <!-- <table border="0">

                <tr>
                    <td style="width: 700px"> -->
                        <div class="form-group" >
                            <label class="col-sm-2 control-label float-left">货物名称</label>
                            <div class="col-sm-4 ">
                                <input name="standardPurName" id="standardPurName" class="form-control"  type="text">
                            </div>
                            <script type="text/javascript">
                var standardPurName = $(window.parent.document).find('#standardPurName').val();
                document.getElementById("standardPurName").value=standardPurName;
               </script>
                       <!--  </div>
                    </td>
                    <td style="width: 800px">
                        <div class="form-group"> -->
                            <label class="col-sm-2 control-label float-left">所属大类</label>
                            <div class="col-sm-4 ">
                                <input name="firstCategory" id="firstCategory" class="form-control"  type="text">
                            </div>
                            <script type="text/javascript">
                var firstCategory = $(window.parent.document).find('#firstCategory').val();
                document.getElementById("firstCategory").value=firstCategory;
               </script>
                        </div>
                        <div class="form-group">
                               <br>
                              
                               </div>
                   <!--  </td>
                </tr>
                <tr>
                    <td style="width: 700px"> -->
                        <div class="form-group" >
                            <label class="col-sm-2 control-label float-left">所属中类</label>
                            <div class="col-sm-4 ">
                                <input name="secondCategory" id="secondCategory" class="form-control"  type="text">
                            </div>
                            <script type="text/javascript">
                var secondCategory = $(window.parent.document).find('#secondCategory').val();
                document.getElementById("secondCategory").value=secondCategory;
               </script>
                       <!--  </div>
                    </td>
                    <td style="width: 800px">
                        <div class="form-group" > -->
                            <label class="col-sm-2 control-label float-left">所属小类</label>
                            <div class="col-sm-4 ">
                                <input name="thirdCategory" id="thirdCategory" class="form-control"   type="text">
                            </div>
                            <script type="text/javascript">
                var thirdCategory = $(window.parent.document).find('#thirdCategory').val();
                document.getElementById("thirdCategory").value=thirdCategory;
               </script>
                        </div>
                        <div class="form-group">
                               <br>
                             
                               </div>
                   <!--  </td>

                </tr>


            </table> -->
            <!--隐藏一个审核标志，设置为1！！！-->
            <div class="form-group">
                <button class="btn btn-default btn-lg col-sm-4 col-sm-offset-4" id="btn_edit_standard"  type="submit">编辑</button>
            </div>


        </form>


    </div>

</div>

</body>

</html>