<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DAO.*" %>
<%@ page import="VO.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta name=viewport content="width=device-width, initial-scale=1, user-scalable=0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
   <title></title>
   <style type="text/css">
        @import url("css/template.css");
        #feed {
          height: 100%;
          width: 100%;
          overflow: scroll;
        }
        #post {
          position: relative;
          height: 30%;
          width: 100%;
          margin : 0 auto;
          margin-bottom: 40px;
          border-top : solid 1px black;
        }
        #postTitle {
          position: relative;
          height: 10%;
          padding: 15px;
          background-color : lightgray;
          margin: 0 auto;
        }
        #postContents {
          position: relative;
          height: 40%;
          padding: 15px;
          background-color : white;
        }
        #postSocial {
          position: relative;
          height: 20%;
          padding: 10px;
          background-color : white;
          border-top : solid 1px black;
          border-bottom : solid 1px black;

        }
        #likes {
          height: 100%;
          width: 50%;
          float: left;
        }
        #heartIcon {
        	width: 15%;
  			margin: auto 0;
  
        }
        #comments {
          height: 100%;
          width: 50%;
          float: right;
        }
         #title {
          padding: 40px;
          font-size: 2.5em;
          margin: 0;
        }
		#subtitle {
        	padding: 40px;
        	font-size: 1.5em;
        	margin: 0;
        }
		#contents {
		    height: 100%;
		    padding: 40px;
		    font-size: 1.5em;
		    margin-top: 30px;
		}
		html, body {
		    margin: 0;
		    height: 100%;
		    overflow: hidden;
		 }
		 h3 {
		 	margin : 0;
		 }

   </style>
</head>
<body>
<div id="header"><h2 id="title">따옴</h2></div>
<div id="subheader"><h3 id="subtitle">여러분의 시</h3></div>
<div id="feed">
<%
	request.setCharacterEncoding("UTF-8");

	PoemDAO poemDao = new PoemDAO();
	CommentDAO commentDao = new CommentDAO();
	
	ArrayList<PoemVO> list = new ArrayList<PoemVO>();
	
	String str = "";
	list = poemDao.poemList();
	for(PoemVO elem : list){
		int comment_count = commentDao.commentList(elem.getNo()).size();
		str = "";
		str += "<div id='post' onclick='detail(" + elem.getNo() + ")'>";
		str += "<div id='postTitle'>" + elem.getTitle() + "</div>";
		str += "<div id='postContents'>" + elem.getContents() + "</div>";
		str += "<div id='postSocial'>";
		str += "<div id='likes'><img id='heartIcon' src='img/heartIcon.png'>" + elem.getLike() + "</div>";
		str += "<div id='comments'>댓글 " + comment_count + "</div>";
		str += "</div>";
		str += "</div>";
		out.print(str);
	}
%>
    <div id="post">
      <div id="postTitle"><h3>첫 시</h3></div>
      <div id="postContents">가을하늘청명하네</div>
      <div id="postSocial">
        <div id="likes"><img id="heartIcon" src="img/heartIcon.png"></div>
        <div id="comments">댓글</div>
      </div>
    </div>
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
<script src="js/core.js"></script>
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
    //상세보기
    var detail = (no) => {
    	location.href = "Detail.jsp?no=" + no;
    }
</script>