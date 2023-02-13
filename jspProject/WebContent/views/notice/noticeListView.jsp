<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

    .list-area{
        border: 1px solid white;
        text-align: center;
    }
</style>
</head>
<body>
    <%@ include file = "../common/menubar.jsp" %>

    <div class="outer">
        <br>
        <h2 align="center">공지사항</h2>
        <br>

        <table class="list-area" align="center">
            <thead>
                <tr>
                    <th>글번호</th>
                    <th width="400">글제목</th>
                    <th width="100">작성자</th>
                    <th>조회수</th>
                    <th width="100">작성일</th>
                </tr>
            </thead>
            <tbody>
                <!-- case1. 공지글이 없는 경우 -->
                <tr>
                    <td colspan="5" align="center">존재하는 공지사항이 없습니다.</td>
                </tr>

                <!-- case2. 공지글이 있는 경우 -->
                <tr>
                    <td>3</td>
                    <td>ㅎㅇ 관리자임다</td>
                    <td>admin</td>
                    <td>30</td>
                    <td>2023-02-13</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>ㅎㅇ 관리자임다2</td>
                    <td>admin</td>
                    <td>5</td>
                    <td>2022-02-13</td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>ㅎㅇ 관리자임다3</td>
                    <td>admin</td>
                    <td>3</td>
                    <td>2021-02-13</td>
                </tr>
            </tbody>
        </table>

    </div>
</body>
</html>