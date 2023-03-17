<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>1. formatNumber</h3>
	<p>
		숫자데이터의 포맷(형식) 지정 <br>
		 - 표현하고자 하는 숫자데이터의 형식을 통화기호, % 등 원하는 쓰임에 맞게 형식을 지정하는 태그 <br><br>
		 
		 (fmt:formatNumber value="출력하고자 하는 값" [groupingUsed="true|false", type="percent|currency", currencySymbol="통화기호문자"])
	</p>
	
	<c:set var="num1" value="123456789"/>
	<c:set var="num2" value="0.75"/>
	<c:set var="num3" value="50000"/>
	
	그냥 출력: ${ num1 } <br>
	세자리마다 구분하여 출력: <fmt:formatNumber value="${ num1 }"/> <br> <!-- groupingUsed 기본값(true) == 구분자 유무 O -->
	숫자 그대로 출력: <fmt:formatNumber value="${ num1 }" groupingUsed="false"/>
	<!-- groupingUsed: 세자리마다 구분자(,) 표시여부 지정 --> <br><br>
	
	percent: <fmt:formatNumber value="${ num2 }" type="percent"/> <br>
	
	currency: <fmt:formatNumber value="${ num3 }" type="currency" groupingUsed="false"/> <br>
	
	currency$: <fmt:formatNumber value="${ num3 }" type="currency" currencySymbol="$"/>
	
	<!-- 
		type: 백분율(%), 통화기호 형식 지정
		currencySymbol: 통화기호 문자 지정
	 -->
	 
	 <hr>
	 
	 <h3>2. formatDate</h3>
	 <p>날짜 및 시간 데이터의 포맷 지정(단, java.util.Date 객체 사용)</p>
	 
	 <c:set var="current" value="<%= new Date() %>"/>
	 
	 그냥 출력: ${ current } <br>
	 
	 <ul>
	 	<li>현재 날짜: <fmt:formatDate value="${ current }"/> </li> <!-- type 생략 시 기본값이 date -->
	 	<li>현재 시간:	<fmt:formatDate value="${ current }" type="time"/> </li>
	 	<li>둘다: <fmt:formatDate value="${ current }" type="both"/></li> <!-- dateStyle, timeStyle 생략 시 기본값 medium -->
	 	<li>Medium: <fmt:formatDate value="${ current }" type="both" dateStyle="medium" timeStyle="medium"/></li>
	 	<li>Long: <fmt:formatDate value="${ current }" type="both" dateStyle="long" timeStyle="long"/></li>
	 	<li>Full: <fmt:formatDate value="${ current }" type="both" dateStyle="full" timeStyle="full"/></li>
	 	<li>short: <fmt:formatDate value="${ current }" type="both" dateStyle="short" timeStyle="short"/></li>
	 	<li>** 나만의 패턴: <fmt:formatDate value="${ current }" type="both" pattern="yyyy-MM-dd(E) HH:mm:ss(a)"/></li>
	 </ul>
</body>
</html>