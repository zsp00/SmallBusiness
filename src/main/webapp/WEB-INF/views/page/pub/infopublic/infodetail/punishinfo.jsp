<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="hx" uri="/WEB-INF/tld/hx.tld" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="renderer" content="webkit">
    <meta charset="utf-8">
    <title>行政处罚信息</title>
    <link rel="stylesheet" href="/css/pub.css">
</head>
<body class="enterprise-info-bg">
<!-- 头部 -->
<jsp:include page="../../common/enterprise.jsp"></jsp:include>
<jsp:include page="../../common/basicheader.jsp"></jsp:include>

<div class="mod detail-main">
 <input type="hidden" name="encryPriPID" id="encryPriPID" value="${entBasicInfo.encryPriPID }"/>
<form id="params">
   <input type="hidden" name="priPID" id="priPID" value="${entBasicInfo.priPID}"/>
</form>
    <div class="tab-panel">
        <!-- 行政处罚信息 -->
        <div class="mod-bd-panel_company">
            <h3 class="i-title">
                <i></i>行政处罚信息
            </h3>
            <table class="table-common table-chufa mb20">
                <thead>
                <tr>
                    <th width="35">序号</th>
                    <th width="155">决定书文号</th>
                    <th width="155">违法行为类型</th>
                    <th width="230">行政处罚内容</th>
                    <th width="155">决定机关名称</th>
                    <th width="110">处罚决定日期</th>
                    <th width="110">公示日期</th>
                    <th>详情</th>
                </tr>
                </thead>
                <tbody id="_punish">
                </tbody>
            </table>
            <div class="notice-pagination-box clearfix">
                <span class="page-total">共查询到 <em id="_punishItemCount"></em> 条信息，共 <em id="_punishPageCount"></em> 页</span>
                <div id="_punishPagination" class="pagination">
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    //参数的传递
    window._CONFIG = {
    		entTypeCatg:'${entBasicInfo.entTypeCatg}'
    }
</script>

<jsp:include page="../../common/footer.jsp"></jsp:include>
<script src="../../../../js/lib/jquery/jquery-1.12.3.min.js"></script>
<script type="text/javascript">
    var jiathis_config = {
        url:'http://118.178.31.19/client/entsearch/toEntSearch?entName='+'${hx:encodeYear(entBasicInfo.entName)}',
        title:"国家企业信用信息公示系统",
        summary:'',
        desc:'',
        data_track_clickback:false
    };
</script>
<script type="text/javascript" src="http://v3.jiathis.com/code/jia.js" charset="utf-8"></script>
<script type="text/javascript" src="http://v3.jiathis.com/code/plugin.client.js" charset="utf-8"></script>
<script src="/js/lib/require.js"></script>
<script src="/js/config.js"></script>
<script src="/js/pub/entinfo/punishinfo_main.js"></script>
<script src="/js/pub/entinfo/information_share.js"></script>
<script src="<c:url value='/js/pub/entinfo/sendPdf.js'/>"></script>
<script id="punish-table-template" type="text/x-handlebars-template">
    		{{#each data}}
    		<tr>
        		<td>{{xh @index}}</td>
        		<td>{{penDecNo}}</td>
        		<td>{{illegActType}}</td>
				{{{miniShow penContent}}}
        		<td>{{judAuth}}</td>
				<td>{{penDecIssDateDesc}}</td>
				<td>{{auditDateDesc}}</td>
				<td><a href="javascript:void(0);" class="js-punishdetail-view" id="{{caseNO}}&priPID={{priPID}}">查看</a></td>
    		</tr>
			<tr style="{{dataList pubOtherPunishAlterList}}">
            	<td colspan="8" class="tip2">
                        <div class="fl">有变更情形：</div>
                        <div class="fl">
                            {{#with pubOtherPunishAlterList}}
                            	{{#each this}}
                                <p>{{addOne @index}}、{{judAuth}}{{altDate altDate}}{{contents}}。</p>
                                {{/each}}
                        	{{/with}}
                        </div>
            	</td>
            </tr>
    		{{/each}}
		</script>
<script type="text/javascript" src="http://fwtj.gsxt.gov.cn/js/logcollector.js?nodenum=330000"></script>
<script>
    window.onload = function () {
        var sessionId = '<%=request.getSession().getId()%>';
        sessionId_gsxt = sessionId; // 正常情况JS可以拿到sessionId,但经过测试发现有些web服务器，js拿不到sessionId，这种情况需要手动对sessionId进行赋值，如sessionId_gsxt=${sessionId}
        var entName = '${entBasicInfo.entName }';
        try{
	        t1Collect_gsxt(); // 收集访问信息，每个页面都需要调用该方法
	        t2Collect_gsxt(entName); // 企业详情页收集被访问的企业名称，当用户进入企业详情页时，调用该方法，并将企业完整名称作为该方法的入参
        }catch(e){
        	
        }
    }
</script>	
</body>
</html>