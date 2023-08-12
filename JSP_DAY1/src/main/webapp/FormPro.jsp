<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  
</head>
<body class = "container">

	<div class ="jumbotron"> 
	<h1> Form </h1>
	<h2> Form을 전송받은 정보</h2>
	</div>
	
		<!-- 스트라이프 행! 줄무늬 -->
	<table class = "table tavle-striped">
	<thead class = "thead-dark">
		<tr>
			<th>번호</th>
			<th>이메일</th>
			<th>비밀번호</th>
		</tr>
	
	
	</thead>
	<tbody>
	<%	
		int number = 1;
		out.println("<tr>");
		
		out.println("<td>" + number + "</td>");
		number++;
		
		String email = request.getParameter("email");
		out.println("<td>" + email + "</td>");
		
		String password = request.getParameter("password");
		out.println("<td>" + password + "</td>");
		out.println("</tr>");
	%>
	</tbody>
	</table>


<!-- Optional JavaScript -->
  <!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <Script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
  <Script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
  <Script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

</body>
</html>