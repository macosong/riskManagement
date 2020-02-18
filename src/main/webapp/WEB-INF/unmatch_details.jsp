<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>不匹配详情</title>
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
    <script language="javascript" type="text/javascript">

        function backToUnmatch() {
            //返回父界面

            window.open("modify_enter_info");

        }
    </script>
</head>
<body class="demo-1"
      style="background: linear-gradient(120deg, #84fab0, #8fd3f4);">

<div>

    <div class="container" >


        <form class="form-horizontal" id="unmatch_detail_form"
               >
            <h3 class="form-title" >不匹配详情</h3>

            <!-- <table border="0">

                <tr>
                    <td style="width: 700px"> -->
                        <div class="form-group" >
                            <label class="col-sm-2 control-label float-left">企业纳税人ID</label>
                            <div class="col-sm-4 ">
                                <input name="taxPayerId" id="taxPayerId" class="form-control"  readonly="readonly" type="text">
                            </div>
                            <script>
                var taxPayerId = $(window.parent.document).find('#taxPayerId').val();
                document.getElementById("taxPayerId").value=taxPayerId;
               </script>
                        </div>
                    <!-- </td>

                </tr>
                <tr>
                    <td style="width: 700px"> -->
                        <div class="form-group" >
                            <label class="col-sm-2 control-label float-left">对比日期</label>
                            <div class="col-sm-4 ">
                                <input name="compareDate" id="compareDate" class="form-control"  readonly="readonly" type="text">
                            </div>
                             <script>
                var compareDate = $(window.parent.document).find('#compareDate').val();
                document.getElementById("compareDate").value=compareDate;
               </script>
                       <!--  </div>
                    </td>
                    <td style="width: 700px">
                        <div class="form-group" > -->
                            <label class="col-sm-2 control-label float-left">对比结果</label>
                            <div class="col-sm-4 ">
                                <input name="compareResult" id="compareResult" class="form-control" readonly="readonly"  type="text">
                            </div>
                             <script>
                var compareResult = $(window.parent.document).find('#compareResult').val();
                document.getElementById("compareResult").value=compareResult;
               </script>
                        </div>
                   <!--  </td>

                </tr>
                <tr>
                    <td style="width: 700px"> -->
                        <div class="form-group" >
                            <label class="col-sm-2 control-label float-left">商品名</label>
                            <div class="col-sm-4 ">
                                <input name="standardPurName" id="standardPurName" class="form-control"  readonly="readonly"  type="text">
                            </div>
                             <script>
                var standardPurName = $(window.parent.document).find('#standardPurName').val();
                document.getElementById("standardPurName").value=standardPurName;
               </script>
                        </div>
                    <!-- </td>


                </tr>
                <tr>
                    <td style="width: 700px"> -->
                        <div class="form-group" >
                            <label class="col-sm-2 control-label float-left">购进笔数</label>
                            <div class="col-sm-4 ">
                                <input name="purAmount" id="purAmount" class="form-control"  readonly="readonly"  type="text">
                            </div>
                             <script>
                var purAmount = $(window.parent.document).find('#purAmount').val();
                document.getElementById("purAmount").value=purAmount;
               </script>
                       <!--  </div>
                    </td>
                    <td style="width: 700px">
                        <div class="form-group" > -->
                            <label class="col-sm-2 control-label float-left">销售笔数</label>
                            <div class="col-sm-4 ">
                                <input name="buyAmount" id="buyAmount" class="form-control"  readonly="readonly"  type="text">
                            </div>
                             <script>
                var buyAmount = $(window.parent.document).find('#buyAmount').val();
                document.getElementById("buyAmount").value=buyAmount;
               </script>
                        </div>
                  <!--   </td>

                </tr>
                <tr>
                    <td style="width: 700px"> -->
                        <div class="form-group" >
                            <label class="col-sm-2 control-label float-left">购进总金额</label>
                            <div class="col-sm-4 ">
                                <input name="thisTotalBuy" id="thisTotalBuy" class="form-control"  readonly="readonly"  type="text">
                            </div>
                             <script>
                var thisTotalBuy = $(window.parent.document).find('#thisTotalBuy').val();
                document.getElementById("thisTotalBuy").value=thisTotalBuy;
               </script>
                        <!-- </div>
                    </td>
                    <td style="width: 700px">
                        <div class="form-group" > -->
                            <label class="col-sm-2 control-label float-left">销售总金额</label>
                            <div class="col-sm-4 ">
                                <input name="thisTotalSale" id="thisTotalSale" class="form-control" readonly="readonly"  type="text">
                            </div>
                             <script>
                var thisTotalSale = $(window.parent.document).find('#thisTotalSale').val();
                document.getElementById("thisTotalSale").value=thisTotalSale;
               </script>
                        </div>
                   <!--  </td>

                </tr>
                <tr>
                    <td style="width: 700px"> -->
                        <div class="form-group" >
                            <label class="col-sm-2 control-label float-left">风险核实</label>
                            <div class="col-sm-4 ">
                                <input name="riskCheckFlag" id="riskCheckFlag" class="form-control"  readonly="readonly"  type="text">
                            </div>
                             <script>
                var riskCheckFlag = $(window.parent.document).find('#riskCheckFlag').val();
                document.getElementById("riskCheckFlag").value=riskCheckFlag;
               </script>
                        <!-- </div>
                    </td>
                    <td style="width: 700px">
                        <div class="form-group" > -->
                            <label class="col-sm-2 control-label float-left">核实结果</label>
                            <div class="col-sm-4 ">
                                <input name="riskCheckResult" id="riskCheckResult" class="form-control"  readonly="readonly"  type="text">
                            </div>
                             <script>
                var riskCheckResult = $(window.parent.document).find('#riskCheckResult').val();
                document.getElementById("riskCheckResult").value=riskCheckResult;
               </script>
                        </div>
                   <!--  </td>

                </tr>


            </table> -->
           

        </form>


    </div>

</div>

</body>

</html>