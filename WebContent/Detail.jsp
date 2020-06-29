<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DAO.*" %>
<%@ page import="VO.*" %>
<%@ page import="java.util.*" %>
<html>
<head>
    <meta name=viewport content="width=device-width, initial-scale=1, user-scalable=0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
   <title></title>
   <style type="text/css">
		html, body {
		    margin: 0;
		    height: 100%;
		 }
		 #navigation {
		    z-index: 99;
		    bottom: 0px;
		    left: 0px;
		    right: 0px;
		    position: absolute;
		    position: fixed;
		    border: solid black 1px;
		 }
		 #contents {
		    padding: 20px;
		 }
		 #header {
		    height: 15%;
		 }
		 #title{
		     padding: 20px;
		 }
		 #subheader {
		    height: 8%;
		 }
		 #subtitle{
		   padding: 20px;
		 }
		 .icon{
		   padding: 10px;
		   width: 18%;
		 }
		 #writer {
		 	padding: 20px;
		 }   
		 #like {
		 	width: 20px;
		 	height: 20px;
		 	margin: 0px auto;
		 }
		 #likeBar {
		 	display: flex;
		 	width: 100%;
		 }
		 #commentWriter {
		 	position: relative;
		 	float: left;
		 	margin-right: 30px;
		 }
		 #commentBar {
		 	margin-left: 20px;
		 }
		 #writeComment {
		 	margin: 20px 0px;
		 }
		 #comments {
		 	margin: 5px 0px;
		 }
		 #comment {
		 	width: 80%;
		 }
		 #likeNum {
		 	text-align: center;
		 }
		 #report{
		 	float:right;
		 	margin: 20px;
		 }
	</style>
</head>
<body>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	
	PoemDAO poemDao = new PoemDAO();
	UserDAO userDAO = new UserDAO();
	PoemVO poem = poemDao.poem(no);
	UserVO user = userDAO.user(poem.getUno());

	String str = "<div id='subheader'><button id='report' onclick='report()'>신고</button>";
	str += "<h3 id='subtitle'>";
	str += poem.getTitle();
	str += "<div id='writer'>" + user.getId() + "</div>";
	str += "<div id='contents'>" + poem.getContents() + "</div>";
	str += "<div id='likeBar' onclick='like()'><img id='like' src='img/heartIcon.png' /></div>";
	str += "<div id='likeNum'>" + poem.getLike() + "</div>";
	
	out.print(str);
%>


<div id="commentBar">
	<div id="writeComment">
		<form method="POST" action="jsp/CommentWrite.jsp">
			<input type="text" id="comment" name="comment">
			<input type="hidden" name="pno" value="<% out.print(no); %>">
			<input type="submit" value="작성" />
		</form>
	</div>
<%
	CommentDAO commentDAO = new CommentDAO();
	ArrayList<CommentVO> comments = commentDAO.commentList(no);
	str = "";
	for(CommentVO comment : comments){
		str += "<div id='comments'>";
		str += "<div id='commentWriter'>" + comment.getId() + "</div>";
		str += "<div id='comment'>" + comment.getContents() + "</div>";
		str += "</div>";
	}
	out.print(str);
%>
</div>
<div id="navigation">
    <img src="img/homeButton.png" class="icon" onclick="main()"/>
    <img src="img/listButton.png" class="icon" onclick="list()"/>
    <img src="img/writeButton.png" class="icon" onclick="write1()"/>
    <img src="img/profileButton.png" class="icon" onclick="mypage()"/>
</div>
</body>
</html>

<script src="js/jquery-1.12.0.min.js"></script>
<script>
    var main = () => {
        location.href = "main.html"
    }
    var list = () => {
        location.href = "PoemList.jsp"
    }
    var write1 = () => {
        location.href = "write.html"
    }
    var mypage = () => {
        location.href = "Mypage.jsp"
    }
    
    //좋아요 기능
    var like = () => {
    	$.ajax({
    		type: "GET",
    		url: "jsp/Like.jsp?pno=<% out.print(no); %>",
    		dataType: "text",
    		error: function(){
    			alert("ERROR");
    		},
    		success: function(res){
    			if(res.length < 10){
    				$("#likeNum").text(res);
    			}else{
    				alert('로그인이 필요한 서비스 입니다.');
    			}
    		}
    	})
    }
    
    //신고 기능
    var report = () => {
    	$.ajax({
    		type: "GET",
    		url: "jsp/Report.jsp?pno=<% out.print(no); %>",
    		dataType: "text",
    		error: function(){
    			alert("ERROR");
    		},
    		success: function(res){
    			alert("신고 접수되었습니다.");
    		}
    	})
    }
</script>