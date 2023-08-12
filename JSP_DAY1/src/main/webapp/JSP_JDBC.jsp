<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일명: JSP_JDBC.JSP</title>
</head>
<body>
	
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
			String sql = "select * from cafe";
			pstm = con.prepareStatement(sql);
			rs = pstm.executeQuery();
		
			while(rs.next()){ //행의 목록을 가지고 와라!
				out.println(rs.getString("CAFEID"));
				
			}
			
			
			
			
		}catch(Exception e){
			out.println(e.toString());
		}finally {
		    // 자원 해제
		    try {
		        if (rs != null) {
		            rs.close();
		        }
		    } catch (SQLException e) {
		        out.println("ResultSet 닫기 오류: " + e.toString());
		    }

		    try {
		        if (pstm != null) {
		            pstm.close();
		        }
		    } catch (SQLException e) {
		        out.println("PreparedStatement 닫기 오류: " + e.toString());
		    }

		    try {
		        if (con != null) {
		            con.close();
		        }
		    } catch (SQLException e) {
		        out.println("Connection 닫기 오류: " + e.toString());
		    }
		}
		
		
	%>
			
	

</body>
</html>