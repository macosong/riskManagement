<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>虚开团伙详情</title>
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
  <script type="text/javascript" src="/tax_risk/js/layer/layer.js"></script>
    <link rel="stylesheet" type="text/css" href="/css/base.css" />
     <script type="text/javascript" src="/js/vue.js"></script>
   
</head>
<body class="demo-1"
      style="background: linear-gradient(120deg, #84fab0, #8fd3f4);">

<div>

    <div class="container" >


        <form class="form-horizontal" id="false_detail_form">
            <h3 class="form-title" >虚开团伙详情</h3>

           <!--  <table border="0">

                <tr>
                    <td style="width: 700px"> -->
                        <div class="form-group" >
                            <label class="col-sm-2 control-label float-left" style="padding-top:0px">团伙ID</label>
                            <div class="col-sm-4 ">
                           
                                <input name="falseTeamId" id="falseTeamId"  readonly="readonly" style="background-color:transparent;border:0;color:#FFFFFF;text-align:center;font-weight:bold">
                            </div>
                            <script>
                            var falseTeamId = $(window.parent.document).find('#falseTeamId').val();
                            document.getElementById("falseTeamId").value=falseTeamId;
               </script>
                       <!--  </div>
                    </td>
                    <td style="width: 700px">
                        <div class="form-group" > -->
                            <label class=" col-sm-2 control-label float-left" style="padding-top:0px">团伙类型</label>
                            <div class="col-sm-4 ">
                                <input name="falseTeamType" id="falseTeamType" readonly="readonly" style="background-color:transparent;border:0;color:#FFFFFF;text-align:center;font-weight:bold">
                            </div>
                        </div>
                        <script>
                var falseTeamType = $(window.parent.document).find('#falseTeamType').val();
                document.getElementById("falseTeamType").value=falseTeamType;
               </script>
                   <!--  </td>

                </tr>
                <tr>
                    <td style="width: 700px"> -->
                        <div class="form-group" >
                            <label class=" col-sm-2 control-label float-left" style="padding-top:0px">负责人ID</label>
                            <div class="col-sm-4 ">
                                <input name="inchargePerId" id="inchargePerId" readonly="readonly" style="background-color:transparent;border:0;color:#FFFFFF;text-align:center;font-weight:bold">
                            </div>
                            <script>
                var inchargePerId = $(window.parent.document).find('#inchargePerId').val();
                document.getElementById("inchargePerId").value=inchargePerId;
               </script>
                      <!--   </div>
                    </td>
                    <td style="width: 700px">
                        <div class="form-group" > -->
                            <label class="col-sm-2 control-label float-left" style="padding-top:0px">负责人姓名</label>
                            <div class="col-sm-4 ">
                                <input name="inchargePerName" id="inchargePerName" readonly="readonly" style="background-color:transparent;border:0;color:#FFFFFF;text-align:center;font-weight:bold">
                            </div>
                            <script>
                var inchargePerName = $(window.parent.document).find('#inchargePerName').val();
                document.getElementById("inchargePerName").value=inchargePerName;
               </script>
                        </div>
                        <div class="form-group" >
                            <label class=" col-sm-2 control-label float-left" style="padding-top:0px">负责人企业ID</label>
                            <div class="col-sm-4 ">
                                <input name="taxPayerId" id="taxPayerId" readonly="readonly" style="background-color:transparent;border:0;color:#FFFFFF;text-align:center;font-weight:bold">
                            </div>
                            <script>
                var taxPayerId = $(window.parent.document).find('#taxPayerId').val();
                document.getElementById("taxPayerId").value=taxPayerId;
               </script>
               </div>
        </form>
        
         <div id="team_info_table">
        <table  class="table table-hover table-condensed " style="background: white;color: #1b81ea">

            <tr style="font-size: 14px;" align="center">
                <th style="text-align: center">ID</th>
                <th style="text-align: center">企业ID</th>
                <th style="text-align: center">企业纳税人姓名</th>
                
            </tr>

           <tbody>
			<tr v-for="item in pageInfo.list" style="font-size: 14px;" align="center">
				<td>{{item.falseDetailId}} </td>
				<td>{{item.taxPayerId}} </td>
				<td>{{item.taxPayerName}} </td>
				
				
			</tr>

		</tbody>
        </table>
 <nav class="text-center">
            <ul class="pagination">
                <li v-if="pageInfo.hasPreviousPage"  class="active"><a value="首页" @click="getList(-1)">首页</a></li>

                <li v-if="pageInfo.hasPreviousPage" class="active"><a value="上页" @click="getList(pageInfo.prePage)">上页</a></li>

                <template v-for = "(item,index) in pageInfo.navigatepageNums">
                    <li v-if="pageInfo.pageNum == item" class="disabled"><a href="#">{{item}}</a></li>
                    <li v-else class="active"><a @click="getList(item)">{{item}}</a></li>
                </template>

                <li v-if="pageInfo.hasNextPage" class="active"><a value="下页" @click="getList(pageInfo.nextPage)">下页</a></li>

                <li v-if="pageInfo.hasNextPage"  class="active"><a value="末页" @click="getList(pageInfo.pages+1)">末页</a></li>


            </ul>
        </nav>

</div>

    </div>

</div>
<script type="text/javascript">
var falseTeamId=document.getElementById("falseTeamId").value;

//vue列表
var vue = new Vue({
	el:"#team_info_table",
	data:{
		
		pageInfo:[]
	},
	 methods:{  
         getList : function(page) {
				
				// jquery发ajax
				var that = this;
				
				
				if(page!=''){
					rpage=page;
				}else{
					rpage=1;
				}
				
				$.ajax({
							url : 'view_false_teamD.action?falseTeamId='+falseTeamId+'&page='+rpage,
							type : 'get',
							dataType : 'json',
							async : false,
							success : function(data) {
								
								// data就是response的 字符串数据： json
								that.pageInfo = data;
								
							},
							error : function() {
								alert("服务器有问题")
							}
						});
			

			},
     }  
});

$(document).ready(function(){
	$.get("view_false_teamD.action",{"falseTeamId":falseTeamId},function(data){
		
		
		vue.pageInfo=data;
		
	}, "json");
	
});

</script>
</body>
</html>