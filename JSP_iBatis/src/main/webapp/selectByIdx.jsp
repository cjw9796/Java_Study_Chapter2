<%@page import="com.kh.vo.GuestbookVO"%>
<%@page import="com.kh.service.SelectService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 파일명: selectByIdx.jsp</title>
</head>
<body>
	<!--  수정 또는 삭제할 글 1건 얻어와서 request 영역에 저장한 후 수정 또는 삭제할
	글을 브라우저에 표시하는 페이지 (delete.jsp , update.jsp)로 넘겨준다. -->
	
	<%
		// listView.jsp에서 수정 또는 삭제 버튼을 클릭했을 때 넘어오는 데이터를 받는다.
		request.setCharacterEncoding("utf-8");
		int idx = Integer.parseInt(request.getParameter("idx"));
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		String job = request.getParameter("job");

		// 수정 또는 삭제 할 글 1건을 얻어온다.
		GuestbookVO vo = SelectService.getInatance().selectByIdx(idx);
		
		
		// 만약에 vo객체가 없다 null일 경우 
		if(vo == null){
			// 수정 또는 삭제할 글이 테이블에 존재하지 않으니 에러메시지를 출력하고 
			// list.jsp
			out.println("<script>");
			//out.println("alert('테이블에 글이 존재하지 않습니다.')");
			out.println("alert('"+ idx +" 번 테이블에 글이 존재하지 않습니다.')");
			out.println("location.href='list.jsp'");
			out.println("</script>");		
			
			
		}else{
			// 수정 또는 삭제할 글이 존재하면 수정 버튼이 클릭된 경우 수정글을 보여주는
			// 브라우저 페이지로 이동 (삭제할 꺼면 삭제할 페이지로 넘기기)
			// request영역에 얻어온 글, 돌아갈 페이지번호, 줄바꿈에 사용할 데이터를
			// 저장해서 넘겨준다. 
			
			request.setAttribute("vo", vo);
			request.setAttribute("currentPage", currentPage);
		 	request.setAttribute("enter","\r\n");
		  	pageContext.forward(job + ".jsp");
		}
		
	
	%>
	
	
</body>
</html>