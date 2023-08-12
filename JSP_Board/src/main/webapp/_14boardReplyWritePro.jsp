<%@page import="com.green.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>_14boardReplyWritePro.jsp</title>
</head>
<body>
	<!--1. 등록하기를 누르면 실제 DTO가 객체 생성을 해야된다. 액션태그를 이용하기 
		2. 글의 번호가 몇번인지 가지고 오기
		3. DAO가 처리할 수 있도록 boardReplyWrite(번호,board)
		4. sendRedirect(_04boardList.jsp)
		
		답글을 저장하는 메서드 DAO안에 작성
		
		현재 답글을 단 게시글의 번호를 가지고 온다. 
		그 게시글의 실제 저장을 맡고 있는 arrlist의 index를 가지고 와야된다. ref 변수들을 이용해서 답글에 대해 추가하는 내용을 작성!
		새로운 답글도 list 추가를 해야된다. 그리고 idNum 증가 	
	-->
	
	<%
		request.setCharacterEncoding("UTF-8");
	
		int num = Integer.parseInt(request.getParameter("num"));
	%>
	
	<jsp:useBean id="board" class="com.green.board.BoardDTO">
		<jsp:setProperty name = "board" property="*"/>
	</jsp:useBean>
	
	<%
		BoardDAO.getInstance().boardReplyWrite(num,board);
		response.sendRedirect("_04boardList.jsp");		
	%>
	

	
</body>
</html>