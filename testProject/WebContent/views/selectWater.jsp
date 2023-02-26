<%@page import="com.kh.water.model.vo.Water"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    ArrayList<Water> list = (ArrayList<Water>)session.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
            <table>
                <tr>
                	<th>번호</th>
                    <th width="100">생수명</th>
                    <th width="150">가격</th>
                </tr>

				<% for(Water w : list) { %>
                <tr>
                	<td><%= w.getWaterNo() %></td>
                    <td><%= w.getBrand() %></td>
                    <td><%= w.getPrice() %></td>
                </tr>
                <% } %>
            </table>

            <br><br><br>
            <form action="update2.wa">
                <table>
                    <tr>
                        <th colspan="2">수정하기</th>
                    </tr>
                    
                    <tr>
                    	<th>바꿀 생수 번호</th>
                    	<td><input type="text" name="wno"></td>
                    </tr>
                    
                    <tr>
                        <th>바꿀 이름</th>
                        <td><input type="text" name="waterName"></td>
                    </tr>
                    <tr>
                        <th>바꿀 가격</th>
                        <td><input type="text" name="waterPrice"></td>
                    </tr>
                </table>
                    <button type="submit">수정하기</button>
                </form>

        


  
</body>
</html>