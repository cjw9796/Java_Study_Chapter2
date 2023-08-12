<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>_02boardWrite.jsp 새 게시글 작성하기</title>
</head>
<body>


	<div align="center">
		<h2>새글 작성하기</h2>
		<form method="post" action="_03boardWritePro.jsp">
			<table border="1">
				<tr>
					<td>작성자</td>
					<td><input type="text" name="writer"></td>
				</tr>
				<tr>
					<td>제목</td>
					<td><input type="text" name="subject"></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="email" name="email"></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="password"></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea rows="10" cols="20" name="content"></textarea></td>
				</tr>
				<tr>
					<td colspan="2">
					<input type="submit" value="등록하기"> 
					<input type="reset" value="다시 작성하기"> 
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
				<th colspan="2">새 글 작성하기</th>
			</tr>

			<tr>
				<th width="150">작성자</th>
				<td width="350"><input class="input" type="text" name="id"
					placeholder="작성자를 입력하세요" /></td>
			</tr>
			
			<tr>
				<th width="150">제목</th>
				<td width="350"><input class="input" type="text" name="name"
					placeholder="제목을 입력하세요" /></td>
			</tr>
			
			<tr>
				<th width="150">이메일</th>
				<td width="350"><input class="input" type="text" name="email"
					placeholder="이메일을 입력하세요" /></td>
			</tr>
			
			<tr>
				<th width="150">비밀번호</th>
				<td width="350"><input class="input" type="text" name="password"
					placeholder="비밀번호을 입력하세요" /></td>
			</tr>
			
			<tr>
				<th width="150">내용</th>
				<td width="350"><textarea name="" cols="30" rows="5"></textarea></td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
				<input type="submit"value="등록하기"> 
				<input type="reset" value="다시작성하기"> 
				<input type="button" value="목록으로" onclick="location.href='_04boardList.jsp'"></td>
			</tr>

		</table>


</form>
 -->



</body>
</html>