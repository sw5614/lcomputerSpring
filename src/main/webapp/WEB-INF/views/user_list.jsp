<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
</head>
<style>
    h1 {
		text-align:center;
	}
	table {
		border-collapse:collapse;
		margin:40px auto;
	}
	table tr th {
		font-weight:700;
	}
	table tr td, table tr th {
		border:1px solid #818181;
		width:200px;
		text-align:center;
	}
	a {
		text-decoration:none;
		color:#000;
		font-weight:700;
	}
</style>
<body>

	<p align= "right">${sessionScope.user.u_name} 님 접속중 </p> <!--  세션값 이용방법 확인해보기  -->
	<h1>유저 목록</h1>
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
				<td>${item.authorities}
		     <tr>
		</c:forEach>
	</table>
</body>
</html>