<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
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
					<td align="center"><a href="/user/info?username=${item.username}" style="color:blue;">${item.username}</a></td>
					<td>${item.uName}</td>
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
						<ul>
			 <c:choose>    <%--switch 문  --%>
				<c:when test="${ pagination.prevPage >= 0}">   <!-- case 문  test 에는 조건// 페이지가 5보다크거나 같으면 ◀ 버튼 --> 
					<li>
						<a href="user-list.do?page=${pagination.prevPage}">   <!--  이전 페이지로  -->
							◀
						</a>
					</li>
				</c:when>
			</c:choose>    <%--switch 문 닫고  --%>
			<c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}" step="1"> <!-- var= 조건결과 저장할변수, step = 증가분 ("1"씩증가) --> 
					<c:choose> <%-- 두번쨰 switch --%>
						<c:when test="${ pagination.page == i }">      <!-- 누르려는 페이지값이 현재면 아무거도안함  -->
							<li style="background-color:#ededed;">
								<span id="currentPage" pageNo="${i}">${i}</span>  <!-- ????  -->
							</li>
						</c:when>
						<c:when test="${ pagination.page != i }">    <!--  누르려는 페이지값이  다른페이지면 링크띄움  -->
							<li>
								<a href="user-list.do?page=${i}">${i}</a>
							</li>
						</c:when>
					</c:choose> <%-- 두번쨰 switch 문 닫고 --%>
			</c:forEach>  <!-- 반복문 끝  -->
			 <c:choose>  	<%--swtich--%>
				<c:when test="${ pagination.nextPage < pagination.lastPage }"> <!-- nextpage 남아있으면 ? -->
					<li style="">
						<a href="user-list.do?page=${pagination.nextPage}"> <!-- nextpage 로 가는 버튼 생성   -->
						▶</a>
					</li>
				</c:when>
			</c:choose> 
		</ul>
	</div>
</html>