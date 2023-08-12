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
<title>Insert title here</title>


<style type="text/css">
a {
	color: black;
	text-decoration: none;
}

a:hover {
	color: red;
	text-decoration: none;
}

span {
	color: white;
	background-color: red;
}
</style>

</head>
<body>

	<form action="memoInsert.jsp" method="post">
		<table width="1000" align="center" border="1" cellpadding="5" cellspacing="0">
			<tr>
				<th colspan="3">출첵 게시판2 Ver 0.01</th>
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
	
	<%
	//1. ------------------------------------------------------------------
	// 페이징 작업에 필요한 변수를 선언한다. 
	int pageSize = 10; //1페이지에 표시하는 글의 개수 
	int totalCount = 0; //테이블에 저장된 전체 글의 개수 
	int totalPage = 0; //전체 페이지 수 
	int currentPage = 1; //현재 브라우저에 표시되는 페이지 번호 
	int startNo = 0; //현재 브라우저에 표시되는 글의 시작 인덱스 번호 -> mysql은 0부터 시작
	int endNo = 0; //현재 브라우저에 표시되는 글의 마지막 인덱스 번호 
	int startPage = 0; //페이지 이동 하이퍼링크 또는 버튼에 표시될 시작 페이지 번호 
	int endPage = 0; //페이지 이동 하이퍼링크 또는 버튼에 표시될 마지막 페이지 번호 
	
	//2. --------------------------------------------------------------------
	// 연결
	
	 	Connection conn = DBUtil.getMysqlConnection();
	
	// totalCount 변수에 테이블에 저장된 전체 글의 개수를 얻어와서 저장한다.
		String sql = "SELECT COUNT(*) FROM MEMOLIST1";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
	
	//테이블에 저장된 글이 있으면 글의 개수를 얻어와서 ResultSet에 저장 
	//데이터가 있으면 글의 개수를 가지고 온다. 만약 없으면 0을 ResultSet에 저장한다.
	//현재 사용하는 테이블은 4명 기본 적용 물어볼 필요가 없다.
	rs.next();
	totalCount = rs.getInt(1);
	//out.println("테이블 저장된 전체 글의 개수:" + totalCount + "<br />");
	
	//totalPage 변수에 전체 페이지 개수를 계산해서 저장한다. 
	totalPage = (totalCount -1) / pageSize +1;
	//out.println("전체 페이지의 개수:" + totalPage + "<br />");
	
	//3. --------------------------------------------------------------------
	// 이전 페이지에서 넘어온 브라우저에 표시할 페이지 번호를 받는다. 
	// 이전 페이지에서 currentPage가 넘어오지 않으면 넘어오는 값이 없으므로 null이다. 
	// null이 오면 정수를 저장하는 변수는 예외가 발생한다. 예외처리를 해야된다. NumberFormatException
	// 정상적으로 넘어오면 문자로 넘어오는 값을 정수형태로 변환해서 currentPage변수에 저장하고
	// 그렇지 않으면 초기값으로 지정한 1이 유지되게 한다. 
	
	try{
	currentPage = Integer.parseInt(request.getParameter("currentPage"));
	
		//현재 화면에 표시할 페이지 번호는 전체 페이지 개수보다 클 수 없으므로 화면에 표시할 페이지 번호가
		//전체 페이지 개수보다 큰 값이 넘어왔다면 화면에 표시할 페이지 번호를 
		//전체 페이지 개수로 수정한다.
		
		currentPage = currentPage > totalPage ? totalPage : currentPage;
	
	}catch(NumberFormatException e){}
	// out.println("현재 화면에 표시되는 페이지 번호:" +currentPage+ "페이지<br />");
	
	
	//4. --------------------------------------------------------------------
	//startNo 변수에 현재 화면에 표시할 글 목록의 인덱스 번호를 계산한다. 
	//mysql select 했을때 맨 처음 나오는 글의 번호: mysql은 0번 오라클은 1부터 시작.
	startNo = (currentPage-1) * pageSize; 
	
	//mysql limit, 오라클은 계산해야된다.
	endNo = startNo + pageSize -1; 
	
	endNo = endNo > totalCount ? totalCount : endNo;
	
	// mysql에서 limit 사용해서 뽑아오기
	
	sql = "SELECT * FROM MEMOLIST1 ORDER BY IDX DESC LIMIT ? , ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1,startNo);
	pstmt.setInt(2,pageSize);
	rs = pstmt.executeQuery();
	
	%>

	<table width="1000" align="center" border="1" cellpadding="5" cellspacing="0">
	
		<tr>
			<th width="80">글번호</th>
			<th width="80">이름</th>
			<th width="800">메모</th>
			<th width="80">ip</th>
		</tr>
		
		<%
		if(rs.next()){
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd(E)");
			do{				
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
		</tr>
		
		<%
		}
		%>
		
		<!-- 6. 첫 페이지부터 마지막 페이지까지 이동할 수 있는 하이퍼링크 또는 버튼을 만든다. -->
		<tr>
			<td colspan="5">
				<%
				for (int i = 1; i <= totalPage; i++) {
					if (currentPage == i) {
				%>
				<button type="button" disabled="disabled"><%=i%></button> <%
 			} else {
 			%>
				<button type="button" onclick="location.href='?currentPage=<%=i%>'"><%=i%></button>
				<%
				}
			}
				%>

			</td>
		</tr>
		
<%--
	for (int i=1; i<=totalPage; i++) {
		if (currentPage == i) {
			out.println("<button type='button' disabled='disabled'>" + i + "</button>");
		} else {
			out.println("<button type='button' onclick='location.href=\"?currentPage=" + i + 
				"\"'>" + i + "</button>");
		}
	}
--%>



	</table>
</body>
</html>