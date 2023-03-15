<%@page import="elActionProject.com.kh.model.vo.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>1. 기존의 방식대로 스크립틀릿과 표현식을 이용해서 각 Scope에 담겨있는 값 뽑아서 화면에 출력</h3>
	<%--
	<%
		String classRoom = (String)request.getAttribute("classRoom");
		Person student = (Person)request.getAttribute("student");
		
		String academy = (String)session.getAttribute("academy");
		Person teacher = (Person)session.getAttribute("teacher");
	%>
	
	<p>
		학원명: <%= academy %> <br>
		강의장: <%= classRoom %> <br>
		강사: <%= teacher.getName() %>, <%= teacher.getAge() %>, <%= teacher.getGender() %>
		
		<br><br>
		
		수강생 정보
		<ul>
  			<li> 이름: <%= student.getName() %> </li>
  			<li> 나이: <%= student.getAge() %> </li>
  			<li> 성별: <%= student.getGenderss() %> </li>
		</ul>

		
	</p>
	--%>
	
	<h3>2. EL을 이용해서 보다 쉽게 해당 scope에 저장된 값을 출력하기</h3>
	<p>
	스크립틀릿을 이용해서 getxxx을 통해 값을 빼올 필요 없이 el 구문내에 키값만 제시하면 바로 접근 가능	
	</p>
	
	학원명: ${ academy } <br>
	강의장 : ${ classRoom } <br>
	강사: ${ teacher.name }, ${teacher.age}, ${teacher.gender}
	<!-- 
		teacher에 접근하면 value 값은 Person 객체임
		해당 Person 객체에 필드에 담긴 값을 출력하고자한다면 .필드명으로 접근하면
		=> 내부적으로 getter 메소드 찾아서 실행됨
		   즉, getter 메소드는 항상 필수적으로 만들어야됨. 없거나 지우면 오류남
	 -->
	 
	 수강생 정보
	 <ul>
	 	<li>이름: ${ student.name }</li>
	 	<li>나이: ${ student.age }</li>
	 	<li>성별: ${ student.gender }</li>
	 </ul>
	 
	 <h3>3. EL 사용 시 내장객체들의 저장된 키 값이 동일한 경우</h3>
	 scope값: ${ scope } <br>
	 
	 <!-- 
	 	EL은 공유범위가 가장 작은 Scope에서부터 해당 키 값을 검색함
	 	page => request => session => application
	 	
	 	만일, 모든 영역에서 못찾을 경우 => 아무것도 출력 안됨(오류는 안남)
	  -->
	  
	  test값: ${ test }
	  
	  <h3>4. 직접 Scope를 지정해서 접근하기</h3>
	  
	  <%
	  	// pageScope에 담기
	  	pageContext.setAttribute("scope", "page");
	  %>
	  
	  pageScope에 담긴값: ${ scope } 또는 ${ pageScope.scope } <br>
	  requestScope에 담긴값: ${ requestScope.scope } <br>
	  sessionScope에 담긴값: ${ sessionScope.scope } <br>
	  applicationScope에 담긴값: ${ applicationScope.scope } <br>

	<!-- 
		각 영역에 중복된 키값으로 데이터 저장을 해놨다면 Scope를 직접 지정해서 키값을 제시하는게 가장 정확함
		
		단지 키값만 제시하면 잘못된(의도하지 않은) 데이터가 뽑힐 수 있음
	 -->	  
	 잘못된 접근 예시(session에 classRoom): ${ session.classRoom }
	  
</body>
</html>