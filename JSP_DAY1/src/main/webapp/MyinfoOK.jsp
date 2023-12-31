<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>form에서 넘어온 데이터를 jsp로 처리하는 내용!</title>
</head>
<body>

	<%
	// form에서 입력된 한글 데이터가 post 방식으로 전송될 때 깨지는 현상을 방지한다.
	// submit 클릭을 하면 request 객체에 form 가지고 있는 정보가 모두 담겨 객체로 반환된다.
	// getParameter()메서드가 실행 되기 전(맨 처음에) 인코딩 내용을 작성한다. 
	
	request.setCharacterEncoding("UTF-8");
	
	//getParameter()메서드의 모든 정보는 문자열 형태로 넘어온다. 
	
	String name = request.getParameter("name");
	out.println(name + "님 안녕하세요 <br>");
	
	String id = request.getParameter("id");
	out.println(name + "님" + id + "입니다. <br>");
	
	String password = request.getParameter("password");
	out.println(name + "님 비밀번호:" + password + "입니다. <br>");
	
	try{
		
	int age = Integer.parseInt(request.getParameter("age"));
	out.println(name + "님 올해 나이:" + age + "이다.<br>");
	out.println(name + "님 내년 나이:" + (age+1) + "이다.<br>");
	
	}catch(NumberFormatException e){
		out.println("잘못 된 나이가 입력되었습니다.");
		out.println("<script>");
		out.println("alert('잘못된 나이가 입력되었습니다.')");
		out.println("</script>");
		
	}
	
	// 현재 나이에 올해는 20세이고 내년은 21살입니다. 
	
	
	
	%>


</body>
</html>