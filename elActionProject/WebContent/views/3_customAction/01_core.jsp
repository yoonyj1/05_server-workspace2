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
	
	<!-- value 속성 대신에 시작태그와 종료태그 사이에 초기값 지정 가능 -->
	<c:set var="result" scope="request">
		9999
	</c:set>
	
	${ requestScope.result } <br>
	
	<hr>
	
	<pre>
	* 변수 삭제(c:remove var="제거하고자 하는 변수명" [scope=""])
	- 해당 scope 영역에서 해당 변수를 찾아서 제거하는 태그
	- scope 지정 생략 시 모든 scope에서 해당 변수 다 찾아서 제거함
	 => 즉, 해당 scope에 .removeAttribute를 통해 제거하는거라고 생각하면 됨
	</pre>
	
	삭제전 result: ${ result } <br><br>
	
	1) 특정 scope 지정해서 삭제 <br>
	<c:remove var="result" scope="request"/>
	request 영역 삭제 후 result: ${ result } <br><br>
	
	2) 모든 scope에서 삭제 <br>
	<c:remove var="result"/>
	모두 삭제 후 result: ${ result } <br><br>
	
	<hr>
	
	<pre>
	* 변수(데이터) 출력 (c:out value="출력하고자 하는 값" [default="값 없을때 출력할 기본값"] [escapeXml="true|false"])
	 - 데이터를 출력하고자 할 때 사용하는 태그
	</pre>
	
	<c:out value="${ result }"/> <br>
	<c:out value="${ result }" default="없음"/> <br><br>
	
	<c:set var="outTest" value="<b>출력 테스트</b>"/>
	
	<c:out value="${ outTest }"/> <br> <!-- escapeXml 생략 시 기본값이 true == 태그가 해석되지 않아 문자열로 취급 => <b>출력 테스트</b> -->
	<c:out value="${ outTest }" escapeXml="false"/>
	
	<hr>
	
	<h3>2. 조건문 - if(c:if test="조건식")</h3>
	<pre>
	- JAVA의 단독 if문과 비슷한 역할을 하는 태그
	- 조건식은 test 속성에 작성(단, EL 구문으로 기술)
	</pre>
	
	<%-- 
	<% if(num1 > num2) { %>
	
	<% } %>
	--%>
	
	<c:if test="${ num1 gt num2 }">
		<b>num1이 num2보다 큽니다.</b>
	</c:if>
	
	<c:if test="${ num1 le num2 }">
		<b>num1이 num2보다 작거나 같습니다.</b>
	</c:if>
	
	<br>
	
	<c:set var="str" value="ㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇ"/>
	
	<%--
	<% if(str.equals("ㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇ")) { %>
		
	<% } %>
	--%>
	
	<c:if test="${ str eq 'ㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇ' }">
		<h4>Hello World</h4>
	</c:if>
	
	<c:if test="${ str ne 'ㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇ' }">
		<h4>Bye World</h4>
	</c:if>
	
	<h3>3. 조건문 - Choose (c:choose, c:when, c:otherwise)</h3>
	<pre>
	- JAVA의 if-else, if else if문과 비슷한 역할을 하는 태그
	- 각 조건들을 c:choose의 하위요소로 c:when을 통해서 작성(else 역할 == otherwise)
	</pre>
	
	<%-- 
	<% if(num1 > 20) { %>		
		dfas
	<% } else if (num >= 10) { %>
	
	<% } %>
	--%>
	
	<c:choose>
		<c:when test = "${ num1 gt 20 }">
			<b>처음 뵙겠습니다.</b>
		</c:when>
		<c:when test="${ num1 ge 10 }">
			<b>내일 뵙겠습니다.</b>
		</c:when>
		<c:otherwise>
			<b>그만 뵙겠습니다.</b>
		</c:otherwise>
	</c:choose>
	
	<h3>4. 반복문 - forEach</h3>
	<pre>
	for loop - (c:forEach var="변수명" begin="시작값" end="끝값" [step="반복 시 증가값"])
	향상된 for 문 - (c:forEach var="변수명" items="순차적으로 접근하고자 하는 개체(배열, 컬렉션) [varStatus="현재 접근한 요소의 상태값을 보관할 변수명"]")
	
	var 속성으로 선언한 변수에는 반드시 접근을 EL 구문으로 접근
	</pre>
	
	<c:forEach var="i" begin="1" end="10" step="2">
		반복확인: ${ i } <br>
	</c:forEach>
	
	<c:forEach var="i" begin="1" end="6">
		<h${ i }>태그 안에서도 적용 가능</h${ i }>
	</c:forEach>
	
	<c:set var="colors">
		red, yellow, green, pink
	</c:set>
	
	colors 변수값: ${ colors } <br>
	
	<ul>
		<c:forEach var="c" items="${ colors }">
			<li style="color:${ c }">${ c }</li>
		</c:forEach>
	</ul>
</body>
</html>