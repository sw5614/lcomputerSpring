<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ������ ���� </title>
</head>
<body>
	<h1>���� ������</h1>
	<hr>
        <div>
           <sec:authorize access="isAuthenticated()">
              <sec:authentication property="principal" var="principal"/>  <!--���������� ���� ( session ���� -->
               <h2> �����ID : ${principal.username}</h2>
               <h2> ������̸� : ${principal.uName}</h2>
               <h2> ��й�ȣ : ${principal.password}</h2>
               <h2> ���Գ�¥ : ${principal.uDateTime}</h2>
               <h2> ���� : ${principal.authorities}</h2>
           </sec:authorize>
           <a href="/">���ư���</a>
        </div>
</body>
</html>
