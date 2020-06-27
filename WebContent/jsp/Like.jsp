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
		UserDAO userDAO = new UserDAO();
		
		int pno = Integer.parseInt(request.getParameter("pno"));
		int uno = (int)session.getAttribute("no");
				
		
		String status = userDAO.like(uno); //사용자 좋아요 수 증가
		int like = poemDao.like(pno); //좋아요 갯수 추가 + 현재 좋아요 수 리턴
		
		if(status.equals("OK")){
			out.print(like);
		}else{
			out.print("<script>alert('좋아요 기능이 실패하였습니다')</script>");
			out.println("<script>window.history.back();</script>");
		}	
	}
%>