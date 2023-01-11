<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Spring 게시판 </title>
</head>
<body>
        <hr>
        <div>
            <sec:authorize access="isAuthenticated()"> <!--  로그인했을때 (권한 상관없이 로그인 인증받았을때isAuthenticated()) -->
              <sec:authentication property="principal" var="principal"/> <!--var이랑 값이랑 매칭 현재접속자의 정보  -->
              <h2>${principal.uName} 접속중 </h2>   
 			  <a href="/logout">로그아웃</a>
 			  <a href="/board/list">게시판</a>
 			  <a href="/user/list">회원목록</a>
            </sec:authorize>
           <sec:authorize access="isAnonymous()"> <!--로그인하지 않았을때 ( 권한없는 익명사용자일경우 isAnonymous()  ) -->
              <a href="/login">로그인</a>
              <a href="/beforeSignUp">회원가입</a>
           </sec:authorize>   
        </div>
        <div>
         <sec:authorize access="isAuthenticated()">        
               <a href="/user/info">내 정보</a>
               <a href="/admin">관리자</a>
            </sec:authorize>
        </div>   
</body>
</html>
