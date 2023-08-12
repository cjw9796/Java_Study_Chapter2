<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>requestTest.jsp</title>
</head>
<body>
	requestTest.jsp 파일의 pageContext 영역 변수(println() 메소드): 
	<%out.println(pageContext.getAttribute("pageContextVar") + "<br/>"); %>
	requestTest.jsp 파일의 pageContext 영역 변수(jsp 표현식): <%=pageContext.getAttribute("pageContextVar")%><br/>
	requestTest.jsp 파일의 pageContext 영역 변수(EL): ${pageContextScope.pageContextVar}<br/>
	requestTest.jsp 파일의 pageContext 영역 변수(EL): ${pageContextVar}<br/>

<!-- 영역 변수에 저장 된 데이터를 얻어 올 때 객체 이름을 사용하지 않고 영역변수  이름만 사용하면 
	EL은 pageContext = request - session - all
	
	-->

</body>
</html>