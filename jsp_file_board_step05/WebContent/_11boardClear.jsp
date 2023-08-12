<%@page import="com.green.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 게시글 삭제</title>
</head>
<body>
	<%
		BoardDAO.getInstance().boardClear();
		response.sendRedirect("_04boardList.jsp");
	%>
</body>
</html>