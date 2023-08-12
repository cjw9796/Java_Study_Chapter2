<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>출첵게시판</title>
</head>
<body>
<!-- 입력 화면 시작 -->
	<form action="memoInsert.jsp" method="post">
		<table width="1000" align="center" border="1" cellpadding="5" cellspacing="0">
			<tr>
				<th colspan="3">아주 아주 많이 허접해보이는 출첵 게시판 Ver 0.01</th>
			</tr>
			<tr>
				<th width="100">이름</th>
				<th width="100">비밀번호</th>
				<th width="800">메모</th>
			</tr>
			<tr>
				<td align="center">
					<input type="text" name="name" style="width: 90%; height: 25px;"/>
				</td>
				<td align="center">
					<input type="password" name="password" style="width: 90%; height: 25px;"/>
				</td>
				<td align="center">
					<input type="text" name="memo" style="width: 92%; height: 25px;"/>
					<input type="submit" value="저장"/>
				</td>
			</tr>
		</table>
	</form>
	


</body>
</html>