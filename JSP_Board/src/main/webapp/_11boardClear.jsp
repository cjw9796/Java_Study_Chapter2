<%@page import="com.green.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>_11boardClear.jsp</title>
</head>
<body>
	<!-- 한글 깨짐 방지 -->
	<%request.setCharacterEncoding("UTF-8");%>
	
	<%
	// DAO클래스로 데이터를 전송해서 처리하는 내용 
		BoardDAO.getInstance().boardClear();
	
	//새 글을 보여주는 목록으로 이동을 시킨다.
		response.sendRedirect("_04boardList.jsp");
	%>
</body>
</html>