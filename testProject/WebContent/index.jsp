<%@page import="com.kh.water.model.vo.Water"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String alertMsg = (String)session.getAttribute("alertMsg");
	ArrayList<Water> list = (ArrayList<Water>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% if(alertMsg != null) { %>
	<scrip>
		alert("<%=alertMsg%>");
	</script>
	<% session.removeAttribute("alertMsg"); %>
	<% } %>
	<h1>WATER</h1>
	<form action="insert.wa">
        <table>
            <tr>
                <th>생수명 입력</th>
                <td><input type="text" name="waterName"></td>
            </tr>
            <tr>
                <th>가격입력</th>
                <td><input type="text" name="waterPrice"></td>
            </tr>
        </table>
        <button type="submit">전송</button>
    </form>

    <br>
    <br>

    <a href="select.wa">생수조회</a>


</body>
</html>