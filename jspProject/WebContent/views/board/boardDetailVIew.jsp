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
        height: 550px;
        margin: auto;
        margin-top: 50px;
    }

    div>a{
        text-decoration: none;
        color: white;
    }
</style>
</head>
<body>
    <div class="outer">
        <br>
        <h2 align="center">일반게시판 상세조회</h2>
        <br>

        <table id="detail-area" border="1" align="center">
            <tr>
                <th width="70">카테고리</th>
                <td width="70">.등산</td>
                <th width="70">제목</th>
                <td width="350">.제목</td>
            </tr>
            <tr>
                <th>작성자</th>
                <td>user01</td>
                <th>작성일</th>
                <td>2023/02/17</td>
            </tr>
            <tr>
                <th>내용</th>
                <td colspan="3" style="height: 200px;">내용내용코드</td>
            </tr>
            <tr>
                <th>첨부파일</th>
                <td  colspan="3">
                    <!-- case1. 첨부파일이 없을 경우 -->
                    <!-- 첨부파일이 없습니다 -->

                    <!-- case2. 첨부파일이 있을 경우 -->
                        <a href="">기존의파일명</a>
                </td>
            </tr>
        </table>

        <br>

        <div align="center">
            <a href="#" class="btn btn-sm btn-secondary">목록가기</a>

            <!-- 로그인 한 사용자가 게시글 작성자인 경우 -->
            <a href="#" class="btn btn-sm btn-warning">수정하기</a>
            <a href="#" class="btn btn-sm btn-danger">삭제하기</a>
        </div>
    </div>
</body>
</html>