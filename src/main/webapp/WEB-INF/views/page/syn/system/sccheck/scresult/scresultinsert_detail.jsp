<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:useBean id="now" class="java.util.Date" />
<!doctype html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="renderer" content="webkit">
    <meta charset="utf-8">
    <title></title>
    <link rel="stylesheet" href="/css/syn.css">
    <link rel="stylesheet" href="/css/vendor/dataTables.bootstrap.min.css">
</head>
<body class="pd10">
<div class="print-nocard">
    <h3>市场监管领域随机抽查情况记录表</h3>
    <div class="mt10">
        <div class="tabbale" data-component="tab">
            <div class="tab-content">
              	<div class="tab-panel tab-panel-show" id="itemPanelDivId">
              	<form id="taskForm" method="post">
              	<input type="hidden" name="taskUid" value="${pubScentResultDto.taskUid }">
                    <div class="mt10">
                        <table cellpadding="0" cellspacing="0" border="0" width="100%" class="table-horizontal table-form">
                            <tbody>
                            	<tr>
	                                <td class="bg-gray right" width="15%">任务名称</td>
	                                <td width="35%">${pubScentResultDto.taskName }</td>
	                                <td class="bg-gray right" width="15%">任务编号</td>
	                                <td width="35%">${pubScentResultDto.taskCode }</td>
	                            </tr>
	                            <tr>
	                                <td class="bg-gray right">被检查对象</td>
	                                <td>${pubScentResultDto.entName }</td>
	                                <td class="bg-gray right">统一信用代码/注册号</td>
	                                <td>${!empty pubScentResultDto.uniCode?pubScentResultDto.uniCode:pubScentResultDto.regNO}</td>
	                            </tr>
	                            <tr>
	                                <td class="bg-gray right" rowspan="2">住所地址</td>
	                                <td rowspan="2">${pubScentResultDto.dom }</td>
	                                <td class="bg-gray right">法定代表人</td>
	                                <td>${pubEppassword.lerep } ${pubEppassword.lerepphone }</td>
	                            </tr>
	                            <tr>
	                                <td class="bg-gray right">工商联络员</td>
	                                <td>${pubEppassword.lianame } ${pubEppassword.tel }</td>
	                            </tr>
	                         </tbody>
	                       </table>
	                       <table id="table2" cellpadding="0" cellspacing="0" border="0" width="100%" class="table-horizontal table-form">
	                       	  <tbody>
	                            <tr>
	                                <td class="bg-gray center" width="18%">检查事项</td>
	                                <td class="bg-gray center" width="12%">
	                                	是否检查
	                                </td>
	                                <td class="bg-gray center" width="35%">发现问题情况</td>
	                                <td class="bg-gray center" width="35%">处置情况</td>
	                            </tr>
	                            <c:forEach var="pubSccheckItemResultList" items="${pubSccheckItemResultList }" varStatus="status">
		                            <tr>
		                                <td>${status.index + 1}. ${pubSccheckItemResultList.checkName }</td>
		                                <td class="center">
		                                	<input type="checkbox" class="chk" value="${pubSccheckItemResultList.checkCode }" name="chk_${pubSccheckItemResultList.checkCode }"
		                                		<c:if test="${not empty pubSccheckItemResultList.problem}">checked </c:if> 
		                                	>是
		                                </td>
		                                <td><textarea class="prodis" 
		                                	 style="<c:if test='${empty pubSccheckItemResultList.problem }'>display: none;</c:if>overflow-y:auto;"
		                               id="problem_${pubSccheckItemResultList.checkCode }" name="problem_${pubSccheckItemResultList.checkCode }" >${pubSccheckItemResultList.problem }</textarea></td>
		                                <td><textarea class="prodis" 
		                                	 style="<c:if test='${empty pubSccheckItemResultList.dispose }'>display: none;</c:if>overflow-y:auto;" 
		                                id="dispose_${pubSccheckItemResultList.checkCode }" name="dispose_${pubSccheckItemResultList.checkCode }" >${pubSccheckItemResultList.dispose }</textarea></td>
		                            </tr>
	                            </c:forEach>
	                          </tbody>
	                       </table>
	                       <table cellpadding="0" cellspacing="0" border="0" width="100%" class="table-horizontal table-form">
	                       	  <tbody>
	                            <tr>
	                                <td class="bg-gray center">核查方式</td>
	                                <td colspan="2">
	                                	<input type="hidden" name="checkType" id="checkType">
	                                	<input type="checkbox" value="1" name="checkTypeTmp"
	                                		<c:if test="${fn:indexOf(pubScentResultDto.checkType, 1)!=-1}">checked</c:if>
	                                	>实地检查 
		                                <input type="checkbox" value="2" name="checkTypeTmp"
		                                	<c:if test="${fn:indexOf(pubScentResultDto.checkType, 2)!=-1}">checked</c:if>
		                                >书面检查 
		                                <input type="checkbox" value="3" name="checkTypeTmp"
		                                	<c:if test="${fn:indexOf(pubScentResultDto.checkType, 3)!=-1}">checked</c:if>
		                                >行政部门检查结果或专业意见
		                                <input type="checkbox" value="4" name="checkTypeTmp"
		                                	<c:if test="${fn:indexOf(pubScentResultDto.checkType, 4)!=-1}">checked</c:if>
		                                >检验检测
		                                <input type="checkbox" value="5" name="checkTypeTmp"
		                                	<c:if test="${fn:indexOf(pubScentResultDto.checkType, 5)!=-1}">checked</c:if>
		                                >网络监测
		                                <input type="checkbox" value="6" name="checkTypeTmp"
		                                	<c:if test="${fn:indexOf(pubScentResultDto.checkType, 6)!=-1}">checked</c:if>
		                                >委托专业机构辅助 
	                                 </td>
	                            </tr>
	                           <c:set value="${fn:split(pubScentResultDto.checkResult, ',') }" var="str1" />
	                            <tr>
	                                <td class="bg-gray center" rowspan="5" width="20%">检查结果</td>
	                                <td><input type="checkbox" value="1" name="checkResultTmp" width="40%"
									 	<c:forEach items="${str1 }" var="it">
	                                		<c:if test="${it=='1'}">checked</c:if>
	                                	</c:forEach>
	                                >未发现违法行为
	                                
	                                </td>
	                                <td><input type="checkbox" value="6" name="checkResultTmp" width="40%"
	                                	<c:forEach items="${str1 }" var="it">
	                                		<c:if test="${it=='6'}">checked</c:if>
	                                	</c:forEach>
	                                >查无下落
	                            </tr>
	                            <tr>
	                                <td><input type="checkbox" value="2" name="checkResultTmp"
	                                	<c:forEach items="${str1 }" var="it">
	                                		<c:if test="${it=='2'}">checked</c:if>
	                                	</c:forEach>
	                                >违反工商行政管理相关规定</td>
	                                <td><input type="checkbox" value="7" name="checkResultTmp"
	                                	<c:if test="${fn:indexOf(pubScentResultDto.checkResult, 7)!=-1}">checked</c:if>
	                                >已关闭停业或正在清算</td>
	                            </tr>
	                            <tr>
	                                <td><input type="checkbox" value="3" name="checkResultTmp"
	                                	<c:forEach items="${str1 }" var="it">
	                                		<c:if test="${it=='3'}">checked</c:if>
	                                	</c:forEach>
	                                >违反食品药品管理相关规定</td>
	                                <td><input type="checkbox" value="8" name="checkResultTmp"
	                                	<c:if test="${fn:indexOf(pubScentResultDto.checkResult, 8)!=-1}">checked</c:if>
	                                >不予配合情节严重</td>
	                            </tr>
	                            <tr>
	                                <td><input type="checkbox" value="4" name="checkResultTmp"
	                                	<c:forEach items="${str1 }" var="it">
	                                		<c:if test="${it=='4'}">checked</c:if>
	                                	</c:forEach>
	                                >违反质量技术监督相关规定</td>
	                                <td>
	                                	<input type="checkbox" value="9" name="checkResultTmp"
	                                		<c:if test="${fn:indexOf(pubScentResultDto.checkResult, 9)!=-1}">checked</c:if>
	                                	>注销
	                                	<input type="checkbox" value="10" name="checkResultTmp"
	                                		<c:if test="${fn:indexOf(pubScentResultDto.checkResult, 10)!=-1}">checked</c:if>
	                                	>被吊销
	                                	<input type="checkbox" value="11" name="checkResultTmp"
	                                		<c:if test="${fn:indexOf(pubScentResultDto.checkResult, 11)!=-1}">checked</c:if>
	                                	>被撤销
	                                	<input type="checkbox" value="12" name="checkResultTmp"
	                                		<c:if test="${fn:indexOf(pubScentResultDto.checkResult, 12)!=-1}">checked</c:if>
	                                	>迁出
	                                </td>
	                            </tr>
	                            <tr>
	                                <td colspan="2"><input type="checkbox" value="5" name="checkResultTmp"
	                                	<c:if test="${fn:indexOf(pubScentResultDto.checkResult, 5)!=-1}">checked</c:if>
	                                >违反其他部门相关规定</td>
	                            </tr>
	                            <tr>
	                                <td class="bg-gray center">后续处置措施</td>
	                                <td colspan="2">
	                                	<textarea name="disposeMss" rows="5" cols="30">${pubScentResultDto.disposeMss }</textarea>
	                                 </td>
	                            </tr>
	                          </tbody>
	                       </table>
	                       <table cellpadding="0" cellspacing="0" border="0" width="100%" class="table-horizontal table-form">
	                       		<tr>
	                       			<td class="bg-gray right" width="15%">后续处置措施是否完结</td>
	                       			<td width="35%">
	                       				<input type="radio" value="1" name="disposeState"
	                       					<c:if test="${fn:indexOf(pubScentResultDto.disposeState, 1)!=-1}">checked</c:if>
	                       				>未完结 
	                       				<input type="radio" value="2" name="disposeState"
	                       					<c:if test="${fn:indexOf(pubScentResultDto.disposeState, 2)!=-1}">checked</c:if>
	                       				>已完结<span class="sp"><textarea rows="2" name="disposeFinishMss">${pubScentResultDto.disposeFinishMss }</textarea></span>
	                       			</td>
	                       			<td class="bg-gray right" width="15%">完结日期</td>
	                       			<td width="35%"><input type="text" name="disposeFinishDate" class="ipt-txt laydate-icon" onclick="laydate()" readonly="readonly" value="<fmt:formatDate value='${pubScentResultDto.disposeFinishDate }' pattern='yyyy-MM-dd'/>"/></td>
	                       		</tr>
	                       		<tr>
	                       			<td class="bg-gray right">检查执行部门</td>
	                       			<td colspan="3"><input name="checkDeptName" type="text" value="${pubScentResultDto.checkDeptName }"></td>
	                       		</tr>
	                       		<tr>
	                       			<td class="bg-gray right">检查人员</td>
	                       			<td><input type="text" name="checkDeptPerson" value="${pubScentResultDto.checkDeptPerson }"></td>
	                       			<td class="bg-gray right">检查日期</td>
	                       			<td><input name="checkDate" type="text" class="ipt-txt laydate-icon" onclick="laydate()" readonly="readonly" value="<fmt:formatDate value='${pubScentResultDto.checkDate }' pattern='yyyy-MM-dd'/>"/></td>
	                       		</tr>
	                       		<tr>
	                       			<td class="bg-gray right">录入员</td>
	                       			<td><input type="text" disabled="disabled" name="checkDeptPerson" value="${pubScentResultDto.enterUserName }"></td>
	                       			<td class="bg-gray right">录入日期</td>
	                       			<td><input disabled="disabled" name="enterDate" type="text" class="ipt-txt laydate-icon" onclick="laydate()" readonly="readonly" value="<fmt:formatDate value='${pubScentResultDto.enterDate }' pattern='yyyy-MM-dd'/>"/></td>
	                       		</tr>
	                       		<tr>
	                       			<td class="bg-gray right">审核结果</td>
	                       			<td><input type="radio" class="pa" name="auditState" value="5"
	                       				<c:if test="${pubScentResultDto.auditState=='5' }">checked</c:if>
	                       			>通过
	                       			   <input type="radio" class="pa" name="auditState" value="4"
	                       			   		<c:if test="${pubScentResultDto.auditState=='4' }">checked</c:if>
	                       			   >不通过</td>
	                       			<td class="bg-gray right">审核员</td>
	                       			<td><input disabled="disabled" name="auditUserName" type="text" value="${pubScentResultDto.auditUserName }"/></td>
	                       		</tr>
	                       		<tr>
	                       			<td class="bg-gray right">审核意见</td>
	                       			<td><input type="text" readonly="readonly" id="auditOpinion" name="auditOpinion" value="${pubScentResultDto.auditOpinion }"></td>
	                       			<td class="bg-gray right">审核日期</td>
	                       			<td><input name="auditDate" type="text" class="ipt-txt laydate-icon" onclick="laydate()" readonly="readonly" value="<fmt:formatDate value='${pubScentResultDto.auditDate }' pattern='yyyy-MM-dd'/>"/></td>
	                       		</tr>
	                       </table>
                    </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="/js/lib/require.js"></script>
<script src="/js/config.js"></script>
</body>
</html>