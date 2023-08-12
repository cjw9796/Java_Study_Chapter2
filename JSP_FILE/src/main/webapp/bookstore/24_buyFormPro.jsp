<%@page import="bookstore.CustomerDTO"%>
<%@page import="bookstore.CartDTO"%>
<%@page import="java.util.List"%>
<%@page import="bookstore.BuyDAO"%>
<%@page import="bookstore.CustomerDAO"%>
<%@page import="bookstore.CartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>    

    
<%
String account = request.getParameter("account");
String deliveryName = request.getParameter("deliveryName");
String deliveryTel = request.getParameter("deliveryTel");
String deliveryAddress = request.getParameter("deliveryAddress");

String buyer = (String)session.getAttribute("id");

List<String> accountLists = null;
CustomerDTO member = null;

CartDAO cartDAO = CartDAO.getInstance();
List<CartDTO> cartLists = cartDAO.getCart(buyer);

CustomerDAO memberDAO = CustomerDAO.getInstance();
member = memberDAO.getMember(buyer); 





// 결제를 도와주는 insertBuy() 메서드를 이용해서 구매 목록을 채워준다.
BuyDAO buyDAO = BuyDAO.getInstance();
buyDAO.insertBuy(cartLists,buyer,account,deliveryName
								,deliveryTel,deliveryAddress);

accountLists = buyDAO.getAccount(); 
// 데이터베이스에 저장하면 25파일로 넘어간다.
response.sendRedirect("25_buyList.jsp");
%>

    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>24_buyFormPro.jsp</title>
</head>
<body>
<!-- 구매한 데이터를 buyDAO 이용해서 저장 -->

<h2>24_buyFormPro.jsp 도서 구매하기 </h2>

<form method="post" action="25_buyList.jsp">
			<table border="1">
				<tr>
					<th colspan="2">주문자정보</th>
				</tr>
				<tr>
					<th width="200">성명</th>
					<td width="400"><%= member.getName() %></td>
				</tr>
				<tr>
					<th width="200">전화번호</th>
					<td width="400"><%= member.getTel() %></td>
				</tr>
				<tr>
					<th width="200">주소</th>
					<td width="400"><%= member.getAddress() %></td>
				</tr>
				<tr>
					<th width="200">결제계좌</th>
					<td width="400">
						<select name="account">
							<%
							for(int i=0; i<accountLists.size(); i++){
								String accountList = accountLists.get(i);
							%>
							<option value="<%= accountList %>"><%= accountList %></option>
							<%} %>
						</select>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="확인">
						<input type="button" value="취소" onclick="window.location.href='00_shopMain.jsp'">
					</td>
				</tr>
			</table>
			<br>
</form>			



</body>
</html>