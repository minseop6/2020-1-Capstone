<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DAO.*" %>
<%@ page import="VO.*" %>

<%
	if(session.getAttribute("no") == null){
		out.println("<script>alert('로그인이 필요한 서비스 입니다.');</script>");
		out.println("<script>location.href='../write.html'</script>");
	}else{
		request.setCharacterEncoding("UTF-8");

		String title = request.getParameter("title");
		String contents = request.getParameter("contents");
		int uno = Integer.parseInt((String)session.getAttribute("no"));
		
		PoemVO vo = new PoemVO();
		vo.setTitle(title);
		vo.setContents(contents);
		vo.setUno(uno);

		PoemDAO dao = new PoemDAO();
		String status = dao.insert(vo);
		if(status.equals("OK")){
			response.sendRedirect("../PoemList.jsp");
		}else{
			out.print("<script>alert('게시글 작성이 실패하였습니다')</script>");
			out.println("<script>location.href='../write.html'</script>");
		}	
	}
%>