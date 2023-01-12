<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
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
	<sec:authorize access="isAuthenticated()"> <!--  로그인했을때 (권한 상관없이 로그인 인증받았을때isAuthenticated()) -->
	 <sec:authentication property="principal" var="user"/> <!--var이랑 값이랑 매칭 현재접속자의 정보  -->
		<p align= "right">${user.username} 님 접속중 </p> 
	 </sec:authorize>
	<h1>유저 목록</h1>
	
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

	<a href="/" style="width: 70%; font-size:2em; font-weight: 900; background-color: blue; color: #fff;">홈 화면으로</a> 
<script>

$(document).on('click', '.adminLevel' , function () { // 관리자권한추가 
	let username =$(this).attr('username');
	let u_auth=$(this).attr('u_auth');
	<%--let pageNo = $('#currentPage').attr('pageNo');--%>
	
$.ajax({
	  method: "POST",
	  url: "/user/authEdit",
	  data: { username:username, uAuth:u_auth}
})
.done(function( html ) {
    $('#user-list').html(html);
});
});
$(document).on('click', '.normalLevel' , function () { // 일반권한추가 
	let username =$(this).attr('username');
	let u_auth=$(this).attr('u_auth');
	<%--let pageNo = $('#currentPage').attr('pageNo'); --%>
	
$.ajax({
	  method: "POST",
	  url: "/user/authEdit",
	  data: { username:username, uAuth:u_auth}
})
.done(function( html ) {
    $('#user-list').html(html);
});
});

</script>	
	
</body>
</html>