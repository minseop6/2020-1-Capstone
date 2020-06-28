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
	UserVO user = dao.login(vo);
	if(user != null){
		session.setAttribute("no", user.getNo());
		
		if(user.getPower() == 1){
			response.sendRedirect("../Mypage.jsp");	
		}else{
			response.sendRedirect("../Admin.jsp");
		}
	}else{
		out.println("<script>alert('로그인 실패하였습니다.')</script>");
		response.sendRedirect("../login.html");
	}
%>