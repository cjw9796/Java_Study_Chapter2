<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String cart_id = request.getParameter("cart_id");
String buy_count = request.getParameter("buy_count");
String book_kind = request.getParameter("book_kind");

if (session.getAttribute("id") == null) {
	response.sendRedirect("00_shopMain.jsp");
} else {
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>21_updateCartForm.jsp 장바구니 수정</title>
</head>
<body>

	<!-- 
	1. 수정하기(수량) 
	21번 파일로 넘어와서 간단하게 입력 받아서 수량 수정 
	-->
	

		<form method="post" action="22_updateCartPro.jsp">
			변경할 수량 : 
			<input type="text" name="buy_count" size="5" value="<%= buy_count %>">
			<input type="hidden" name="cart_id" value="<%= cart_id %>">
			<input type="hidden" name="book_kind" value="<%= book_kind %>">
			<input type="submit" value="변경하기">
		</form>

</body>
</html>
<%}%>