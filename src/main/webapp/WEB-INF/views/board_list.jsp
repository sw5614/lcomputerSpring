<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
		color:#F4FFFF;
		font-weight:700;
	}
	
	b {
		width: 70%;
		font-size:2em;
		font-weight: 900;
		background-color: #6DD66D;
	 }
	
</style>
<body>
	<sec:authorize access="isAuthenticated()"> <!--  로그인했을때 (권한 상관없이 로그인 인증받았을때isAuthenticated()) -->
		 <sec:authentication property="principal" var="user"/> <!--var이랑 값이랑 매칭 현재접속자의 정보  -->
			<p  align= "right" ><a style="color:blue" href="/user/login_info" >${user.username}  </a>님 접속중</p> 
	 </sec:authorize>
	
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
				<td>${item.bDateTime}</td>
		     <tr>
		</c:forEach>
	</table>
	
	<b><a href="/board/beforewrite"> 글작성 </a></b>
	&nbsp;&nbsp;&nbsp;&nbsp;
	<b><a href="/"> 홈화면 </a></b>
	
</body>
</html>