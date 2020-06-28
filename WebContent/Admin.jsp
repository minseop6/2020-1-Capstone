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
		    height: 100%;
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
		#searchBar {
			position: relative;
			width: 100%;
			margin: 20px;
		}
		#submit {
			float: left;
		}
		#searchbox {
			float: left;
		}
		#filter {
			float: left;
		}
		#feedlist{
		    border: solid black 1px;
			width: 100%;
			height: auto;
			position: relative;
		}
		#feed {
			width: 100%;
			height: 40px;
			position: relative;
		}
		#feedTitle {
			position: relative;
			float: left;
		}
		#adminAction {
			position: relative;
			float: right;
		}
	</style>
</head>
<body>
<div id="searchBar">
	<div id="searchbox">
		<input type="text" id="txt">
	</div>
	<button onclick="filter()">search</button>
	<select id="option" name="filter">
		<option value="title">제목</option>
		<option value="contents">내용</option>
	</select>
</div>
<div id="feedlist">
<%
	PoemDAO poemDao = new PoemDAO();
	ArrayList<PoemVO> list = poemDao.reportPoemList();
	
	String str = "";
	for(PoemVO poem : list){
		str += "<div id='feed'>";
		str += "<div id='feedTitle' onclick='detail(" + poem.getNo() + ")'>" + poem.getTitle() + "</div>";
		str += "<button id='adminAction' onclick='adminAction(" + poem.getNo() + ")'>삭제</button>";
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
    
    //게시글 삭제
    var adminAction = (pno) => {
    	$.ajax({
    		type: "GET",
    		url: "jsp/AdminAction.jsp?pno=" + pno,
    		dataType: "text",
    		error: function(){
    			alert("ERROR");
    		},
    		success: function(res){
    			alert("삭제 완료되었습니다.");
    			location.href = location.href;
    		}
    	})
    }
    
    //필터링
    var filter = () => {
    	var txt = document.querySelector('#txt').value;
    	var option = document.querySelector('#option').value;
    	$.ajax({
    		type: "GET",
    		url: "jsp/Filter.jsp?txt=" + txt + "&option=" + option,
    		dataType: "text",
    		error: function(){
    			alert("ERROR");
    		},
    		success: function(res){
    			console.log(res);
    			var elem = document.querySelector('#feedlist');
    			elem.innerHTML = res;
    		}
    	})
    }
    
  	//상세보기
    var detail = (no) => {
    	location.href = "Detail.jsp?no=" + no;
    }
</script>