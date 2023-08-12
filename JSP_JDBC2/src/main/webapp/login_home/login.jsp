<%@page import="java.sql.Date"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	 <!-- 폼에서 넘어온 값 캐릭터셋 설정(한글 깨짐 방지) -->
<%request.setCharacterEncoding("utf-8"); %>

<%
	// 오라클하고 이클립스랑 연결을 도와주는 ojdbc를 추가했다.
	Connection con = null;
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "user1";
	String pass = "1234";

	try {
		//오라클 데이터베이스의 드라이버를 가지고 와야된다.
		Class.forName("oracle.jdbc.driver.OracleDriver");

		// 실제 연동 
		con = DriverManager.getConnection(url, user, pass);

		if (con != null) {
			out.println("연결!");
		}
	} catch (ClassNotFoundException e) {
		out.println("드라이버의 정보가 잘못 됐습니다!");

	} catch (SQLException e) {
		out.println("데이터베이스 접속 에러 입니다!");
	}
	
	//UPDATE
	String sql3 = "UPDATE LOGIN SET DBPW = '100' WHERE DBID = '555'";
	PreparedStatement pstm3 = con.prepareStatement(sql3);
	ResultSet rs3 = pstm3.executeQuery(); 
	
	//DELETE
		String sql4 = "DELETE FROM LOGIN WHERE DBID = ?";
		PreparedStatement pstm4 = con.prepareStatement(sql4);
		
		pstm4.setString(1, "77777");
		
		ResultSet rs4 = pstm4.executeQuery(); 
		
	
	//INSERT
	String sql2 = "insert into login values(?,?)";
	PreparedStatement pstm2 = con.prepareStatement(sql2);
	
	pstm2.setString(1, request.getParameter("dbid"));
	pstm2.setString(2, request.getParameter("dbpw"));
	ResultSet rs2 = pstm2.executeQuery(); 
	
	
	
	//SELECT
	String sql = "select * from login";
	PreparedStatement pstm = con.prepareStatement(sql);
	ResultSet rs = pstm.executeQuery(); // 실제 저장한 내용들을 가지고는 쿼리문
	
	%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">


<title>파일명:logn.jsp</title>
</head>
<body class="container">

	<div class="jumbotron">
		<h1>Form 태그</h1>
		<p>login</p>
		<p>모든 정보를 출력해주세요~</p>
	</div>
	<table class="table">
		<thead>
			<tr>
				<th scope="col">아이디</th>
				<th scope="col">비밀번호</th>

			</tr>
		</thead>
		<tbody>

			<%
				while (rs.next()) {

					out.println("<tr>");
					out.println("<td>" + rs.getString("dbid") + "</td>");
					out.println("<td>" + rs.getString("dbpw") + "</td>");
					out.println("</tr>");
				}
			%>
		</tbody>
	</table>






	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<Script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<Script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<Script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

</body>
</html>