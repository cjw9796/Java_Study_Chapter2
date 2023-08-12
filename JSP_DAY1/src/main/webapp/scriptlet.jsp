<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일이름 : scrptlet.jsp</title>
</head>
<body>

<!-- 
	정적 웹페이지
	- 언제 접속해도 같은 응답을 보내준다.
	- css, html, javascript 등이 업로드 되면 개발자가 수정하기 전까지 매번 같은 파일을 브라우저가 건네준다.
		즉 정적 웹페이지에 대한 요청을 받은 경우 서버는 추가적인 처리과정 없이 클라이언트에게 응답 보낸다. 

	동적 웹페이지 
	- 웹 서버가 동적 웹페이지에 대한 요청을 받은 경우 서버는 추가적인 처리과정 이후 클라이언트에게 응답을 보낸다.
	- 동적페이지는 방문자와 상호 작용하기 때문에 페이지 내용은 그때 그때 다르다.
	- 댓글, 날씨 주가 정보 등 같이 정보 변경이 잦은 곳에 많이 사용된다. 
 -->
 
 <h1> 1. 출력 </h1>
 <%
 	String name = "김철수";
 	System.out.println(name); //console에 데이터를 출력 
 	out.println(name); //html에서 데이터를 출력하는 자바의 메서드
 %>
 
 <!-- html 코드 -->
 출력결과 : name 
 
 <br><br>
 
 <!-- html 코드 뒤에 jsp 문법으로 출력--> 
 출력 결과 : <%= name %> 
 
 <h1> 2. 조건문</h1>
 <%
 	String name2 = "이만수";
 %>
 <br><br>
 
 <% if(name2.equals("이만수")) {%>
	이만수 입니다.  
	<%} else {%>
	이만수 아닙니다.
<% } %>
<!-- 이렇게 쓰면 복잡하기 때문에 out.println을 사용한다.  -->

<h2> 3. import 속성 </h2>

<%
Random ran = new Random();

//배열의 초기화 블럭을 사용하면 배열의 선언, 메모리 할당, 초기값 설정을 한번에 할 수 있다.
String[] str = {"jsp", "java", "spring", "html5"};
int i = ran.nextInt(4);
out.println(str[i]);
%>

<br>

<%= str[i] %> 가 재미있다. <br>

<!-- 
java.sql.timestamp
	sql의 timestamp 타입에 대응하기 위해 만들어졌다.
	timestamp 클래스로 날짜, 시간과 관련한 데이터의 조작을 행하는 경우에 이용을 한다. 

 -->

 
	

<%
	//Timestamp now = new Timestamp(System.currentTimeMillis());
	//out.println(now.getHours() + "시");
	
	Timestamp now = new Timestamp(System.currentTimeMillis());
	SimpleDateFormat format = new SimpleDateFormat("yyyy-mm-dd");
	String strdate = format.format(now);
	
	out.println(strdate);
	
	Timestamp cur = new Timestamp(System.currentTimeMillis());
	out.println(cur);
%>
 
 현재는 <%= now.getMinutes() %>
 
 <h2> 4. 반복문</h2>
 
 <!-- 
 *
 **
 ***
 ****
 *****
 
 123A
 45BC
 6DEF
  -->
  
      <%
        for (int t = 1; t <= 5; t++) {
            for (int j = 1; j <= t; j++) {
                out.print("*");
            }
            out.println("<br>");
        }
        
    %>
    
    <%-- 
    int num = 1;
	char ch = 'A';
	
	for(int i = 0; i<4; i++){
		
		for(int j = 0; j < 4-i; j++){
			out.println(num++);								
		}
		for(int z = 0; z < i+1; z++){
			out.println(ch++);
		}	
		out.println("<br>");
	}
    
    --%>
    
     
  
	


</body>
</html>