<%--
   Copyright© 2003-2016 浙江汇信科技有限公司, All Rights Reserved.
  --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title></title>
    <link rel="stylesheet" href="/css/vendor/bootstrap-theme.min.css">
    <link rel="stylesheet" href="/css/vendor/bootstrap.min.css">
    <link rel="stylesheet" href="/css/style.css?v=0177205e80">
</head>
<body>
<div class="container .container-fluid">
    <div class="" style="margin-top: 10px;">
        <form class="form-horizontal" id="sysUserForm">
            <input type="hidden" name="id" value="${sysUser.id}">
            <div class="form-group">
                <label class="col-xs-3 control-label text-right">用户名：</label>
                <div class="col-xs-9">
                    <input type="text" name="username" class="form-control" placeholder="请输入登录用户名"
                           value="${sysUser.username}">
                </div>
            </div>
            <div class="form-group">
                <label class="col-xs-3 control-label text-right">登录密码：</label>
                <div class="col-xs-9">
                    <input type="password" name="password" class="form-control" placeholder="${empty sysUser.id?"请输入登录密码":"如需修改密码，请输入新密码"}"
                           value="">
                </div>
            </div>
            <div class="form-group">
                <label class="col-xs-3 control-label text-right">姓名：</label>
                <div class="col-xs-9">
                    <input type="text" name="realName" class="form-control" placeholder="请输入姓名"
                           value="${sysUser.realName}">
                </div>
            </div>
            <div class="form-group">
                <label class="col-xs-3 control-label text-right">Email：</label>
                <div class="col-xs-9">
                    <input type="text" name="email" class="form-control" placeholder="请输入Email地址"
                           value="${sysUser.email}">
                </div>
            </div>
            <div class="form-group">
                <label class="col-xs-3 control-label text-right">角色：</label>
                <div class="col-xs-9">
                    <c:forEach var="role" items="${allRoles}">
                        <label class="checkbox-inline">
                            <input type="checkbox" name="roles[]"
                                   value="${role.id}" ${!empty userRoles[role.id]?"checked":""}>${role.name}
                        </label>
                    </c:forEach>
                </div>
            </div>
            <div class="form-group">
                <label class="col-xs-3 control-label text-right">备注：</label>
                <div class="col-xs-9">
                    <textarea name="desc" class="form-control">${sysUser.desc}</textarea>
                </div>
            </div>
            <div class="row text-center">
                <button id="cancel" type="button" class="btn btn-primary">取消</button>
                <button id="save" type="submit" class="btn btn-primary">保存</button>
            </div>
        </form>
    </div>
</div>
<script src="/js/lib/require.js"></script>
<script src="/js/config.js?v=138f208b85"></script>
<script src="/js/business/sysuser/edit_main.js?v=2a57ba079b"></script>
</body>
</html>