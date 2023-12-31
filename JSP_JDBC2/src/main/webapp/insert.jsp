<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 폼에서 넘어온 값 캐릭터셋 설정 -->
<%request.setCharacterEncoding("utf-8"); %>
    
    
    
<%
Connection con = null;
String url = "jdbc:oracle:thin:@localhost:1521:xe"; 
String user = "user1";
String pw = "1234";
PreparedStatement pstm = null; // sql문을 나타내는 객체
ResultSet rs = null; // 쿼리문을 날린 것에 대한 반환값을 담는 객체

try{
	Class.forName("oracle.jdbc.driver.OracleDriver"); // jdbc 드라이버 로딩
	
	con = DriverManager.getConnection(url, user, pw); // Connection 객체 생성(db 연결)
	
	if(con != null){
		out.println("db연결 OK!");
	}
	
	String sql = "insert into users values(?,?,?,?)";
	pstm = con.prepareStatement(sql);
	
	pstm.setInt(1, Integer.parseInt(request.getParameter("num")));
	pstm.setString(2, request.getParameter("name"));
	pstm.setInt(3,  Integer.parseInt(request.getParameter("birth")));
	pstm.setString(4,request.getParameter("address"));

		
	rs = pstm.executeQuery();
		
	while(rs.next()){
		out.println(rs.getString("num"));
	}
	
}catch(Exception e){
	e.getStackTrace();
}


%>   


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<title>파일이름: insert.jsp</title>
</head>
<body>
<body class="container">
<div class="jumbotron">
	<h1>User 정보</h1>
</div>
<table class="table table-striped">
	<thead class="thead-dark">
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>생년월일</th>
			<th>주소</th>
		</tr>
	</thead>
	<tbody>
	


	</tbody>


<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<Script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<Script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<Script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

</body>
</html>
