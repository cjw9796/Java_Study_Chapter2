<%@page import="com.rentcar.RentcarDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>15_carReserveDel.jsp 예약 목록 삭제</title>
</head>
<body>
	<%
	String id = request.getParameter("id");
	String rday = request.getParameter("rday");

	// 예약삭제 메소드 호출
	RentcarDAO.instance.carRemoveReserve(id, rday);
	response.sendRedirect("01_main.jsp");
	%>

</body>
</html>