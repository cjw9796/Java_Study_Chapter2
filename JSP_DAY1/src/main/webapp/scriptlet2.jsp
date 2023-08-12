<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일이름 : scrptlet2.jsp</title>
</head>
<body>

<!-- 

	스크립트릿은 JSP(JavaServer Pages) 페이지에서 Java 코드를 삽입하는 데 사용되는 구성 요소
	
	1. container 
	- 여러가지 컴포넌트를 가지며 컴포넌트들이 제공하는 각종 서비스를 관리하는 런타임 환경을 제공한다.  
	
	2. jsp page directive
	- 클라이언트가 요청한 jsp 페이지가 실행될 때 필요한 정보를 지정하는 역할을 한다. 
	- 필요한 정보를 jsp 컨테이너에 열려서 처리하는 방법을 지정하는 지시자!
	- page, include, taglib
	
	<%--
	
	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	<%@ page 밑에 있는 기본 설정 값 
	
	language="java" -> jsp 페이지의 스크립트 요소에서 사용할 언어를 지정하는 속성
	contentType="text/html; charset=UTF-8" -> jsp 페이지가 생성할 문서의 타입과 인코딩을 지정하는 속성
	pageEncoding="UTF-8"%> -> 해당 페이지의 인코딩을 지정하는 속성 
	import -> 다른 패키지에 있는 클래스의 내용을 포함 
		
	--%>
	
	3. out 내장 객체
	-jsp페이지가 생성한 결과를 웹 브라우저에 전송해주는 출력 스트림
	-jsp 웹 브라웆로 전송하는 모든 정보가 out 객체 통해서 전송됨 
	
	out.println() 
	
	println() : 주어진 str 값을 웹에 출력 줄바꿈 적용되지 않는다. 
	clearBuffer() : 현재 출력 버퍼에 저장되어 있는 내용을 웹 브라우저에 전송하지 않고 비움 
	flush() : 현재 출력 버퍼에 저장되어 있는 내용을 웹 브라우저에 전송하고 비움
	close() : 현재 출력 버퍼에 저장되어 있는 내용을 웹 브라우저에 전송하고 출력 스트림들 닫음
 -->
  
 


</body>
</html>