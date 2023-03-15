<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h3>jsp:include</h3>
	<p>또 다른 페이지를 포함하고자 할 때 쓰는 태그</p>
	
	<h4>1. 기존의 include 지시어 이용한 방식(정적 include 방식 == 컴파일 시 애초에 포함되어 있는 형태)</h4>
	
	<%-- 
	<%@ include file = "footer.jsp" %>
	<br><br>
	
	특징: include하고 있는 페이지상에 선언되어있는 변수를 현재 이 페이지에서도 사용 가능<br>
	include한 페이지의 year 변수 값: <%= year %>
	=> 단 현재 이 페이지에서 동일한 이름의 변수를 선언 할 수 없음
	
	<% int year = 2023; %>
	--%>
	
	<h4>2. JSP 표준액션태그 이용한 방식(동적 include 방식 == 런타임(로딩) 시 포함되는 형태)</h4>
	<jsp:include page="footer.jsp"/> <!-- 굳이 쓸 내용 없으면 끝에 / 붙이면 됨  --><br>
	
	특징1: include 하고 있는 페이지에 선언된 변수를 공유하지 않음 <br>
	=> 동일한 이름의 변수 재선언 가능 <br><br>
	<% int year = 2023; %>
	
	특징2: 포함 시 include하는 페이지로 값 전달 할 수 있음
	<jsp:include page="footer.jsp">
		<jsp:param value="hello" name="test"/>
	</jsp:include>
	<br>
	<jsp:include page="footer.jsp">
		<jsp:param value="bye" name="test"/>
	</jsp:include>
</body>
</html>