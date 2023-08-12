<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		request.setCharacterEncoding("utf-8");
		//DATE d = new date();
	%>

	<!-- 
		userBean 액션 태그로 new  를 사용하지 않고 객체 만들기
		id 속성에는 만들려는 객체의 이름을 쓴다.
		class 속성에는 객체를 만들려 하는 클래스의 이름을 반드시 풀 패키지 이름과 같이 써야한다.
		액션태그는 xml 문법을 따르기 때문에 <tag> </tag> 사이에 아무런 내용이 코딩되지 않으면
		</tag> 생략 할 수 있는데 그냥 지우면 에러가 발생하니 <tag /> 만들면 된다.
	
	 -->
	<!-- MemberVO vo = new MemberVO() 같은 것! -->
	<jsp:useBean id="vo" class = "members.MemberVO">
	
	<!-- setProperty 액션태그는 지정한 필드의 setter 메서드를 호출한다.
		Property 속성에는 setter 메서드를 실행할 필드 이름을 쓴다.
		name 속성에는 setter 메서드를 실행할 필드가 정의된 객체 이름을 쓴다.
	 
	 	form 에서 전송되는 reuqest 객체에서 꺼내는 작업을 하지 않아도 자동으로 처리해준다.
	 
	 
	
	 <jsp:setProperty property ="id" name ="vo" />
	 <jsp:setProperty property ="name" name ="vo" />
	 <jsp:setProperty property ="password" name ="vo" />
	 <jsp:setProperty property ="age" name ="vo" /> 
	 <jsp:setProperty property ="gender" name ="vo" />
	 <jsp:setProperty property ="ip" name ="vo" />
	
		모든 필드의 setter 메서드가 실행된다.
		단! form 에서 넘어온 name 속성하고 필드의 이름이 같은 것만 setter 메서드가 실행된다.	
	
	
	 -->
	
	
	<jsp:setProperty property ="*" name="vo" />
	
	
	
	</jsp:useBean>

	${vo}


</body>
</html>