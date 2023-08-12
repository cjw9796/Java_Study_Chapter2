<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	테스트 
	
	<!-- 
	JSP(JavaServer Pages) : JSP는 자바 기반의 서버 사이드 스크립트 언어. HTML 코드와 자바 코드를 혼합하여 동적인 웹 페이지를 생성하는 데 사용  
	JSP가 실행되면 자바 서블릿(Servlet)으로 변환되며 웹 어플리케이션 서버에서 동작되면서 필요한 기능을 수행한다. 
	
	생성된 데이터를 웹페이지와 함께 클라이언트로 응답
	
	웹 어플리케이션(Web Application)
	- 웹에서 실행되는 응용프로그램을 뜻한다. (은행업무, 인터넷쇼핑, 뉴스보기 등등등) 
	- 사용자가 필요한 요청(request)를 하고 서버에서는 이에 해당하는 요청을 수행하고 
	- 응답(response) 
	
	웹 서버(Web Server)
	- 클라이언트로 부터 요청 받아 서버에 저장된 리소스를 클라이언트에게 전달하는 역할 
	
	웹 어플리케이션 서버(Web Application Server, WAS) 
	- 서버단에서 필요한 기능을 수행하고 그 결과를 웹서버에게 전달한다. 
	
	자바 서블릿(Java Servlet)
	- 웹 페이지를 동적으로 생성하기 위해 서버측 프로그램을 말한다. 
	-->
	
	<%-- jsp 주석
	<%@ 내용 %> 디렉티브 => 대부분 자동으로 입력된다. import 같이 설정에 관련된 정보들 
	<%! 내용 %> 선언부 => 프로그램에서 사용할 변수나 메서드를 정의한다. 
					=> java파일로 뽑아내서 사용한다. 
	<%= 내용 %> 표현식 => 변수에 저장된 결과나 연산 결과를 출력한다. 
					=> EL표기법 (${변수명}) 대체해서 사용한다. 
	<% 내용 %> 스크립트 릿 => 일반적인 JSP코드를 적는다. 
					  => JSTL로 대체해서 사용한다. 									
	 --%>
	 
	 
	
	
</body>
</html>