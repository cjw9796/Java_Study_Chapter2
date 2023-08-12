<%@page import="com.green.board.BoardDAO"%>
<%@page import="com.green.board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>_05boardInfo.jsp</title>
</head>
<body>

<%
		int num = Integer.parseInt(request.getParameter("num"));
		BoardDTO board = BoardDAO.getInstance().getBoardOfInfo(num);
	%>
	<div align="center">
		<h2>게시글 내용</h2>
		<form method="post" action="_06boardUpdate.jsp">
			<table border="1">
				<tr>
					<td>번호</td>
					<td><%= board.getNum() %></td>
					<td>조회수</td>
					<td><%= board.getReadCount() %></td>
				</tr>
				<tr>
					<td>작성자</td>
					<td><%= board.getWriter() %></td>
					<td>이메일</td>
					<td><%= board.getEmail() %></td>
				</tr>
				<tr>
					<td>제목</td>
					<td><%= board.getSubject() %></td>
					<td>작성일</td>
					<td><%= board.getRegDate() %></td>
				</tr>
				<tr>
					<td>내용</td>
					<td colspan="3">
						<textarea rows="10" cols="20" readonly><%= board.getContent() %></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="4">
						
						<input type="hidden" name="num" value="<%= board.getNum() %>">
						<input type="submit" value="수정하기">
						<input type="button" value="삭제하기" onclick="window.location.href='_08boardDelete.jsp?num=<%= board.getNum() %>'">
						<input type="button" value="댓글 등록하기" onclick="window.location.href='_13boardReplyWrite.jsp?num=<%= board.getNum() %>'">
						<input type="button" value="목록으로" onclick="window.location.href='_04boardList.jsp'">
					</td>
				</tr>
			</table>
		</form>
	</div>





<!-- 
<form action="?" method="post" onsubmit="?">
<table width="500" border="1" align="center" cellpadding="5" cellspacing="0">

			
			

			<tr>
				<th colspan="4">게시글 내용</th>
			</tr>

			<tr>
				<th width="150">번호</th>
				<td width="300">2</td>
				<th width="150">조회수</th>
				<td width="300">3</td>	
			</tr>
			
			<tr>
				<th width="150">작성자</th>
				<td width="300">홍길동</td>
				<th width="150">이메일</th>
				<td width="300">1234@gmail.com</td>
			</tr>
			
			<tr>
				<th width="150">제목</th>
				<td width="300">안녕</td>
				<th width="150">작성일</th>
				<td width="300">2023-06-19</td>
			</tr>
			
			<tr>
				<th width="150" >내용</th>
				<td width="350" colspan="3"><textarea name="" cols="50" rows="10"></textarea></td>
			</tr>
			
			<tr>
				<td colspan="4" align="center">
				<input type="submit"value="수정하기"> 
				<input type="reset" value="다시작성하기"> 
				<input type="button" value="목록으로" onclick="location.href='_04boardList.jsp'"></td>
			</tr>

		</table>


</form>

 -->

</body>
</html>