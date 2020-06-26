<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DAO.*" %>
<%@ page import="VO.*" %>

<%
	UserVO vo = new UserVO();
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	vo.setId(id);
	vo.setPw(pw);
	
	UserDAO dao = new UserDAO();
	String res = dao.signup(vo);
	if(res.equals("OK")){
		response.sendRedirect("../login.html");
	}else{
		out.println("<script>alert('회원가입 실패하였습니다.')</script>");
		response.sendRedirect("../signup.html");
	}
%>