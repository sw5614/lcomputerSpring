<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
	<div id="user-list">
	<table >
	<colgroup>
	<col width="5%" >
	<col width="5%" align="left" >
	<col width="10%">
	<col width="5%">
	<col width="5%">
	</colgroup>
	<tr>
		<th>ID</th>
		<th>사용자이름</th>
		<th>가입날짜</th>
		<th>현재 권한</th>
		<th>권한 처리</th>
	</tr>
		<c:forEach items="${list}" var="item">
			 <tr>
				<td align="center">${item.username}</td>
				<td >${item.uName}</td>
				<%--<td align="center">${item.u_name}</td> 작성자이름 --%>
				<td>${item.uDateTime}</td>
				<td>${item.uAuth}
		<c:choose> 
			<c:when test="${fn:contains(item.uAuth, 'ROLE_USER')}">
				<td><button type="button" class="adminLevel" u_auth="ROLE_ADMIN" username="${item.username}" >관리자권한 부여 </button></td>
			</c:when>
			<c:when test="${fn:contains(item.uAuth, 'ROLE_ADMIN')}">
				<td><button type="button" class="normalLevel" u_auth="ROLE_USER" username="${item.username}">일반권한 부여 </button></td>
			</c:when>
		</c:choose>
		     </tr>
		</c:forEach>
	</table>
	</div>
</html>