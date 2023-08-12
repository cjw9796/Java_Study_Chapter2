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
<title>memoList3.jsp</title>
</head>
<body>
	<form action="memoInsert.jsp" method="post">
		<table width="1000" align="center" border="1" cellpadding="5" cellspacing="0">
			<tr>
				<th colspan="3">출첵 게시판3 Ver 1.0</th>
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

	<br/>
	<hr size="3" color="dodgerblue"/>
	<br/>
	
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
			
				// 테이블에 저장된 글이 있으면 글의 개수를 얻어와서 ResultSet에 저장 
				// 데이터가 있으면 글의 개수를 가지고 온다.만약 없으면 0을 resultset 객체에 저장한다.
				rs.next();
				totalCount = rs.getInt(1);
			
				//totalPage 변수에 전체 페이지 개수를 계산해서 저장한다. 
				totalPage = (totalCount -1) / pageSize +1;
			
			//3. --------------------------------------------------------------------	
			// 이전 페이지에서 넘어온 브라우저에 표시할 페이지 번호를 받는다. 
			// 이전 페이지에서 currentPage가 넘어오지 않으면 넘오는 값이 없으므로 null이다. 
			// null오면 정수를 저장하는 변수는 예외가 발생한다. 예외처리를 해야된다. NumberFormatException
			// 정상적으로 넘어오면 문자로 넘어오는 값을 정수형태로 변환해서 currentPage변수에 저장하고 
			// 그렇지 않으면 초기값으로 지정한 1이 유지되게한다. 
		
			try {
				currentPage = Integer.parseInt(request.getParameter("currentPage"));
				currentPage = currentPage > totalPage ? totalPage : currentPage;
				//현재 화면에 표시할 페이지 번호는 전체 페이지 개수보다 클 수 없으므로 화면에 표시할 페이지 번호가
				//전체 페이지 개수보다 큰 값이 넘어왔다면 화면에 표시할 페이지 번호를 
				//전체 페이지 개수로 수정한다.

			} catch (NumberFormatException e) {
			}

			//4. --------------------------------------------------------------------	
			//startNo 변수에 현재 화면에 표시할 글 목록의 인덱스 번호를 계산한다. 
			//mysql select 했을때 맨 처음 나오는 글의 번호: mysql은 0번 오라클은 1부터 시작.
			startNo = (currentPage - 1) * pageSize;

			//mysql limit, 오라클은 계산해야된다.
			endNo = startNo + pageSize - 1;

			endNo = endNo > totalCount ? totalCount : endNo;

			//mysql에서 limit 사용해서 뽑아오기
			sql = "SELECT * FROM MEMOLIST1 ORDER BY IDX DESC LIMIT ? , ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startNo);
			pstmt.setInt(2, pageSize);
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
		
		<tr>
			<td colspan ="5" align = "center">
			<!--  10페이지 단위로 페이지 이동 버튼을 추가한다.  -->
		<%
		// 페이지 이동 버튼의 시작페이지 번호와 마지막 페이지 번호를 계산한다.
		startPage = (currentPage -1) /10 * 10 + 1;
		endPage = startPage + 9;
		// 페이지 이동 버튼의 마지막 페이지 번호가 전체 페이지 수보다 커지면 존재하지 않는 페이지
		// 번호가 표시되므로 마지막 페이지 번호를 전체 페이지 번호로 수정한다. 
		endPage = endPage > totalPage ? totalPage : endPage;
		
		// 처음으로 
		// currentPage가 1보다 크다면 처음으로 이동할 수있다. 
		if(currentPage > 1){
		%>
		<button type ="button" title ="첫 페이지로 이동합니다." 
		onclick="location.href='?currentPage=1'">처음</button>
		
		<%
			}else{
		%>
		<button type ="button" disabled ="disabled"
		 		title ="이미 첫 페이지 입니다.">처음</button>
		
		<%} 
		
		//10페이지 단위로 페이지 이동하는 버튼을 출력한다.
		for(int i = startPage; i<=endPage; i++){
			if(currentPage == i){
		%>		
				<button type="button" disabled="disabled"><%=i%></button>
		<%
			}else{%>
			<button type="button" onclick="location.href='?currentPage='<%=i%>"><%=i%> </button>
			
			<%
			} //if~else
		} //for
		%>
		

		
		<%
		 // 10페이지 뒤로 가기
   		 // endPage가 totalPage보다 작으면 다음 페이지로 이동할 수 있습니다.
  
    	if(endPage < totalPage){
		%>
		<button type="button" title="다음 10페이지로 이동합니다." onclick="location.href='?currentPage=<%=endPage+1%>'"> 
		다음
		</button>
    		
    	<%}else{ %>
    	
    	<button type="button" disabled="disabled" title="이미 마지막 10페이지 입니다.">
    	다음
    	</button>
    	<%}
    	%>
    	
    	<%
    	
		//마지막으로
		//currentPage가 totalPage보다 작으면 마지막 페이지로 이동할 수 있다. 
			
    	if(currentPage < totalPage){
    	%>
    		<button type="button" title="마지막페이지로 이동합니다." onclick="location.href='?currentPage=<%=totalPage%>'"> 
    		마지막
    		</button>
    	<%}else{ %>
    	
		<button type="button" disabled="disabled" title="이미 마지막 페이지 입니다.">
    	마지막
    	</button>
    		<%} %>
		
			</td>
		</tr>
	

</body>
</html>