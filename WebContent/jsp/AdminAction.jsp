<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DAO.*" %>
<%@ page import="VO.*" %>

<%
	if(session.getAttribute("no") == null){
		out.println("<script>alert('로그인이 필요한 서비스 입니다.');</script>");
		out.println("<script>window.history.back();</script>");
	}else{
		request.setCharacterEncoding("UTF-8");

		PoemDAO poemDao = new PoemDAO();
		
		int pno = Integer.parseInt(request.getParameter("pno"));
		
		String status = poemDao.adminAction(pno);
		
		if(status.equals("OK")){
			out.print("OK");
		}else{
			out.print("<script>alert('삭제 기능이 실패하였습니다')</script>");
			out.println("<script>window.history.back();</script>");
		}	
	}
%>