
>Spring boot 를 이용한 게시판  
  

</br>

## 1. 제작 기간 & 참여 인원
- 2023년 1월 6일 ~ 2월 8일
- 개인 프로젝트

</br>

## 2. 사용 기술
#### `Back-end`
  - Java 
  - Spring Boot 
  - Gradle
  - Maria DB
  - mybatis
  
#### `Front-end`
  - javascript
  - ajax
  
</br>

## 3.기능
![](https://user-images.githubusercontent.com/116094359/235332999-cb6160f6-e9df-43c3-9688-1da73fe4663e.png)
메인화면 

![](https://user-images.githubusercontent.com/116094359/235333025-3f188842-1f95-41ca-9b0d-b98bfbd92218.png)
회원가입화면 

![](https://user-images.githubusercontent.com/116094359/235333052-a6410b98-8468-438f-80e8-8141bad5d3f3.png)

로그인 화면

![](https://user-images.githubusercontent.com/116094359/235352245-6f2d728e-d078-4287-9489-84d987daaeff.png)

메인 화면 

![](https://user-images.githubusercontent.com/116094359/235352290-8771c260-e79c-4498-b6d3-f805a0e968b2.png)

게시판 목록 

![](https://user-images.githubusercontent.com/116094359/235352332-c04c16cc-7404-421f-a7fe-e6c77f2fb2fa.png)

목록에서 아이디를 클릭하거나 홈화면에서 정보클릭시 로그인계정 정보 

![](https://user-images.githubusercontent.com/116094359/235352382-72b27ed5-2aca-4f63-b4d8-0303e098ed82.png)

게시물 상세페이지 

![](https://user-images.githubusercontent.com/116094359/235352408-5debdad6-4cf2-4a0b-820e-65ce215e706a.png)

![](https://user-images.githubusercontent.com/116094359/235352443-0f6698d7-eeae-4d9f-aa9a-e916946f46eb.png)

글작성화면 

![](https://user-images.githubusercontent.com/116094359/235352495-cbbea54c-129a-4183-8500-267890b98e19.png)

게시물 답글 RE 

![](https://user-images.githubusercontent.com/116094359/235352566-72048053-a9af-4ac6-bd4b-d5bdf2a43db4.png)

게시물마다 댓글 작성 

![](https://user-images.githubusercontent.com/116094359/235352575-0da420e6-d1cf-46fa-a92b-21d46d1baa27.png)

관리자 권한 가진사람만 유저 권한처리 가능 




개발일지
<details> 
    <summary>자세히 <<-- 클릭 </summary>


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
 
 ㄴ board read 부분만 파일매칭으로 완료 (02/02)
 
 ㄴboard 에서 comment list join으로  1대 다 resultMap 사용?    
 

-login 세션값(username) 받아서 오른쪽위에 계속 띄우기 

 ㄴusername 클릭하면 사용자정보 화면 띄우기  -- 완료 
 ㄴhome 화면은 따로 리스트마다 detail 마다 버튼 넣기 --완료 
 
- 권한처리 warning 버튼 팝업 ? 

- 수정, 답글 파일업로드 구현 ?  생각좀더해보고 


// 재로그인 하지 않고 권한 업데이트 하는 법

Authentication auth = SecurityContextHolder.getContext().getAuthentication();

List<GrantedAuthority> updatedAuthorities = new ArrayList<>(auth.getAuthorities());

Authentication newAuth = new UsernamePasswordAuthenticationToken(auth.getPrincipal(), auth.getCredentials(), updatedAuthorities);

 SecurityContextHolder.getContext().setAuthentication(newAuth);


</details>