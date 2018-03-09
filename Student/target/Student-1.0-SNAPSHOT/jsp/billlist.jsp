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
                url:"/bill/findAllBill",
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
                    id: 'btnAdd',
                    text: "添加",
                    iconCls: 'icon-add',
                    handler: function () {
                        $('#billAdd').show();
                        $('#billAdd').dialog({   //和window事件相同
                            title:"添加商品信息",
                            minimizable:true,//定义是否显示最小化按钮
                            maximizable:true,//定义是否显示最大化按钮
                            resizable:false//定义对话框是否可编辑大小
                        });

                    }
                },{
                    id:'btnUp',
                    text:'修改',
                    iconCla:'icon-edit',
                    handler:function () {
                        var selRow = $("#dataGrid").datagrid("getSelections");//返回选中多行
                        if(selRow.length==0){
                            $.messager.alert('提示','请至少选择一条数据');
                            return false;
                        }else{
                            $('#up-bid').textbox('setValue',selRow[0].bid);
                            $('#up-scode').textbox('setValue',selRow[0].hscode);
                            $('#up-scount').textbox('setValue',selRow[0].scount);
                            $('#up-sname').textbox('setValue',selRow[0].bname);
                            $('#up-sunit').textbox('setValue',selRow[0].sunit);
                            $('#up-addIsPay').combobox('setValue',selRow[0].paystate);
                            $('#up-ss').combobox('setValue',selRow[0].supplier.supId);
                            $('#up-bmoney').textbox('setValue',selRow[0].bmoney);
                            $('#up-createtime').textbox('setValue',selRow[0].createtime);
                            $('#billupdate').show();
                            $('#billupdate').dialog({   //和window事件相同
                                title:"修改商品信息 ",
                                minimizable:true,//定义是否显示最小化按钮
                                maximizable:true,//定义是否显示最大化按钮
                                resizable:false//定义对话框是否可编辑大小
                            });
                        }


                    }
                },{
                    id:'btnRem',
                    text:'删除',
                    iconCla:'icon-remove',
                    handler:function () {
                        var selRow = $("#dataGrid").datagrid("getSelections");//返回选中多行
                        if(selRow.length==0){
                            $.messager.alert('提示','请至少选择一条数据');
                            return false;
                        }
                        var bids = [];
                        for(var i=0;i<selRow.length;i++){
                                var id= selRow[i].bid;
                                bids.push(id);
                        }
                        $.messager.confirm('提示', '确定要删除吗？', function(r){
                            if (r){
                                location.href="/bill/doreportexit?bids="+bids;
                            }
                        });
                    }
                }
                ]
            });
            //条件查询
           tt= function() {
                $('#dataGrid').datagrid('load',{
                    bname:$('#bname').val(),
                    i:$('#supid').combobox('getValue'),
                    paystate:$('#paystate').combobox('getValue')
                }
                );
            }
            ss=function () {
                if($('#scode').val()==""||$('#sname').val()==""||$('#sunit').val()==""){
                        $.messager.alert('提示','请将输入补充完整');
                        return false;
                }else if(isNaN($('#scount').val())){
                        $.messager.alert('提示','总数量输入格式不对！');
                        return false;
                }else if($('#addIsPay').combobox('getValue')==1000||$('#ss').combobox('getValue')==1000){
                       $.messager.alert('提示','请提供供应商，是否付款！');
                       return false;
                }else{
                       $('#myform').submit();
                       return true;
                }
            }

            aa=function () {
               var str = "0123456789";
                if($('#up-scode').val()==""||$('#up-sname').val()==""||$('#up-sunit').val()==""){
                    $.messager.alert('提示','请将输入补充完整');
                    return false;
                }else if(str.indexOf($('#up-scount').val())!=-1){
                    $.messager.alert('提示','总数量输入格式不对！');
                    return false;
                }else if($('#up-addIsPay').combobox('getValue')==1000||$('#up-ss').combobox('getValue')==1000){
                    $.messager.alert('提示','请提供供应商，是否付款！');
                    return false;
                }else{
                    $('#myupform').submit();
                    return true;
                }
            }
            
        })

        //多条件查询
        function Search() {
            tt();
        }
        function comit() {
            ss();
        }
        function up() {
            aa();
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


<!--数据展示 -->
<div id="searchtool" style="padding:5px;border: 1px solid">
    <span style="font-family: 宋体">供应商名称:</span><input type="text" id="bname" name="bname" class="easyui-textbox" value="" size=10 />
    <span style="font-family: 宋体">是否付款：</span>
    <select class="easyui-combobox" name="state" id="paystate" style="width:100px;">
        <option value="1000">请选择</option>
        <option value="1">已付款</option>
        <option value="0">未付款</option>
    </select>
     <span style="font-family: 宋体">选择供应商：</span>

   <select class="easyui-combobox" name="supplier" id="supid" style="width:100px;">
        <option value="1000">请选择</option>
        <c:forEach items="${supplierbycmb}" var="item">
            <option value="${item.supId}">${item.supName}</option>
        </c:forEach>
       <%-- <s:iterator value="#request.supplierbycmb" var="item">
             <option value="<s:property value="#item.supId"></s:property> "><s:property value="#item.supName"/></option>
        </s:iterator>--%>
    </select>
    <a href="javascript:Search()" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a>
</div>
<div style="height:95%;width:100%;border: 1px solid" >
    <table  id="dataGrid" style="width: 100%;height: 100%;"></table>
</div>




<%--添加dialog--%>
<div id="billAdd" style="display:none;padding:5px;width:400px;height:450px;" title="添加订单">
    <form action="/bill/doAddBill.action" method="post" id="myform">
        <div style="margin-bottom:20px">
            <div>商品编号:</div>
            <input class="easyui-textbox" id="scode" data-options="prompt:'请填写商品编号'" name="bill.hscode" style="width:100%;height:25px">
        </div>
        <div style="margin-bottom:20px">
            <div>商品名称:</div>
            <input class="easyui-textbox" id="sname" name="bill.bname" style="width:100%;height:25px">
        </div>
        <div style="margin-bottom:20px">
            <div>部门：</div>
            <input class="easyui-textbox" id="sunit" name="bill.sunit" style="width:100%;height:25px">
        </div>
        <div style="margin-bottom:20px">
        <div>总数量：</div>
            <input class="easyui-textbox" id="scount" name="bill.scount" style="width:100%;height:25px" onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"/>
        </div>
        <div style="margin-bottom:20px">
            <div>是否付款:</div>
            <select class="easyui-combobox" name="bill.paystate" id="addIsPay" style="width:100%;height:25px" >
                <option value="1000">请选择</option>
                <option value="1">已付款</option>
                <option value="0">未付款</option>
            </select>
        </div>
       <div style="margin-bottom:20px">
          <div>供应商：</div>
            <select class="easyui-combobox"  name="bill.supplier.supId" id="ss" style="width:100%;height: 25px">
                <option class="easyui-combobox" value="1000">请选择</option>
                <c:forEach items="${supplierbycmb}" var="item">
                    <option value="${item.supId}">${item.supName}</option>
                </c:forEach>
            </select>
        </div>
        <div>
            <input type="button" class="easyui-linkbutton" iconCls="icon-ok"style="width:100%;height:32px" onclick="javascript: return comit()" value="提交">
        </div>
    </form>
</div>


<%--修改dialog--%>
<div id="billupdate" style="display:none;padding:5px;width:400px;height:450px;" title="修改订单">
    <form action="/bill/doUpBill.action" method="post" id="myupform">
        <div style="margin-bottom:20px;display: none">
            <div>商品id:</div>
            <input class="easyui-textbox" id="up-bid"  name="bill.bid" style="width:100%;height:25px">
        </div>
        <div style="margin-bottom:20px;display: none">
            <div>商品余额:</div>
            <input class="easyui-textbox" id="up-bmoney"  name="bill.bmoney" style="width:100%;height:25px">
        </div>
        <div style="margin-bottom:20px;display: none">
            <div>创建时间:</div>
            <input class="easyui-textbox" id="up-createtime"  name="bill.createtime" style="width:100%;height:25px">
        </div>
        <div style="margin-bottom:20px">
            <div>商品编号:</div>
            <input class="easyui-textbox" id="up-scode" data-options="prompt:'请填写商品编号'" name="bill.hscode" style="width:100%;height:25px">
        </div>
        <div style="margin-bottom:20px">
            <div>商品名称:</div>
            <input class="easyui-textbox" id="up-sname" name="bill.bname" style="width:100%;height:25px">
        </div>
        <div style="margin-bottom:20px">
            <div>部门：</div>
            <input class="easyui-textbox" id="up-sunit" name="bill.sunit" style="width:100%;height:25px">
        </div>
        <div style="margin-bottom:20px">
            <div>总数量：</div>
            <input class="easyui-textbox" id="up-scount" name="bill.scount" style="width:100%;height:25px" />
        </div>
        <div style="margin-bottom:20px">
            <div>是否付款:</div>
            <select class="easyui-combobox" name="bill.paystate" id="up-addIsPay" style="width:100%;height:25px" >
                <option value="1000">请选择</option>
                <option value="1">已付款</option>
                <option value="0">未付款</option>
            </select>
        </div>
      <div style="margin-bottom:20px">
            <div>供应商：</div>
            <select class="easyui-combobox"  name="bill.supplier.supId" id="up-ss" style="width:100%;height: 25px">
                <option class="easyui-combobox" value="1000">请选择</option>
                <c:forEach items="${supplierbycmb}" var="item">
                    <option value="${item.supId}">${item.supName}</option>
                </c:forEach>
            </select>
        </div>
        <div>
            <input type="button" class="easyui-linkbutton" iconCls="icon-ok"style="width:100%;height:32px" onclick="javascript: return up()" value="提交">
        </div>
    </form>
</div>
</body>
</html>
