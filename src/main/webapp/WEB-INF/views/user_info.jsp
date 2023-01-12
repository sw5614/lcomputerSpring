<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>현재 접속자 정보 </title>
</head>
<body>
	<h1>마이 페이지</h1>
	<hr>
        <div>
           <sec:authorize access="isAuthenticated()">
              <sec:authentication property="principal" var="principal"/>  <!--현재접속자 정보 ( session 정보 -->
               <h2> 사용자ID : ${principal.username}</h2>
               <h2> 사용자이름 : ${principal.uName}</h2>
               <h2> 비밀번호 : ${principal.password}</h2>
               <h2> 가입날짜 : ${principal.uDateTime}</h2>
               <h2> 권한 : ${principal.authorities}</h2>
           </sec:authorize>
           <a href="/">돌아가기</a>
        </div>
</body>
</html>
