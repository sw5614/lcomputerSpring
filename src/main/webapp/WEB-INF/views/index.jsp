<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOME </title>
</head>
<style>
	body{
		margin:0;
		padding:0;
	}
	div:nth-child(1){
		background-color:rgba(75,189,217,0.1);
		padding:10px 30px;
		font-size:1.2rem;
		font-weight:700;
		}
	div:nth-child(2){
		width:200px;
	}
	div ul{
		width:100%;
		text-align:center;
		list-style:none;
		padding:0;
		
	}
	div ul li {
		padding:10px;
		font-size:1rem;
		background-color:rgba(75,189,217,0.1);
		border-radius:10px;
		margin:10px;
		font-weight:700;
		box-shadow:2px 3px 3px #bbbbbb;
		
	}
	div ul li a {
		text-decoration:none;
		color:#333333;
	}
</style>
<body>
        <hr>
          	<div>
	           <sec:authorize access="isAuthenticated()"> <!--  로그인했을때 (권한 상관없이 로그인 인증받았을때isAuthenticated()) -->
	           <sec:authentication property="principal" var="principal"/> <!--var이랑 값이랑 매칭 현재접속자의 정보  -->
	              <h2>${principal.uName} 접속중 </h2>   
		 			<ul>
			 			 <li><a href="/logout">로그아웃</a></li>
			 			 <li><a href="/board/list">게시판</a></li>
					</ul>       	    
	       	    </sec:authorize>
           	</div>
        
            <div>
	            <sec:authorize access="isAnonymous()"> <!--로그인하지 않았을때 ( 권한없는 익명사용자일경우 isAnonymous()  ) -->
		        	<ul>
			              <li><a href="/login">로그인</a></li>
			              <li><a href="/beforeSignUp">회원가입</a></li>
			    	</ul>
		     	</sec:authorize>   
  			</div>    
 			
 			<div  style="width:200px">
	         	<sec:authorize access="isAuthenticated()">        
		             <ul>
			               <li><a href="/user/login_info">내 정보</a></li>
			               <li><a href="/admin">관리자</a></li>
			    	 </ul>
		    	</sec:authorize>
			</div>    	
</body>
</html>
