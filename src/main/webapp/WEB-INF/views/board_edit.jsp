<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
</head>
<body>

<h2> 게시글 수정  </h2>
<form action="/board/edit?bId=${board.bId}"  method="post">          <!-- name = user 속성으로 전달  -->
	<p>	작성자 : ${board.bWriter} 님 </p>
	<p> 제목 : <input type="text" name="bTitle" value="${board.bTitle}"> </p>     <!--name = id ->  user 의 id 입력값  로 전달  -->
	<p> 내용 : <textarea rows="10" cols="80" name="bContent" placeholder="${board.bContent}"></textarea></p>
	<p> <input type="submit" value="수정하기"></p>
</form>

</body>
</html>