<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DAO.*" %>
<%@ page import="VO.*" %>
<%@ page import="java.util.*" %>

<%
	if(session.getAttribute("no") == null){
		out.println("<script>alert('로그인이 필요한 서비스 입니다.');</script>");
		out.println("<script>window.history.back();</script>");
	}else{
		request.setCharacterEncoding("UTF-8");

		PoemDAO poemDao = new PoemDAO();
		
		String txt = request.getParameter("txt");
		String option = request.getParameter("option");
		
		ArrayList<PoemVO> list = new ArrayList<PoemVO>();
		if(option.equals("title")){
			list = poemDao.reportListByTitle(txt);
		}else{
			list = poemDao.reportListByContents(txt);
		}
		
		String str = "";
		for(PoemVO poem : list){
			str += "<div id='feed'>";
			str += "<div id='feedTitle'>" + poem.getTitle() + "</div>";
			str += "<button id='adminAction' onclick='adminAction(" + poem.getNo() + ")'>삭제</button>";
			str += "</div>";
		}
		out.print(str);
	}
%>