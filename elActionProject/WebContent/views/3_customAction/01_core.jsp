<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>JSTL Core Library</h1>
	
	<h3>1. 변수(속성 == attribute)</h3>
	<pre>
	* 변수 선언과 동시에 초기화(c:set var="변수명" value="값")
	 - 변수 선언하고 초기값을 대입해주는 기능
	 - 해당 변수를 어떤 scope에 담아둘건지 지정 가능 (생략 시 기본적으로 pageScope에 담김)
	 => 즉, 해당 scope에 setAttribute를 통해서 key - value 형태로 데이터를 담아놓는거라고 생각하면 됨
	 => c:set으로 선언된 변수는 반드시 EL로만 접근해야 사용 가능(스크립팅 원소로는 접근 불가)
	 
	 - 변수 타입을 별도로 지정하지 않음
	 - 초기값을 반드시 지정해둬야함
	</pre>
	
	<c:set var="num1" value="10"/> <!-- pageContext.setAttribute("num1", "10") -->
	<c:set var="num2" value="20" scope="request"/> <!-- requestContext.setAttribute("num2", "20) -->
	
	num1의 변수값: ${ num1 } <br>
	num2의 변수값: ${ num2 } <br>
	
	<c:set var="result" value="${ num1 + num2 }" scope="session"/>
	result의 변수값: ${ result } <br><br>
	
	${ pageScope.num1 } <br>
	${ requestScope.num2 } <br>
	${ sessionScope.result } <br>
	${ requestScope.result } <br>
	
</body>
</html>