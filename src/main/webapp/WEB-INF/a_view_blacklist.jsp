<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>查看黑名单</title>
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
    <link rel="stylesheet" type="text/css" href="css/base.css" />
     <script type="text/javascript" src="/js/vue.js"></script>
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
                <li class="list-group-item active" style="height: 50px;text-align: center">查看黑名单</li>
            </a>

            <a href="view_standard">
                <li class="list-group-item" style="color: #1b81ea;height: 50px;text-align: center">查看标准词库</li>
            </a>
            <a href="view_simulation">
                <li class="list-group-item" style="color: #1b81ea;height: 50px;text-align: center">查看模拟词库</li>
            </a>
            <a href="view_unmatch">
                <li class="list-group-item" style="color: #1b81ea;height: 50px;text-align: center">查看不匹配企业</li>
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


        <h3>黑名单</h3>
        <div id="blacklist_table" >
        <table  class="table table-hover table-condensed " style="background: white;color: #1b81ea">

            <tr style="font-size: 14px;" align="center">
                <th style="text-align: center">黑名单ID</th>
                <th style="text-align: center">企业ID</th>
                <th style="text-align: center">企业纳税人姓名</th>

            </tr>

            <tbody>
			<tr v-for="item in pageInfo.list" style="font-size: 14px;" align="center">
				<td>{{item.blackListId}} </td>
				<td>{{item.taxPayerId}}</td>
				<td>{{item.taxPayerName}}</td>
			</tr>

        </table>
        <!-- 分页功能  未修改 -->
        <nav class="text-center">
            <ul class="pagination">
                <li v-if="pageInfo.hasPreviousPage"  class="active"><a value="首页" @click="getList(-1)">首页</a></li>

                <li v-if="pageInfo.hasPreviousPage" class="active"><a value="上页" @click="getList(pageInfo.prePage)">上页</a></li>

                <template v-for = "item in pageInfo.navigatepageNums">
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

 <script>
	//vue列表获取数据
		var vue = new Vue({
			el : "#blacklist_table",
			data : {
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
								url : 'view_black_list.action?page='+rpage,
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
	
		$(document).ready(function() {
			$.get("view_black_list.action", null, function(data) {
				vue.pageInfo = data;
				
			}, "json");

		});
	</script>
</body>
</html>