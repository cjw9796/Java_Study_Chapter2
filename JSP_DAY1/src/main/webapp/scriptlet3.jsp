<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%!
// player 클래스 정의 
	class player{
	
	Integer number;
	String name; 
	String position;
	
	// 생성자 
	player(Integer number, String name, String position){
		this.number = number;
		this.name = name; 
		this.position = position;
	}
	
}
%>    

<%!
	//배열 정의 
	int[] numbers = {1,2,3,4,5,6};
	String[] name = {"에이","비이","씨이","디이","이이","에프"};
	String[] positions = {"GK","DF","MF","FW","CDM","CAM"};
	player[] players = new player[numbers.length];
	
	
%>

<%
//배열 초기화
	for(int i = 0; i< players.length; i++){
		players[i] = new player(numbers[i], name[i], positions[i]);
	}
	
%>






<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일이름 : scrptlet3.jsp</title>
<!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  
  
</head>
<body class = "container">

	<div class ="jumbotron"> 
	<h1> 선 수 </h1>
	</div>
	
	<!-- 스트라이프 행! 줄무늬 -->
	<table class = "table tavle-striped">
	<thead class = "thead-dark">
		<tr>
			<th>번호</th>
			<th>포지션</th>
			<th>이름</th>
		</tr>
	
	
	</thead>
	<tbody>
	<%
		out.println("<tr>");
	for (player player : players) {
		out.println("<td>" + player.number + "</td>");
		out.println("<td>" + player.position + "</td>");
		out.println("<td>" + player.name + "</td>");
		out.println("</tr>");
	}
	%>
	
	</tbody>
	</table>
	
	

<%-- 
선언부, 표현식, 스크립트릿 body안에 넣을 필요 없다.

변수와 메서드를 선언되면 해당 파일 어느 곳이든지 사용 가능하다. 
<% ~~~ %> 클래스도 안에 정의할 수 있다.
--%>

<!-- out.println() 으로 출력 -->

<%

	

%>

<%
//배열 출력
for (player player : players) {
    out.println("Number: " + player.number);
    out.println("Name: " + player.name );
    out.println("Position: " + player.position + "<br><br>");
}
%>


<%-- <%=%> 으로 출력 --%>

    <ul>
        <% for (player player : players) { %>
            <li>Number: <%= player.number %></li>
            <li>Name: <%= player.name %></li>
            <li>Position: <%= player.position %></li>
            <br>
        <% } %>
    </ul>
    
    
    
   <!-- Optional JavaScript -->
  <!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <Script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
  <Script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
  <Script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

</body>
</html>