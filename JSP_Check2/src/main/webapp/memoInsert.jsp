<%@page import="java.sql.PreparedStatement"%>
<%@page import="DB.DBUtil"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memoInsert.jsp</title>
</head>
<body>
	<!-- 한글 깨짐 방지 -->
	<%request.setCharacterEncoding("UTF-8");%>
	
	
	<%
	
	String name = request.getParameter("name");
	String password = request.getParameter("password");
	String memo= request.getParameter("memo");
	String ip = request.getRemoteAddr(); //접속자 ip 주소를 받는다. 
	
	Connection conn = DBUtil.getMysqlConnection();
	
	
	String sql = "INSERT INTO memolist1(name, password, memo, ip) VALUES(?,?,?,?)";
	
	//sql 명령을 임시로 실행한다.
	PreparedStatement pstmt = conn.prepareStatement(sql);

	//?에 데이터 해운다.
	pstmt.setString(1,name);
	pstmt.setString(2,password);
	pstmt.setString(3,memo);
	pstmt.setString(4,ip);
	
	//sql 명령문을 데이터베이스로 질의(전송)
	pstmt.executeUpdate();
	DBUtil.close(conn);
	
	//테이블에 저장된 데이터를 브라우저에 출력하기 위해서 memoList3.jsp로 넘겨준다.
	response.sendRedirect("memoList3.jsp");
	
	
	
	%>


</body>
</html>