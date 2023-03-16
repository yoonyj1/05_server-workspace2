<%@page import="com.kh.board.model.vo.Board"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list"); %>
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
        height: 800px;
        margin: auto;
        margin-top: 50px;
    }

    .list-area{
        width: 760px;
        margin: auto;
    }

    .thumbnail{
        border: 1px solid white;
        width: 220px;
        display: inline-block;
        margin: 14px;
    }
    
    .thumbnail:hover{
    	cursor: pointer;
    	opacity: 0.7;
    }
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
    <div class="outer">
        <br>
        <h2 align="center">사진게시판</h2>
        <br>

		<% if(loginUser != null) { %>
	        <!-- 로그인한 회원만 보여지게 -->
	        <div align="right" style="width: 850px;">
	            <a href="<%= contextPath %>/enrollForm.th" class="btn btn-sm btn-secondary">글작성</a>
	        </div>
		<% } %>
        <div class="list-area">
            <!-- 썸네일 한개 -->
            <% for(Board b : list) { %>
	            <div class="thumbnail" align="center">
	            <input type="hidden" value="<%= b.getBoardNo() %>">
	                <img src="<%= b.getTitleImg() %>" width="200" height="150">
	                <p>
	                    <%= "No." + b.getBoardNo() + " " + b.getBoardTitle() %> <br>
	                    조회수: <%= b.getCount() %>
	                </p>
	            </div>
			<% } %>
            
        </div>
    </div>
    
    <script>
    	$(".thumbnail").click(function(){
    		location.href="<%=contextPath%>/detail.th?bno=" + $(this).children("input").val();
    	})
    </script>
</body>
</html>