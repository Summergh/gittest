<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<%@ page pageEncoding="utf-8" isELIgnored="false" isErrorPage="false" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>EAP</title>
    <meta name="description" content="">
    <!--[if lt IE 8]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->
    <link rel="shortcut icon" href="favicon.ico">
    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css-v=3.3.5.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/font-awesome.min.css-v=4.4.0.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/animate.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/style.min.css-v=4.0.0.css" rel="stylesheet">
    <link rel=stylesheet type="text/css" href="/static/css/easyui.css">
    <link rel=stylesheet type="text/css" href="/static/css/icon.css">
</head>
<body class="fixed-sidebar full-height-layout gray-bg" style="overflow:hidden">
<div id="wrapper">
        <!--左侧导航开始-->
        <nav class="navbar-default navbar-static-side" role="navigation">
            <div class="nav-close"><i class="fa fa-times-circle"></i>
            </div>
            <div class="sidebar-collapse">
                <ul class="nav" id="side-menu">
                    <li class="nav-header">
                        <div class="dropdown profile-element">
                            <span><img alt="image" class="img-circle" style="width:64px;height:64px" src="../static/img/a.png" /></span>
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <span class="clear">
                               <span class="block m-t-xs"><strong class="font-bold">${loginuser}</strong></span>
                                <span class="text-muted text-xs block">超级管理员<b class="caret"></b></span>
                                </span>
                            </a>
                            <ul class="dropdown-menu animated fadeInRight m-t-xs">
                                <li><a class="J_menuItem" href="/jsp/uppicture.jsp" >修改头像</a>
                                </li>
                                <li class="divider"></li>
                                <li><a class="J_menuItem" href="profile.html">个人资料</a>
                                </li>
                                <li class="divider"></li>
                                <li><a href="/admin/tologinout">安全退出</a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li>
                        <a href="#">
                            <i class="fa fa-home"></i>
                            <span class="nav-label">账单管理</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a class="J_menuItem"  href="${pageContext.request.contextPath}/bill/findSuppliers">&nbsp;&nbsp;>&nbsp;&nbsp;查看订单</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="${pageContext.request.contextPath}/bill/toReport">&nbsp;&nbsp;>&nbsp;&nbsp;报表导出</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">
                            <i class="fa fa fa-bar-chart-o"></i>
                            <span class="nav-label">供应商管理</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a class="J_menuItem" href="http://www.baidu.com">查看供应商</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="http://www.baidu.com">添加供应商</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="http://www.baidu.com">修改供应商</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">
                            <i class="fa fa fa-bar-chart-o"></i>
                            <span class="nav-label">用户管理</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a class="J_menuItem" href="http://www.baidu.com">查看用户</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="http://www.baidu.com">添加用户</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="http://www.baidu.com">修改用户</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-desktop"></i> <span class="nav-label">密码修改</span><span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li><a class="J_menuItem" href="http://www.baidu.com">修改密码</a>
                            </li>
                        </ul>
                    </li>
					<li>
                        <a href="#"><i class="fa fa-desktop"></i> <span class="nav-label">权限设置</span><span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
							<li><a class="J_menuItem" href="http://www.baidu.com">资源配制</a>
                            </li>
                            <li><a class="J_menuItem" href="http://www.baidu.com">角色设置</a>
                            </li>
                            <li><a class="J_menuItem" href="http://www.baidu.com">菜单管理</a>
                            </li>
                            <li><a class="J_menuItem" href="http://www.baidu.com">权限分配</a>
                            </li>
                        </ul>
                    </li>
					<li>
                        <a href="#"><i class="fa fa-desktop"></i> <span class="nav-label">系统设置</span><span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li><a class="J_menuItem" href="http://www.baidu.com">新增管理员</a>
                            </li>
                            <li><a class="J_menuItem" href="http://www.baidu.com">管理员设置</a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </nav>
        <!--左侧导航结束-->
        <!--右侧部分开始-->
        <div id="page-wrapper" class="gray-bg dashbard-1">
            <div class="row border-bottom">
                <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                    <ul class="nav navbar-top-links navbar-right">
                        <li class="hidden-xs">
                            <a href="index_v1.html"  class="J_menuItem" data-index="0"><i class="fa fa-cart-arrow-down"></i>
								管理员${loginuser}
							</a>
                        </li>
                    </ul>
                </nav>
            </div>
            <div class="row content-tabs">
                <nav class="page-tabs J_menuTabs">
                    <div class="page-tabs-content">
                        <a href="javascript:;" class="active J_menuTab" data-id="index_v1.html">首页</a>
                    </div>
                </nav>
                <a href="/admin/tologinout" class="roll-nav roll-right J_tabExit"><i class="fa fa fa-sign-out"></i> 退出</a>
			</div>
            <div class="row J_mainContent" id="content-main">
                <iframe class="J_iframe" name="iframe0" width="100%" height="100%" src="/jsp/index_v3.jsp" frameborder="0" data-id="index_v1.html" seamless></iframe>
            </div>
            <div class="footer">
                <div class="pull-right">&copy; 2014-2015 yuyi
                </div>
            </div>
        </div>
    </div>
    <script src="/static/js/jquery.min.js-v=2.1.4" ></script>
    <script src="/static/js/bootstrap.min.js-v=3.3.5" ></script>
    <script src="/static/js/plugins/metisMenu/jquery.metisMenu.js" ></script>
    <script src="/static/js/plugins/slimscroll/jquery.slimscroll.min.js" ></script>
    <script src="/static/js/plugins/layer/layer.min.js" ></script>
    <script src="/static/js/hplus.min.js-v=4.0.0" ></script>
    <script type="text/javascript" src="/static/js/contabs.min.js" ></script>
    <script src="/static/js/plugins/pace/pace.min.js" ></script>
    <script type="text/javascript" src="/static/js/jquery.easyui.min.js"></script>
    <script type="text/javascript">
    $(function () {
        $('#tt2').tree({
            checkbox: false,
            url: '/menu/tomenu',
            onBeforeExpand: function(node){
                $('#tt2').tree('options').url = '/menu/tomenu?id='+node.id;
            }
        });
    })
    </script>
</body>

</html>