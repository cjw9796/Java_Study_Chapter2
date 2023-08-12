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
		session.invalidate();
	%>
	<script type="text/javascript">
		alert("!로 그 아 웃! 되었습니다!");
		location.href="00_login.jsp";
	</script>
	
</body>
</html>