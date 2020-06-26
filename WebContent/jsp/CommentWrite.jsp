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

		CommentDAO commentDao = new CommentDAO();
		UserDAO userDAO = new UserDAO();
		
		String comment = request.getParameter("comment");
		int pno = Integer.parseInt(request.getParameter("pno"));
		int uno = (int)session.getAttribute("no");
		String id = userDAO.user(uno).getId();
				
		CommentVO vo = new CommentVO();
		vo.setContents(comment);
		vo.setPno(pno);
		vo.setUno(uno);
		vo.setId(id);
		
		String status = commentDao.insert(vo);
		if(status.equals("OK")){
			response.sendRedirect("../Detail.jsp?no=" + pno);
		}else{
			out.print("<script>alert('댓글 작성이 실패하였습니다')</script>");
			out.println("<script>window.history.back();</script>");
		}	
	}
%>