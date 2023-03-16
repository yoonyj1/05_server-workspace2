<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer{
        background-color: black;
        color: white;
        width: 1000px;
        height: 500px;
        margin: auto;
        margin-top: 50px;
    }

    #update-form input, #update-form textarea{
        width: 100%;
        box-sizing: border-box;
    }
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
    <div class="outer" align="center">
        <br>
        <h2 align="center">공지사항 수정하기</h2>
        <br>
        <form action="update.no" id="update-form" method="post">
            <input type="hidden" name="num" value="${ n.noticeNo }">
            <table>
                <tr>
                    <th width="50">제목</th>
                    <td width="450"><input type="text" name="title" required value="${ n.noticeTitle }"></td>
                </tr>

                <tr>
                    <th>내용</th>
                    <td></td>
                </tr>

                <tr>
                    <td colspan="2">
                        <textarea name="content" rows="10" style="resize: none;" required>${ n.noticeContent }</textarea>
                    </td>
                </tr>
            </table>
            <br><br>
            <div>
                <button type="submit">수정하기</button>
                <button type="button" onclick="history.back();">뒤로가기</button>
            </div>
            
        </form>
    </div>
</body>
</html>