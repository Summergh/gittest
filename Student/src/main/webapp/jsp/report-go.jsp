<%--
  Created by IntelliJ IDEA.
  User: zhangyu
  Date: 2017/8/27
  Time: 15:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>The DataGrid is created from markup, no JavaScript code needed.</title>
    <link rel=stylesheet type="text/css" href="/static/css/easyui.css">
    <link rel=stylesheet type="text/css" href="/static/css/icon.css">
    <link rel=stylesheet type="text/css" href="/static/css/demo.css">
    <script type="text/javascript" src="/static/js/jquery.min.js"></script>
    <script type="text/javascript" src="/static/js/jquery.easyui.min.js"></script>
    <script type="text/javascript">
        jQuery.noConflict();
        var tt;
        var ss;  //添加提交数据
        var aa;  //修改提交数据
        jQuery(function ($) {
            $('.easyui-combobox').combobox({
                editable:false//下拉框不可编辑
            });
            var datagrid ;  //定义全局变量
            var editRow ="";//定义当前编辑的行
            datagrid = $("#dataGrid").datagrid({
                width:"100%",
                title:"超市订单系统",
                border:true,
                locale:"zh_CN",
                iconCls:'icon-save',
                striped:true,
                idField:"bid",
                sortOrder:"desc",
                url:"/bill/findAllBillByTime",
                /*queryParams: { dtNumber:"", dtTitle: ""},*/
                frozenColumns:[[    //复选框
                    {field:'ck',checkbox:true}
                ]],
                singleSelect:false,//是否单选
                pagination:true,//分页控件
                pageList: [5, 10,15,20],//可以设置每页记录条数的列表
                columns: [[
                    { field: 'bid', title: 'ID', width: '10%', algin: 'center'},
                    { field: 'hscode', title: '编号', width: '10%', align: 'center' },
                    { field: 'bname', title: '商品名称', width: '10%', align: 'center' },
                    { field: 'bmoney', title: '余额', width: '10%', align: 'center' },
                    { field: 'sunit', title: '部门', width: '10%', align: 'center' },
                    { field: 'createtime', title: '下单时间', width: '10%', align: 'center' },
                    { field: 'ispay', title: '是否付款', width: '10%', align: 'center' },
                    { field: 'scount', title: '总数量', width: '10%', align: 'center' },
                    { field: 'suppName', title: '供应商', width: '20%', align: 'center' },

                ]],
                toolbar:[{
                    d: 'btnreport',
                    text: "报表导出",
                    iconCls: 'icon-add',
                    handler: function () {
                    }
                }],

            });
            //条件查询
           tt= function() {

               if($('input[name="begin-time"]').val()==""){
                   $.messager.alert('提示','请选择时间');
               }else{
                   window.location.href="/bill/findAllBillByTime?begintime="+$('input[name="begin-time"]').val()+"&endtime="+$('input[name="end-time"]').val();
               }
            }
        })

        //多条件查询
        function Search() {
                tt();
        }


    </script>

    <style type="text/css">
        .lbInfo{
            font-family: 宋体;
            color: white;
        }
    </style>

</head>
<body>


<%--高级查询部分--%>
<div id="searchtool" style="padding:5px;border: 1px solid">
    <span style="font-family: 宋体">开始时间：</span>
    <input name="begin-time" type="date">
     <span style="font-family: 宋体">结束时间：</span>
    <input  name="end-time" type="date">
    <a href="javascript: Search()" class="easyui-linkbutton" data-options="iconCls:'icon-search'">报表导出</a>
</div>

<!--数据展示 -->
<div style="height:95%;width:100%;border: 1px solid" >
    <table  id="dataGrid" style="width: 100%;height: 100%;"></table>
</div>

</body>
</html>
