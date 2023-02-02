# lcomputerSpring
DispatcherServlet 는 FrontController 라고도 불리며 모든 컨트롤러는 DispatcherServlet을 통해 호출됨

톰캣 시작시 dispatcherServlet init() 호출

톰캣 종료시 dispathcerServlet destroy() 호출

요청 시 service()를 통해 dopost 나 doget 이 호출 됨

ModelAndView 는 request setattribute 를 내부적으로 사용, view String 경로 저장

HandlerMapping 요청 uri 에 매핑된 controller 반환

HandlerAdapter 를 이용하여 컨트롤러를 실행

호출된 Controller 에서 Service 와 Dao를 사용하여 Vo에 데이터 저장 후 ModelAndView 에 내장된 request 에 setAttribute 함.

리턴받은 ModelAndView 의 View 정보를 ViewResolver 에 넘겨 주면 jsp 로 포워딩이나 리다이렉트가 실행 됨

요청에 Filter 적용


-- 검색-- 후 개념 이해 

dispatcherservlet

dependency injection

solid pattern

component, service, mapper 어노테이션 학습

configuration, bean 어노테이션 학습

mybatis를 사용하는 이유

aop filter interceptor

sprint security





 
 

1.스프링 이점 살려서 코딩 

2.중복코드 메소드로 정리하기 

3.예외처리 (view에서 warning 알림뜨게만들기 ) 

4.기존 서블릿에서만든거 다시 만들기 

-board list 

ㄴ수정,삭제,목록 완료 01/19

ㄴ답글 진행중 01/20 완료 

-userList 완료 01/18

ㄴuserpagination 완료 

ㄴ회원수정,가입,삭제,조회,권한처리 완료 (01/18 완료 //페이지접근권한 및 warning메세지  마지막에 )
 
 -comment 01/26 완료
 
 ㄴ 댓글 수정삭제작성대댓글 완료 
 
 -파일업로드  0202 완료 ( 다중업로드까지)
 
 -mybatis as 부분 result로 다 매칭해서 바꾸기 02/02 read 부분만 완료 list 목록은 나중에 더 찾아보기  
 

-login 세션값(username) 받아서 오른쪽위에 계속 띄우기 

 ㄴusername 클릭하면 사용자정보 화면 띄우기  -- 완료 
 ㄴhome 화면은 따로 리스트마다 detail 마다 버튼 넣기 --완료 
 
- 권한처리 warning 버튼 팝업 ? 

- 수정, 답글 파일업로드 구현 ?  생각좀더해보고 
