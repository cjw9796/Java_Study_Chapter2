<%@page import="com.green.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
	int num = Integer.parseInt(request.getParameter("num"));
	String password = request.getParameter("password");
	
	int result = BoardDAO.getInstance().boardDelete(num, password);
	if(result ==1){
		
	%>
	<script>
		alert("삭제 되었습니다.");
		window.location.href="_04boardList.jsp"
	</script>
	<%
	}else if(result == -1){
	%>
	<script>
		alert("비밀번호를 확인해주세요!");
		history.go(-1); //이전 페이지로 돌아가기 위해서 사용하는 메서드 	
	</script>
	<%
	}
	%>
	

</body>
</html>