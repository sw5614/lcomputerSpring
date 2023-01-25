<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내용 상세</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<style>
ul {
		width:600px;
		height:50px;
		margin:10px auto;
}
	li {
		list-style:none;
		width:50px;
		line-height:50px;
		border:1px solid #ededed;
		float:left;
		text-align:center;
		margin:0 5px;
		border-radius:5px;
	}
	
table {
	border-collapse: collapse;
}
table tr th {
	font-weight: 700;
}
table tr td, table tr th {
	border: 1px solid #818181;
	width: 500px;
	text-align: center;
}
a {
	text-decoration: none;
	color: #000;
	font-weight: 700;
	border: none;
	cursor: pointer;
	padding: 10px;
	display: inline-block;
}
</style>
<body>
	<sec:authorize access="isAuthenticated()"> <!--  로그인했을때 (권한 상관없이 로그인 인증받았을때isAuthenticated()) -->
		 <sec:authentication property="principal" var="user"/> <!--var이랑 값이랑 매칭 현재접속자의 정보  -->
			<p  align= "right" ><a style="color:blue" href="/user/login_info" >${user.username}  </a>님 접속중</p> 
	 </sec:authorize>

	<h1>상세페이지</h1>
	<table>
	
		<colgroup>
		<col width="20%" >
		<col width="80%">
		</colgroup>
			<tr>
				<td>게시글 번호</td>
				<td>${board.bId}</td>
			</tr>
			<tr>
				<td>제목</td>
				<td>${board.bTitle}</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>${board.bWriter}</td>
			</tr>
			<tr>
				<td>작성 날짜</td>
				<td>${board.bDateTime}</td>
			</tr>
			<tr>
				<td>내용</td>
				<td height="300">${board.bContent}</td>
			</tr>
			<tr>
				<td>이미지</td>
			<%-- 	<td><img src="${fpath}"></td> --%> <!-- 파일업로드 나중에 따로 -->
			</tr>
	</table>
	<a href="/board/beforeedit?bId=${board.bId}" style="width: 10%; background-color: #818181; color: #fff;">수정</a>
	<a href="/board/delete?bId=${board.bId}"	style="width: 10%; font-weight: 700; background-color: red; color: #fff;">삭제</a>
	<a href="/board/list" style="width: 10%; font-weight: 500; background-color: green; color: #fff;">목록</a>		
	<a href="/board/beforereply?bId=${board.bId}&bGroup=${board.bGroup}&bOrder=${board.bOrder}&bDepth=${board.bDepth}"	style="width: 10%; font-weight: 500; background-color: blue; color: #fff;">답글</a>
	
	<br></br>
   
   

    <br></br>
    <sec:authorize access="isAuthenticated()">
      <sec:authentication property="principal" var="user"/>  <!--현재접속자 정보 ( session 정보) -->
        <p> 작성자 :<input type="hidden" name="cWriter" value="${user.username}" >${user.username}</p>
    </sec:authorize>  
     내용 : <textarea rows="1" cols="80" name="cContent"  ></textarea> 
     
    <p align="center"><input type="button" value="댓글올리기" class="btnCommentWrite" page="${pagination.page }"> </p> <!--  comment.c_writer --><!--  여기도 comment 객체 넘기기  -->
    
    <a href="#"></a>
	
	
	
	</body>
	</html>