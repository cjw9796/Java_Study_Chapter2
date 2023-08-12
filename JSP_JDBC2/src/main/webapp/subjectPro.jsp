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
	
	String sql = "SELECT * FROM STUDENTS";
	pstm = con.prepareStatement(sql);
	
	//pstm.setInt(1, Integer.parseInt(request.getParameter("num")));
	//pstm.setString(2, request.getParameter("name"));
	//pstm.setInt(3,  Integer.parseInt(request.getParameter("birth")));
	//pstm.setString(4,request.getParameter("address"));

		
	rs = pstm.executeQuery();
		
	
	
	//로그인 처리 
	/*
			String LoginSTUDENTNUM = request.getParameter("STUDENTNUM");
			out.println(LoginSTUDENTNUM + "님" + LoginSTUDENTNUM + "입니다. <br>");
			
			String Loginpassword = request.getParameter("password");
			out.println(Loginpassword + "님 비밀번호:" + Loginpassword + "입니다. <br>");
			
		if (LoginSTUDENTNUM == rs.getString("STUDENTNUM") && Loginpassword == rs.getString("PASSWORD")){
			out.println("하이");
		}else{
			out.println("비밀번호를 확인");
		}
		*/
		
		String loginSTUDENTNUM = request.getParameter("STUDENTNUM");
	    String loginPassword = request.getParameter("password");
	    
	    boolean found = false;
	    while (rs.next()) {
	        if (loginSTUDENTNUM.equals(rs.getString("STUDENTNUM")) && loginPassword.equals(rs.getString("PASSWORD"))) {
	            found = true;
	          
	            break;
	        }
	    }

	    if (found) {
	        out.println("로그인 성공");
	    } else {
	        out.println("비밀번호를 확인");
	    }
	
}catch(Exception e){
	e.getStackTrace();
}


%>    
 
    
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
	<h1> 수강신청 </h1>
	</div>
	
		<!-- 스트라이프 행! 줄무늬 -->
		<!-- 학생정보 테이블 -->
	<table class = "table tavle-striped">
	<thead class = "thead-dark">
		<tr>
			<th>NAME</th>
			<th>STUDENTNUM</th>
			<th>MAJOR</th>
			<th>YEAR </th>
			<th>MINIMUM_CREDIT</th>
			<th>MAXIMUM_CREDIT </th>
			<th>PASSWORD</th>
		</tr>
	
	
	</thead>
	<tbody>
	<%	
			
		while(rs.next()){
			
			
		out.println("<tr>");
		
		out.println("<td>" + rs.getString("NAME") + "</td>" );
		out.println("<td>" + rs.getString("STUDENTNUM") + "</td>");
		out.println("<td>" + rs.getString("MAJOR") + "</td>");
		out.println("<td>" + rs.getString("YEAR") + "</td>");
		out.println("<td>" + rs.getString("MINIMUM_CREDIT") + "</td>");
		out.println("<td>" + rs.getString("MAXIMUM_CREDIT") + "</td>");
		out.println("<td>" + rs.getString("PASSWORD") + "</td>");
	
		out.println("</tr>");
		}
	%>
	</tbody>
	</table>
	
	
			<!-- 스트라이프 행! 줄무늬 -->
			<!-- 수강신청 메뉴 테이블 -->
	<table class = "table tavle-striped">
	<thead class = "thead-dark">
		<tr>
			<th>공지사항</th>
			<th>교과목 조회</th>
			<th>수강신청</th>
			<th>수강신청 조회</th>
		</tr>
	
	
	</thead>
	<tbody>
	<%--		
		while(rs.next()){
		out.println("<tr>");
		
		out.println("<td>" + rs.getString("NAME") + "</td>" );
		out.println("<td>" + rs.getString("STUDENTNUM") + "</td>");
		out.println("<td>" + rs.getString("MAJOR") + "</td>");
		out.println("<td>" + rs.getString("YEAR") + "</td>");
		out.println("<td>" + rs.getString("MINIMUM_CREDIT") + "</td>");
		out.println("<td>" + rs.getString("MAXIMUM_CREDIT") + "</td>");
		out.println("<td>" + rs.getString("PASSWORD") + "</td>");
	
		out.println("</tr>");
		}
	--%>
	</tbody>
	</table>


	<!-- Optional JavaScript -->
  <!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <Script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
  <Script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
  <Script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
	


</body>
</html>