<%@page import="com.kh.board.model.vo.Reply"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.board.model.vo.Attachment"%>
<%@page import="com.kh.board.model.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Board b = (Board)request.getAttribute("b");
	// 글번호, 카테고리명, 제목, 내용, 작성일
	Attachment at = (Attachment)request.getAttribute("at");
	// 첨부파일 없으면 null
	// 있으면 파일번호, 원본명, 수정명, 저장경로
%>
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
        height: auto;
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
	<%@ include file="../common/menubar.jsp" %>
    <div class="outer">
        <br>
        <h2 align="center">일반게시판 상세조회</h2>
        <br>

        <table id="detail-area" border="1" align="center">
            <tr>
                <th width="70">카테고리</th>
                <td width="70"><%= b.getCategoryNo() %></td>
                <th width="70">제목</th>
                <td width="350"><%= b.getBoardTitle() %></td>
            </tr>
            <tr>
                <th>작성자</th>
                <td><%= b.getBoardWriter() %></td>
                <th>작성일</th>
                <td><%= b.getCreateDate() %></td>
            </tr>
            <tr>
                <th>내용</th>
                <td colspan="3" style="height: 200px;"><%= b.getBoardContent() %></td>
            </tr>
            <tr>
                <th>첨부파일</th>
                <td  colspan="3">
                    <!-- case1. 첨부파일이 없을 경우 -->
                    <% if (at == null) { %>
                    	첨부파일이 없습니다.
                    <% } else { %>
                   		 <!-- case2. 첨부파일이 있을 경우 -->
                        <a download="<%= at.getOriginName() %>" href="<%= contextPath %>/<%= at.getFilePath() + at.getChangeName() %>"><%= at.getOriginName() %></a>
                        <% } %>
                </td>
            </tr>
        </table>

        <br>

        <div align="center">
            <a href="<%= contextPath %>/list.bo?cpage=1" class="btn btn-sm btn-secondary">목록가기</a>

			<% if(loginUser != null && loginUser.getUserId().equals(b.getBoardWriter())) { %>
            <!-- 로그인 한 사용자가 게시글 작성자인 경우 -->
            <a href="<%= contextPath %>/updateForm.bo?bno=<%= b.getBoardNo() %>" class="btn btn-sm btn-warning">수정하기</a>
            <a href="#" class="btn btn-sm btn-danger">삭제하기</a>
            <% } %>
        </div>
        
        <br>
        
        <div id="reply-area">
        	<table border="1" align="center">
        		<thead>
        			<tr>
        				<th>댓글작성</th>
        				
        				<% if(loginUser != null) { // 로그인이 되있는 경우) %>
        				<td>
        					<textarea id="replyContent" rows="3" cols="50" style="resize:none;"></textarea>
        				</td>
        				<td>
        					<button onclick="insertReply();">댓글등록</button>
        				</td>
        				<% } else { // 로그인 안되있는 경우 %>
        				<td>
        					<textarea rows="3" cols="50" style="resize:none;" readonly>로그인 후 이용가능 한 서비스입니다.</textarea>
        				</td>
        				<td>
        					<button disabled>댓글등록</button>
        				</td>
        				<% } %>
        			</tr>
        		</thead>
        		
        		<tbody>



        		</tbody>
        	</table>
        </div>
        
        <script>
        	$(function(){
        		selectReplyList();
        		
        		setInterval(selectReplyList, 1000);
        	})
        	
        	// ajax로 댓글 작성용
        	function insertReply(){
        		$.ajax({
        			url:"rinsert.bo",
        			data:{
        				content:$("#replyContent").val(),
        				bno:<%= b.getBoardNo() %> // userNo: 로그인 안한 경우, loginUser null인 경우에는 nullPointerException
        			},
        			type:"post",
        			success:function(result){
        				if(result > 0) { // 댓글 작성 성공
		        			selectReplyList();
        					$("#replyContent").val("");
        				}
        			},
        			error:function(){
        				console.log("댓글 작성용 ajax 통신 실패");
        			},
        		})
        	}
        	
        	// ajax로 해당 게시글에 딸린 댓글 목록 조회용
        	function selectReplyList(){
        		$.ajax({
        			url:"rlist.bo",
        			data:{bno:<%=b.getBoardNo()%>},
        			success:function(result){
        				let value = "";
        				for(let i = 0; i < result.length; i++){
        					value += "<tr>"
        								+ "<td>" + result[i].replyWriter + "</td>"
        								+ "<td>" + result[i].replyContent + "</td>"
        								+ "<td>" + result[i].createDate + "</td>"
       							 	 + "</tr>"
        				}
        				
        				$("#reply-area tbody").html(value);
        				
        			},
        			error:function(){
        				console.log("ajax 통신 실패");
        			}
        		})
        	}
        </script>
    </div>
</body>
</html>