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
		width:500px;
		padding:5x
	}
	
	a {
		text-decoration:none;
		color:#000;
		font-weight:700;
	}
</style>
<body>
	<p align= "right">${sessionScope.user.u_name} 님 접속중 </p> <!--  세션값 이용방법 확인해보기  -->
	<h1>게시글 목록</h1>
	<table >
<colgroup>
	<col width="5%" >
	<col width="60%" align="left" >
	<col width="5%">
	<col width="10%">
	</colgroup>
		<c:forEach items="${list}" var="item">
			 <tr>
				<td align="center">${item.bId}</td>
				<td >${item.bTitle}</td>
				<td >${item.bWriter}</td>
				<%--<td align="center">${item.u_name}</td> 작성자이름 --%>
				<td>${item.bDateTime}</td>
		     <tr>
		</c:forEach>
	</table>
</body>
</html>