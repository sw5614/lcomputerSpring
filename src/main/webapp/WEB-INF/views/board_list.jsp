<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
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
    h1 {
		text-align:center;
	}
	table { 
		border-collapse:collapse;
		margin:40px auto;
	}
	table tr th {
		font-weight:700;
	}
	table tr td, table tr th {
		border:1px solid #818181;
		width:500px;
		padding:5x
	}
	
	a {
		text-decoration:none;
		color:#000;
		font-weight:700;
	}
	
	b {
		width: 70%;
		font-size:2em;
		font-weight: 900;
		background-color: #6DD66D;
	 }
	
</style>
<body>
	<sec:authorize access="isAuthenticated()"> <!--  로그인했을때 (권한 상관없이 로그인 인증받았을때isAuthenticated()) -->
		 <sec:authentication property="principal" var="user"/> <!--var이랑 값이랑 매칭 현재접속자의 정보  -->
			<p  align= "right" ><a style="color:blue" href="/user/login_info" >${user.username}  </a>님 접속중</p> 
	 </sec:authorize>
	
	<h1>게시글 목록</h1>
	<table >
<colgroup>
	<col width="5%" >
	<col width="60%" align="left" >
	<col width="5%">
	<col width="10%">
	</colgroup>
		<c:forEach items="${list}" var="item">
			 <tr>
				<td align="center">${item.bId}</td>
				<td><a href="/board/info?bId=${item.bId}" >
				<c:forEach begin="1" end="${item.bDepth}" step="1">
				<d style="color:red">RE</d>
				</c:forEach>
				${item.bTitle}</a></td>
				<td>${item.bWriter}</td>
				<td>${item.bDateTime}</td>
		     <tr>
		</c:forEach>
	</table>
			<ul>
			 <c:choose>    <%--switch 문  --%>
				<c:when test="${ pagination.prevPage < 1 }">
					<li style="display:none;">
						<span>◀</span>
					</li>
				</c:when>
				<c:when test="${pagination.prevPage >= 1}">   <!-- case 문  test 에는 조건// 페이지가 5보다크거나 같으면 ◀ 버튼 --> 
					<li> 
						<a href="/board/list?page=${pagination.prevPage}">   <!--  이전 페이지로  -->
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
                            <c:if test="${search.select==null}">
                                <a href="/board/list?page=${i}">${i}</a>
                            </c:if>
                            <c:if test="${search.select!=null}">    
                                <a href="/board/list?select=${search.select}&keyword=${search.keyword}&page=${i}">${i}</a>
                            </c:if>
                            </li>
                        </c:when>
					</c:choose> <%-- 두번쨰 switch 문 닫고 --%>
			</c:forEach>  <!-- 반복문 끝  -->
			 <c:choose>  	<%--swtich--%>
				<c:when test="${ pagination.nextPage < pagination.lastPage }"> <!-- nextpage 남아있으면 ? -->
					<li style="">
						<a href="/board/list?page=${pagination.nextPage}"> <!-- nextpage 로 가는 버튼 생성   -->
						▶</a>
					</li>
				</c:when>
			</c:choose> 
		</ul>
		
	<div align="center">
<form action="/board/list" method="get" name="board_search">
    <select name="select" >
            <option value=b_title>제목</option>
            <option value=b_content>제목+내용</option>
            <option value=b_writer>작성자</option>
    </select>
    <input class=textform type=text name=keyword id="search_box"  placeholder="검색어 입력하세요." >
    <input class=submit type=submit value=검색>
</form>

</div>	
		
	<b><a href="/board/beforewrite"> 글작성 </a></b>
	&nbsp;&nbsp;&nbsp;&nbsp;
	<b><a href="/"> 홈화면 </a></b>
	
	
	
</body>
</html>