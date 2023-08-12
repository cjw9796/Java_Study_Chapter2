<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="db.DBUtil"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

	<!-- 입력 화면 시작 -->
	<form action="memoInsert.jsp" method="post">
		<table width="1000" align="center" border="1" cellpadding="5" cellspacing="0">
			<tr>
				<th colspan="3">출첵 게시판1 Ver 0.01</th>
			</tr>
			<tr>
				<th width="100">이름</th>
				<th width="100">비밀번호</th>
				<th width="800">메모</th>
			</tr>
			<tr>
				<td align="center">
					<input type="text" name="name" style="width: 90%; height: 25px;"/>
				</td>
				<td align="center">
					<input type="password" name="password" style="width: 90%; height: 25px;"/>
				</td>
				<td align="center">
					<input type="text" name="memo" style="width: 92%; height: 25px;"/>
					<input type="submit" value="저장"/>
				</td>
			</tr>
		</table>
	</form>
	
	<br />
	<hr size="3" color="blue" />
	<br />
	
	<!-- 테이블에 저장된 글 목록 전체를 글번호(idx)의 내림차순(최신글순)으로 얻어온다. -->
	<%
		Connection conn = DBUtil.getMysqlConnection();
		String sql = "SELECT * FROM MEMOLIST1 ORDER BY IDX DESC";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		//확인용으로 출력을 하고 싶으면 콘솔 출력! 
	%>
	
	<!-- 테이블에서 얻어온 글 목록을 출력한다. -->
	
	<table width="1200" align="center" border = "1" cellpadding="5" cellspacing="0">
		
		<tr>
			<th width="80">글번호</th>
			<th width="80">이름</th>
			<th width="840">메모</th>
			<th width="80">ip</th>
		</tr>
		<%
		if (rs.next()) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd(E)");

			do {
		%>
		<tr>
			<td align="center"><%=rs.getInt("idx")%></td>
			<td align="center"><%=rs.getString("name")%></td>
			<td align="center"><%=rs.getString("memo")%></td>
			<td align="center"><%=rs.getString("ip")%></td>

		</tr>
		<%
		} while (rs.next());
		} else {
		%>
		<tr colspan="5">
			<td>테이블에 저장된 글이 없습니다.</td>  
			<!--<marquee>테이블에 저장된 글이 없습니다.</marquee>   -->
			
		</tr>
		
		<%
		}
		%>
		
	</table>


</body>
</html>