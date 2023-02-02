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
			
			<c:forEach items ="${board.uploadfiles}" var="item" varStatus="status"> 
			<tr>
				<td>이미지</td>
				<td><img src="/image/${item.tUpload}" style="width:30%; height:30%;"></td>  <!-- 파일업로드 나중에 따로 -->
			</tr>
			</c:forEach>
	</table>
	<a href="/board/beforeedit?bId=${board.bId}" style="width: 10%; background-color: #818181; color: #fff;">수정</a>
	<a href="/board/delete?bId=${board.bId}"	style="width: 10%; font-weight: 700; background-color: red; color: #fff;">삭제</a>
	<a href="/board/list" style="width: 10%; font-weight: 500; background-color: green; color: #fff;">목록</a>		
	<a href="/board/beforereply?bId=${board.bId}&bGroup=${board.bGroup}&bOrder=${board.bOrder}&bDepth=${board.bDepth}"	style="width: 10%; font-weight: 500; background-color: blue; color: #fff;">답글</a>
	
	<br></br>
	
	<div id="aj_comment_list" >
		<table align="center">
				<c:forEach items="${list}" var="item">  <!--  comment 를 리스트로 받자  -->
				 <tr >
				 	<td style= "width: 10%" align="left">${item.cWriter} </td>
					<td style="text-align:left" >
					<c:forEach begin="1" end="${item.cDepth}" step="1">
					<d style="color:red">RE</d>
					</c:forEach>
					${item.cContent} </td>
					<td style= "width: 15%" >${item.cDateTime}</td>
					<td style= "width: 5%"><button type="button" class="replyComment" c_group="${item.cGroup}" c_order="${item.cOrder}"c_depth="${item.cDepth}" >대댓글</button></td>
					<td style= "width: 5%"><button type="button" class="editComment" c_id="${item.cId}" >수정</button></td>
					<td style= "width: 5%"><button type="button" class="deleteComment" c_id="${item.cId}">삭제</button></td>
			     </tr>
			    <tr style="display: none; ">
			     	<td colspan="3" ><textarea style="width:80%;" rows="1" name="content"></textarea></td>
			     	<td colspan="3" >
			     		<button type="button" class="reply" c_group="${item.cGroup}" c_order="${item.cOrder}" c_depth="${item.cDepth}" b_id="${board.bId}" >답글등록</button>
			     		<button type="button" class="cancleR">취소</button>
			     	</td>
			    </tr>
				<tr style="display: none; ">
			     	<td colspan="3" ><textarea style="width:80%;" rows="1" name="content" ></textarea></td>
			     	<td colspan="3" >
			     		<button type="button" class="edit" c_idx="${item.cId}" >수정등록</button>
			     		<button type="button" class="cancleE">취소</button>
			   		</td>
			     </tr>
			</c:forEach>
		</table>   
		
		<ul >  <!--  페이지네이션  -->
			 <c:choose>    <%--switch 문  --%>
				<c:when test="${ pagination.prevPage < 1 }">
					<li style="display:none;">
						<span>◀</span>
					</li>
				</c:when>
				<c:when test="${pagination.prevPage >= 1}">   <!-- case 문  test 에는 조건// 페이지가 5보다크거나 같으면 ◀ 버튼 -->
						<a href="#" class="prevpage"  Pagination.page="${pagination.prevPage}"> <!-- nextpage 로 가는 버튼 생성   -->
						◀</a>
				</c:when>
			</c:choose>    <%--switch 문 닫고  --%>
			<c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}" step="1"> <!-- var= 조건결과 저장할변수, step = 증가분 ("1"씩증가) --> 
					<c:choose> <%-- 두번쨰 switch --%>
						<c:when test="${ pagination.page == i }">      <!-- 누르려는 페이지값이 현재면 아무거도안함  -->
								<span id="currentPage" pageNo="${i}" >${i}</span>  <!-- ????  -->
						</c:when>
						<c:when test="${ pagination.page != i }">    <!--  누르려는 페이지값이  다른페이지면 링크띄움  -->
								<a href="#" class="pageLink" Pagination.page="${i}">${i}</a>
						</c:when>
					</c:choose> <%-- 두번쨰 switch 문 닫고 --%>
			</c:forEach>  <!-- 반복문 끝  -->
			 <c:choose>  	<%--swtich--%>
				<c:when test="${ pagination.nextPage < pagination.lastPage }"> <!-- nextpage 남아있으면 ? -->
						<a href="#" class="nextpage"  Pagination.page="${pagination.nextPage}"> <!-- nextpage 로 가는 버튼 생성   -->
						▶</a>
				</c:when>
			</c:choose> 
		</ul>
   </div>

    <sec:authorize access="isAuthenticated()">
      <sec:authentication property="principal" var="user"/>  <!--현재접속자 정보 ( session 정보) -->
        <p> 작성자 :<input type="hidden" name="cWriter" value="${user.username}" >${user.username}</p>
    </sec:authorize>  
    <p> 내용 : <textarea rows="1" cols="80" name="cContent"  ></textarea> </p>
    <p align="center"><input type="button" value="댓글올리기" class="btnCommentWrite" page="${pagination.page }"> </p> <!--  comment.c_writer --><!--  여기도 comment 객체 넘기기  -->
    
    <a href="#"></a>
	
	<script>
	
	$(document).on('click', '.btnCommentWrite', function () {  // 댓글작성 
			//let Writer = $('input[name=writer]').val();
			let bIdx = '${board.bId}';
			let content = $(this).parent().prev().find("textarea[name='cContent']").val();
			let writer ='${user.uName}';
			let Uid='${user.username}';
			$.ajax({
				  method: "POST",
				  url: "/comment/write",
				  data: { bId:bIdx, cContent:content, cWriter:writer ,username:Uid}
			})
			.done(function( html ) {
			    $('#aj_comment_list').html(html);
			});
		});
	
	$(document).on('click', '.pageLink', function () { // 페이지선택 
		let page= $(this).attr('Pagination.page');
		let b_idx = '${board.bId}';
		$.ajax({
			  method: "POST",
			  url: "/comment/comment_list",
			  data: {page:page, bId:b_idx}     
		})
	.done(function( html ) {
	    $('#aj_comment_list').html(html);
	});
	});
	
	$(document).on('click', '.nextpage', function () { // 다음페이지 화살표선택  
		let page= $(this).attr('Pagination.page');
		let b_idx = '${board.bId}';
		$.ajax({
			  method: "POST",
			  url: "/comment/comment_list",
			  data: {page:page, bId:b_idx}    
		})
	.done(function( html ) {
	    $('#aj_comment_list').html(html);
	});
	});
	
	$(document).on('click', '.prevpage', function () { // 이전페이지 화살표 선택 
		let page= $(this).attr('Pagination.page');
		let b_idx = '${board.bId}';
		$.ajax({
			  method: "POST",
			  url: "/comment/comment_list",
			  data: {page:page, bId:b_idx}    
		})
	.done(function( html ) {
	    $('#aj_comment_list').html(html);
	});
	});
	
	$(document).on('click', '.editComment', function () { // 댓글수정창 보이기 
		$(this).parent().parent().next().next().css('display', '');
	});
	
	$(document).on('click', '.edit', function () { //댓글수정 
		let c_idx= $(this).attr('c_idx');
		let b_idx = '${board.bId}';
		let content = $(this).parent().prev().find('textarea[name=content]').val();
		let pageNo = $('#currentPage').attr('pageNo');
	$.ajax({
		  method: "POST",
		  url: "/comment/edit",
		  data: { cId:c_idx, bId:b_idx, cContent:content, page:pageNo}
	})
	.done(function( html ) {
	    $('#aj_comment_list').html(html);
	});
	});
	
	$(document).on('click', '.deleteComment', function () { <!-- 댓글삭제 -->
	let c_idx= $(this).attr('c_id');
	let b_idx = '${board.bId}';
	let pageNo = $('#currentPage').attr('pageNo');
	$.ajax({
		  method: "POST",
		  url: "/comment/delete",
		  data: { cId:c_idx, bId:b_idx, page:pageNo}
	})
	.done(function( html ) {
	    $('#aj_comment_list').html(html);
	});
	});
	
	$(document).on('click', '.reply', function () { // 대댓글  
		let c_group= $(this).attr('c_group');
		let c_order= $(this).attr('c_order');
		let c_depth= $(this).attr('c_depth');
		let b_idx='${board.bId}';
		let c_writer='${user.uName}';
		let content = $(this).parent().prev().find('textarea[name=content]').val();
		let pageNo = $('#currentPage').attr('pageNo');
		$.ajax({
			  method: "POST",
			  url: "/comment/reply",
			  data: {cGroup:c_group,cOrder:c_order,cDepth:c_depth,cContent:content,
				  page:pageNo,bId:b_idx,cWriter:c_writer}
		})
	.done(function( html ) {
	    $('#aj_comment_list').html(html);
	});
	});
		$(document).on('click', '.replyComment', function () { //  대댓글창보이기 
	$(this).parent().parent().next().css('display', '');
	});
	$(document).on('click', '.cancleR', function () { //  대댓글취소 
		$(this).parent().parent().css('display', 'none');
	});	
	
	$(document).on('click', '.cancleE', function () { // 수정 취소
		$(this).parent().parent().css('display', 'none');
	});
	
	</script>
	
	</body>
	</html>