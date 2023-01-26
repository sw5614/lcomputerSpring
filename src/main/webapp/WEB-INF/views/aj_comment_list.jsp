<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
</head>
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
</html>