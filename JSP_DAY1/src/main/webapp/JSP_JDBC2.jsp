<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%!
//USERTBL 클래스 정의 (VO클래스 생성해서 출력하는게 이게 맞는지? 체크)
	class USERTBL{
	
	String userID; 
	String userName;
	Integer birthYear;
	
	// 생성자 
	USERTBL(String userID, String userName, Integer birthYear){
		this.userID = userID;
		this.userName = userName; 
		this.birthYear = birthYear;
	}
	
 }
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일명: JSP_JDBC2.JSP</title>
<!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  

</head>
<body class = "container">

	<div class ="jumbotron"> 
	<h1> USER 정보 </h1>
	</div>
	
	<% request.setCharacterEncoding("UTF-8"); %>
	
	<%
	
		String url = "jdbc:oracle:thin:@localhost:1521:xe"; 
		String user = "user1";
		String pw = "1234";
		
		
		Connection con = null;
		PreparedStatement pstm = null; // sql문을 나타내는 객체
		ResultSet rs = null; // 쿼리문을 날린 것에 대한 반환값을 담는 객체
		
		
		try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		con = DriverManager.getConnection(url, user, pw);
		
			if(con!= null){
				out.println("DB 연결 성공");
			}
		
			// 현재 데이터베이스를 선택해서 가져오기 
			String sql = "select * from USERTBL";
			pstm = con.prepareStatement(sql);
			rs = pstm.executeQuery();
		
		//	while(rs.next()){ //행의 목록을 가지고 와라!
		//		rs.getString("USERID");
		//		rs.getString("USERNAME");
		//		rs.getString("birthYear");
				
		//	}  이 부분을 tbody에서 <tr>
			
			
			
			
		}catch(Exception e){
			out.println(e.toString());
		}
		
		
		
	%>
	
		<!-- 스트라이프 행! 줄무늬 -->
	<table class = "table tavle-striped">
	<thead class = "thead-dark">
		<tr>
			<th>USERID</th>
			<th>USERNAME</th>
			<th>birthYear</th>
		</tr>
	
	
	</thead>
	<tbody>
	<%		
		while(rs.next()){
		out.println("<tr>");
		out.println("<td>" + rs.getString("USERID") + "</td>" );
				
		out.println("<td>" + rs.getString("USERNAME") + "</td>");
				
		out.println("<td>" + rs.getString("birthYear") + "</td>");
	
		out.println("</tr>");
		}
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