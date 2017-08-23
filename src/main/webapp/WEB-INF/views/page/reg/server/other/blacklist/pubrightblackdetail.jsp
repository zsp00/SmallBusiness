<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="renderer" content="webkit">
    <meta charset="utf-8">
    <title>企业列表</title>
    <link rel="stylesheet" href="/css/reg.server.css">
    <link rel="stylesheet" href="/css/vendor/dataTables.bootstrap.min.css">
</head>
<body class="pd10">
<form id="entSearchForm">
  <input type="hidden" id="clientName" name="clientName" value="${limitInfo.clientName}"/>
  <input type="hidden" id="certNO" name="certNO" value="${limitInfo.certNO}"/>
  <input type="hidden" id="notInPidList" name="notInPidList" value="${notInPidList}"/>
</form>
<input type="hidden" value="${sysdate }" id="sysdate"/>
<div class="clearfix reg-company-basic reg-company-basic-yellowish">
    <div class="clearfix reg-caption pl135">
        <div class="legalperson-img">
        	<c:if test="${sex == '女' }">
	            <img src="/img/reg/server/women-legalperson-img.jpg" alt="">
        	</c:if>
        	<c:if test="${empty sex || sex != '女'}">
            	<img src="/img/reg/server/legalperson-img.jpg" alt="">
            </c:if>
        </div>
        <div class="title clearfix">
            <span class="name fl mr5">${limitInfo.clientName}</span>
            <span>${sex}</span>
            <span>居民身份证</span>
            <span>${certNOS}</span>
            <span class="icon-rectangle red fl mr10">
            	<c:if test="${limitstate == 'Y' }">
            	任职资格受限
            	</c:if>
            </span>
        </div>
        <div class="clearfix">
            <p class="w270">
                <i class="legalperson-icon"></i>任职法定代表人/负责人企业：<span><span class="light">${empty leRepCount?'0':leRepCount}</span> 家</span>
            </p>
            <p>
                <i class="datebirth-icon"></i>出生日期：<span>${birthDay }</span>
            </p>
        </div>
        <div class="clearfix">
            <p class="w270">
                <i class="person-icon"></i>任职高管企业：<span><span class="light">${empty midMeCount?'0':midMeCount}</span> 家</span>
            </p>
            <p>
                <i class="person-icon"></i>年龄：<span>${age }</span>
            </p>
        </div>

        <div class="clearfix">
            <p class="w270">
                <i class="telephone-icon"></i>联系电话：<span>${limitInfo.mobTel}</span>
            </p>
            <p><i class="government-icon"></i>国籍：<span>${limitInfo.country}</span></p>
        </div>

        <div class="clearfix">
        	<p class="w270"><i></i><span></span></p>
            <p>
                <i class="government-icon"></i>籍贯：<span></span>
            </p>
        </div>
        <div class="clearfix">
        	<p class="w270"><i class="government-icon"></i>现居住地：<span>${limitInfo.houseAdd}</span></p>
        </div>
        <div class="btn-box">
            <div class="mb5 clearfix">
                <a class="btn-attention-box">
                    <i class="attention-icon"></i>
                    <span>关注本人</span>
                </a>
                <a class="btn-print-box">
                    <i class="print-icon2"></i>
                    <span>打印</span>
                </a>
            </div>
            <div>
                <a class="btn-attention-box">
                    <i class="query-icon"></i>
                    <span>关系网查询</span>
                </a>
                <a class="btn-print-box">
                    <i class="export-icon"></i>
                    <span>导出</span>
                </a>
            </div>
        </div>
    </div>
    <!-- <div class="notice"><i class="notice-icon"></i>正在进行简易注销公告：公告期：2017年1月5日-2017年2月18日</div> -->
</div>
<div class="clearfix mt5 mb5">
    <h6 class="add-title fl">受限对象受限原因（<span id="reason" class="light">0</span>）</h6>
</div>
<table id="reason-table" border="0" cellspacing="0" cellpadding="0" class="table-row perc-100  mt30 nowrap" style="width:100%;">
	<thead >
		<tr>
			<th style="padding: 0 20px;">序号</th>
			<th>受限原因类别</th>
			<th>受限任职企业</th>
	        <th>统一信用代码/注册号</th>
	        <th>执行文号</th>
	        <th>执行部门</th>
	        <th>执行事由</th>
	        <th>限制开始日期</th>
	        <th>限制结束日期</th>
	        <th>限制解除状态</th>
	        <th>解除人</th>
	        <th>解除日期事由</th>
	        <th>解除部门</th>
		</tr>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
	</thead>
</table>
<div class="clearfix mt5 mb5">
    <h6 class="add-title fl">受限对象关联企业（<span id="relate" class="light">0</span>）</h6>
</div>
<table id="relate-table" border="0" cellspacing="0" cellpadding="0" class="table-row perc-100  mt30 nowrap" style="width:100%;">
    <thead>
		<tr>
			<th style="padding: 0 20px;">序号</th>
	        <th>统一信用代码/注册号</th>
	        <th>企业名称</th>
	        <th>法定代表人</th>
	        <th>成立日期</th>
	        <th>受限对象与企业关系</th>
	        <th>登记机关</th>
	        <th>管辖单位</th>
	        <th>登记状态</th>
	    </tr>
    </thead>
</table>
 <script>
 window._CONFIG = {
    chooseUrl:'${userType == 2 ? "/syn" : "/reg"}'
 }
 </script>
<script src="/js/lib/laydate/laydate.js"></script>
<script src="/js/lib/require.js"></script>
<script src="/js/config.js"></script>
<script src="/js/reg/server/other/blacklist/pubrightblackdetail.js"></script>
</body>
</html>