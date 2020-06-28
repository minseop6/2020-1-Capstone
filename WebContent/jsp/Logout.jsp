<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DAO.*" %>
<%@ page import="VO.*" %>

<%
	if(session.getAttribute("no") != null){
		session.invalidate();
	}else{
		out.println("<script>alert('로그아웃 실패하였습니다.')</script>");
		response.sendRedirect("../login.html");
	}
%>