<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>账目不匹配的企业</title>
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
    <script >
  //删除确认
    function checkAccount() {
    	var flag = window.confirm("确定进行本季度查账吗");
    	if (flag) {
    		
    	    window.location.href='checkAllAccount.action';
    	}
    	
    	
    }
  
  function detail(){
	  layer.open({
			type: 2,
			title: '详细信息',
			maxmin: false,
			closeBtn:2,
			shadeClose: false, //点击遮罩关闭层
			area : ['790px' , '400px'],
			content: 'unmatch_details'
		});
  }
  
  function checkDetail(){
	  layer.open({
			type: 2,
			title: '核实',
			maxmin: false,
			closeBtn:2,
			shadeClose: false, //点击遮罩关闭层
			area : ['790px' , '400px'],
			content: 'check_unmatch'
		});
  }
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
                <li class="list-group-item active" style="height: 50px;text-align: center">查看不匹配企业</li>
            </a>
            <a href="view_false_enter">
                <li class="list-group-item" style="color: #1b81ea;height: 50px;text-align: center">查看虚开企业</li>
            </a>
            <a href="view_false_team">
                <li class="list-group-item" style="color: #1b81ea;height: 50px;text-align: center">查看虚开团伙</li>
            </a>
            <a href="add_admin">
                <li class="list-group-item" style="color: #1b81ea;height: 50px;text-align: center">添加管理员</li>
            </a>

        </ul>
    </div>
    <!--左侧边栏结束-->

    <!--右侧列表-->
    <div class="container" style="padding-top: 0px;padding-right: 7px;padding-left: 150px;border-left-style: solid;border-left-width: 0px;margin-left: 50px;">



       <div class="row" style="height: 10px">
        <h2 class="col-md-4" style="margin-top: 0px;">账目不匹配企业</h2>
              <a id="checkBtn" class="btn col-md-3 col-md-offset-4 btn-primary" href="javascript:checkAccount();">账目核查</a>
        </div>
        <div id="unmatch_table">
        <table  class="table table-hover table-condensed " style="background: white;color: #1b81ea">

            <tr style="font-size: 14px;" align="center">
                <th style="text-align: center">ID</th>
                <th style="text-align: center">企业纳税人ID</th>
                <th style="text-align: center">对比日期</th>
                <th style="text-align: center">对比结果</th>
                <th style="text-align: center">操作</th><!--包括详细；核实；-->
            </tr>

           <tbody>
			<tr v-for="(item,index) in pageInfo.list" style="font-size: 14px;" align="center">
				<td>{{item.notMatchId}} <input id="notMatchId" type="hidden" ></td>
				<td>{{item.taxPayerId}} <input id="taxPayerId" type="hidden" ></td>
				<td>{{item.compareDate}} <input id="compareDate" type="hidden" ></td>
				<td>{{item.compareResult}} <input id="compareResult" type="hidden" >
				
				<input id="standardPurId" type="hidden" >
				<input id="standardPurName" type="hidden" >
				<input id="purAmount" type="hidden" >
				<input id="buyAmount" type="hidden" >
				
				<input id="thisTotalSale" type="hidden" >
				<input id="thisTotalBuy" type="hidden" >
				<input id="riskCheckFlag" type="hidden" >
				<input id="riskCheckResult" type="hidden" >
				
				</td>
				
				<td>
					<div class="dropdown">
					<button type="button" class="btn btn-default btn-xs dropdown-toggle" id="dropdownMenu" data-toggle="dropdown">
						操作
						<span class="caret"></span>
					</button>
					<ul class="dropdown-menu">
						<li>
							<a  href="javascript:detail();" @click="onclick(index)">详细</a>
							
						</li>
						
						<li v-if="item.riskCheckFlag=='N'">
							<a href="javascript:checkDetail();" @click="onclick(index)">核实</a>	
						</li>
					</ul>
				</div>	


				</td>
			</tr>

		</tbody>
        </table>
        <!-- 分页功能  未修改 -->
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


    <!--右侧列表结束-->



</div>
<script type="text/javascript">
//vue列表
var vue = new Vue({
	el:"#unmatch_table",
	data:{
		
		pageInfo:[]
	},
	 methods:{  
         onclick:function(index){  
         	document.getElementById("notMatchId").value=vue.pageInfo.list[index].notMatchId;
         	document.getElementById("taxPayerId").value=vue.pageInfo.list[index].taxPayerId;
         	document.getElementById("compareDate").value=vue.pageInfo.list[index].compareDate;
         	
         	document.getElementById("compareResult").value=vue.pageInfo.list[index].compareResult;
         	
         	document.getElementById("standardPurId").value=vue.pageInfo.list[index].standardPurId;
         	document.getElementById("standardPurName").value=vue.pageInfo.list[index].standardPurName;
         	document.getElementById("purAmount").value=vue.pageInfo.list[index].purAmount;
         	document.getElementById("buyAmount").value=vue.pageInfo.list[index].buyAmount;
         	
         	document.getElementById("thisTotalSale").value=vue.pageInfo.list[index].thisTotalSale;
         	document.getElementById("thisTotalBuy").value=vue.pageInfo.list[index].thisTotalBuy;
         	document.getElementById("riskCheckFlag").value=vue.pageInfo.list[index].riskCheckFlag;
         	document.getElementById("riskCheckResult").value=vue.pageInfo.list[index].riskCheckResult;
         	
         },
         getList : function(page) {
				
				// jquery发ajax
				var that = this;
				if(page!=''){
					rpage=page;
				}else{
					rpage=1;
				}
				
				$.ajax({
							url : 'view_unmatch_enter.action?page='+rpage,
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
	$.get("view_unmatch_enter.action",null,function(data){
		
		
		vue.pageInfo=data;
		
	}, "json");
	
});

</script>
</body>


</html>