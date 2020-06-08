<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DAO.*" %>
<%@ page import="VO.*" %>

<%
	request.setCharacterEncoding("UTF-8");

	String title = request.getParameter("title");
	String contents = request.getParameter("contents");
	int uno = 1;
	
	PoemVO vo = new PoemVO();
	vo.setTitle(title);
	vo.setContents(contents);
	vo.setUno(uno);

	PoemDAO dao = new PoemDAO();
	String status = dao.insert(vo);
	if(status.equals("OK")){
		response.sendRedirect("list.html");
	}else{
		out.println("<script>alert('게시글 작성이 실패하였습니다')</script>");
		response.sendRedirect("write.html");
	}
%>