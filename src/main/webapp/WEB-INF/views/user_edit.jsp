
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 수정</title>
</head>
<body>

<h2> 회원정보수정  </h2>
<form action="/user/edit"  method="post"> 
	<input type="hidden" name="username" value="${user.username}" >          <!-- name = user 속성으로 전달  -->
	<p> 아이디 : ${user.username} </p>     <!--name = id ->  user 의 id 입력값  로 전달  -->
	<p> 비밀번호 : <input type="password" name="password" value="${user.password}"></p>
	<p> 이름 : <input type="text" name="uName" value="${user.uName}"></p>
	<p> <input type="submit" value="수정하기"></p>
</form>

</body>
</html>