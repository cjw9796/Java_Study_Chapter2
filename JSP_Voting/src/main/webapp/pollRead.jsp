<%@page import="java.util.ArrayList"%>
<%@page import="com.Voting.PollRead"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일명 : pollRead.jsp</title>
</head>
<body>

	<!-- 투표 항목이 저장된 텍스트 파일의 데이터를 읽어서 웹 브라우저에 출력한다. -->
	<%
	//이클립스에서 프로젝트를 실행하면 프로젝트가 이클립스 내부적으로 사용하는 웹 서버에 복사하고 실행된다. 
	// "/" web root(홈페이지의 최초 진입 경로)를 의미한다.
	// real(실제) path(경로)
	
	String filepath = application.getRealPath("/") + "poll.txt";
	
	// 경로를 넘겨주고 파일의 데이터를 저장해서 Arraylist 객체를 생성해서 poll에 저장한다. 
	ArrayList<String> poll = PollRead.pollRead(filepath);
	
	//투표 항목의 개수 
	int itemCount = (poll.size()-1) / 2;	
	%>

	<form action="pollWrite.jsp" method="post">

	<table width="700" border="1" align="center" cellpadding="5"
		cellspacing="2">
		
		<tr>
		
			<th><%=poll.get(0) %> </th> <!-- 칸, 표의 첫줄을 구성하는 칸, 굵게 및 가운데 정렬되서 표시된다. -->
				
		</tr>
		
		<%
			for(int i = 1; i<= itemCount; i++){
				%>		
			
			
			<tr>
				<td>
					<input type = "radio" name = "poll" value = "<%=i%>"> <%=poll.get(i)%>
				</td>
			</tr>
		<%} %>
		
		<!-- 투표하기 버튼과 결과보기 버튼을 만든다. -->
		<tr>
			<td align = "center">
				<input type="submit" value="투표하기">
				<input type="button" value="결과보기" onclick = "location.href='pollResult.jsp'">
			
			</td>
			
		</tr>
		
	</table> 	
	
	
	</form>

	

</body>
</html>