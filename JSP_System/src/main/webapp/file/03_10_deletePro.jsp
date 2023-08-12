<%@page import="_05_User.UserDTO"%>
<%@page import="_05_User.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴 처리 페이지 03_10_deletePro.jsp</title>
</head>
<body>
<!-- 
1. 한글깨짐방지
2. id,pw 가져오기 
3. boolean 체크를 이용해서 userlist에 2번에서 가져온 변수값을 이용해서 정보있는지 확인 후 
4. 정보가 있다 = deleteUserId(id); 로 삭제, 세션(log)도 삭제 alert() 탈퇴되었다.
	후 userMain 페이지 이동시키기 
	
5. 아이디 또는 비밀번호 확인 메시지를 출력하고
	바로 이전 페이지로 이동하는 메서드 
	history.go(-1);
	
	deleteUserId(id); 실행 시 리스트에서 삭제! 메모장에서도 삭제! 다시 저장하는 어떤 메서드를 호출해야된다.
		
 -->
 
<!-- 한글 깨짐 방지 -->
<% request.setCharacterEncoding("UTF-8"); %> 

<%		
		String id= request.getParameter("id");
		String passwd= request.getParameter("passwd");
		boolean check = UserDAO.getInstance().checkUserIdPw(id, passwd);
		System.out.println(check);
		if(check){
			UserDAO.getInstance().deleteUserId(id);
			session.removeAttribute("log");
			%>
			<script>
				alert("탈퇴되었습니다. ");			
				location.href="03_01_userMain.jsp";
			</script>
			<% 
		}else{
			%>
			<script>
				alert("아이디나 비밀번호를 확인하세요. ");
				// 바로 이전 페이지로 이동
				history.go(-1);
			</script>
			<% 
		}
	%>

</body>
</html>