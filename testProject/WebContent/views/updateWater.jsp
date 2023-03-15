<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <form action="update2.wa">
    <table>
        <tr>
            <input type="hidden">
            <th>생수명 입력</th>
            <td><input type="text" name="waterName"></td>
        </tr>
        <tr>
            <th>가격입력</th>
            <td><input type="text" name="waterPrice"></td>
        </tr>
    </table>
        <button type="submit">수정</button>
    </form>
</body>
</html>