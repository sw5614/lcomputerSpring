<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
</head>
<body>

<h2> 글쓰기 </h2>
<form action="/board/reply" name="board" method="post" enctype="multipart/form-data">
		<input type="hidden" name="bGroup" value="${board.bGroup}">   
		<input type="hidden" name="bOrder" value="${board.bOrder}">   
		<input type="hidden" name="bDepth" value="${board.bDepth}">
	<sec:authorize access="isAuthenticated()">
      <sec:authentication property="principal" var="user"/>  <!--현재접속자 정보 ( session 정보) -->
		<p> 작성자 :<input type="hidden" name="bWriter" value="${user.username}" >${user.username}</p>
	</sec:authorize>
		<p> 제목: <input type="text" name="bTitle"></p>
		<p> 내용 : <textarea rows="10" cols="80" name="bContent"></textarea></p>
		<p> 파일 업로드: <input type="file" name="uploadFile"><br>
		<p> <input type="submit" value="작성하기"></p>
</form>
</body>
</html>