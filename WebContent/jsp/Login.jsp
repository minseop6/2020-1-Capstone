<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DAO.*" %>
<%@ page import="VO.*" %>

<%
	request.setCharacterEncoding("UTF-8");
	
	UserVO vo = new UserVO();
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	vo.setId(id);
	vo.setPw(pw);
	
	UserDAO dao = new UserDAO();
	int no = dao.login(vo);
	if(no > 0){
		session.setAttribute("no", no);
		
		response.sendRedirect("../mypage.html");
	}else{
		out.println("<script>alert('로그인 실패하였습니다.')</script>");
		response.sendRedirect("../login.html");
	}
%>