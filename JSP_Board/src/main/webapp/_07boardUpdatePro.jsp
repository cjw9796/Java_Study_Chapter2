<%@page import="com.green.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>_07boardUpdatePro.jsp</title>
</head>
<body>
	<!-- 한글 깨짐 방지 -->
	<%request.setCharacterEncoding("UTF-8");%>
	
	<jsp:useBean id="boardDTO" class="com.green.board.BoardDTO">
		<jsp:setProperty name ="boardDTO" property="*" />
	
	</jsp:useBean>
	
	<%
		BoardDAO.getInstance().boardUpdate(boardDTO);
		response.sendRedirect("_04boardList.jsp");
		
	%>
	


</body>
</html>