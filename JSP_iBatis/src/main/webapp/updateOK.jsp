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
	request.setCharacterEncoding("UTF-8");
	// delete.jsp에서 넘어오는 데이터를 받는다. 
	
	int currentPage = Integer.parseInt(request.getParameter("currentPage"));

%>
		
	<jsp:useBean id="vo" class="com.kh.vo.GuestbookVO">
		<jsp:setProperty property ="*" name="vo">
	</jsp:useBean>

	<%
		// 삭제할 글의 비밀번호와 삭제하기 위해 입력한 비밀번호가 맞는지 비교
		// 삭제할 글을 얻어온다. 
		GuestbookVO original =SelectService.getInatance().selectByIdx(vo.getIdx());
		
		
		out.println("<script>");
		if(original.getPassword().trim().equals(vo.getPassword())){
			// 비밀번호 일치
			UpdateService.getInstance().update(vo);
			out.println("alert('수정 되었습니다!')");
			//out.println("alert('" + original.getIdx() +"번 글 수정완료')");
		}else{
			out.println("alert('비밀번호가 일치하지 않습니다!')");
		}
					
		out.println("location.href='list.jsp?currentPage="+ currentPage+"'");
		out.println("</script>");
	%>
</body>
</html>