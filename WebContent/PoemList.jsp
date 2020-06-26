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
        }
        #post {
          position: relative;
          height: 20%;
          width: 90%;
          background-color: grey;
          margin : 0px auto;
          margin-bottom: 100px;
        }
        #postTitle {
          position: relative;
          height: 20%;
          background-color: red;
          padding: 10px;
        }
        #postContents {
          position: relative;
          height: 60%;
          background-color: blue;
          padding: 10px;
        }
        #postSocial {
          position: relative;
          height: 20%;
          background-color: green;
          padding: 10px;
        }
        #likes {
          height: 100%;
          width: 50%;
          background-color: yellow;
          float: left;
        }
        #heartIcon {
          width: 15%;
        }
        #comments {
          height: 100%;
          width: 50%;
          background-color: white;
          float: right;
        }
   </style>
</head>
<body>
<div id="header"><h2 id="title">따옴</h2></div>
<div id="subheader"><h3 id="subtitle">오늘의 시</h3></div>
<div id="feed">
<%
	request.setCharacterEncoding("UTF-8");

	PoemDAO dao = new PoemDAO();
	ArrayList<PoemVO> list = new ArrayList<PoemVO>();
	
	String str = "";
	list = dao.poemList();
	for(PoemVO elem : list){
		str = "";
		str += "<div id='post' onclick='detail(" + elem.getNo() + ")'>";
		str += "<div id='postTitle'>" + elem.getTitle() + "</div>";
		str += "<div id='postContents'>" + elem.getContents() + "</div>";
		str += "<div id='postSocial'>";
		str += "<div id='likes'><img id='heartIcon' src='img/heartIcon.png'></div>";
		str += "<div id='comments'>댓글</div>";
		str += "</div>";
		str += "</div>";
		out.print(str);
	}
%>
    <div id="post">
      <div id="postTitle">첫 시</div>
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