<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>����� ���� </title>
</head>
<body>
	<h1>����� ���� </h1>
	<hr>
        <div>
               <h2> �����ID : ${user.username}</h2>
               <h2> ������̸� : ${user.uName}</h2>
               <h2> ��й�ȣ : ${user.password}</h2>
               <h2> ���Գ�¥ : ${user.uDateTime}</h2>
               <h2> ���� : ${user.authorities}</h2>
           <a href="/">���ư���</a>
        </div>
</body>
</html>
