<%@page import="com.rentcar.RentcarDAO"%>
<%@page import="com.rentcar.Rentcar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>11_carOptionSelect.jsp 예약 옵션 선택</title>
</head>
<body>

	<%
		//옵션 선택 후 구매하기를 누르면 no, img 명이 넘어온다. 
 		int no = Integer.parseInt(request.getParameter("no"));
 		String img = request.getParameter("img");
 		
 		//렌트카 하나에 대한 정보를 얻어옴
 		Rentcar bean = RentcarDAO.instance.getOneCar(no);
 		
 		//수량
 		int qty = Integer.parseInt(request.getParameter("qty"));
 		
 	%>

	<div align = "center">
		<form action="01_main.jsp?center=12_carReserveResult.jsp" method="post">
		<table>
			<tr height="100">
				<td align="center" colspan="3">
				<font size="6" color="gray">옵션 선택 </font>
				</td>
			</tr>

			<tr>
				<td rowspan="7" width="500" align="center">
				<img alt="" src="imgcar/<%=bean.getImg()%>" width="450">
				</td>

				<!-- 대여기간 -->
				<td width="250" align="center">대여기간</td>
				<td width="250" align="center">
				<select name="dday">
						<option value="1">1일</option>
						<option value="2">2일</option>
						<option value="3">3일</option>
						<option value="4">4일</option>
						<option value="5">5일</option>
						<option value="6">6일</option>
						<option value="7">7일</option>				
				</select>
				</td>
			</tr>
			
			<tr> 
				<!-- 대여일 -->
				<td width="250" align="center">대여일</td>
				<td width="250" align="center"> 
				<input type="date" name="rday" id="today" size="15" >
				</td>				
			</tr>
			
			<tr>
				<!-- 보험적용 -->
				<td width="250" align="center">보험적용</td>
				<td width="250" align="center">
				<select name="usein">
						<option value="1">적용(1일 1만원)</option>
						<option value="2">비적용</option>
				</select> 
				</td>
			</tr>
			
			<tr>
				<!-- wifi적용 -->
				<td width="250" align="center">wifi적용</td>
				<td width="250" align="center">
				<select name="usewifi">
						<option value="1">적용(1일 1만원)</option>
						<option value="2">비적용</option>
				</select> 
				</td>
			</tr>
			
			<tr>
				<!-- 네비게이션 적용 -->
				<td width="250" align="center">네비게이션 적용</td>
				<td width="250" align="center">
				<select name="usenavi">
						<option value="1">적용(무료)</option>
						<option value="2">비적용</option>
				</select> 
				</td>
			</tr>
			
			<tr>
				<!-- 베이비시트 적용 -->
				<td width="250" align="center">베이비시트 적용</td>
				<td width="250" align="center">
				<select name="useseat">
						<option value="1">적용(1일 1만원)</option>
						<option value="2">비적용</option>
				</select> 
				</td>
			</tr>

				<tr>
					<td width="250" align="center" colspan="2">
					<input type="hidden" name="no" value="<%=no%>" /> 
					<input type="hidden" name="qty" value="<%=qty%>" /> 
					<input type="submit" value="차량예약하기" />
					</td>
				</tr>

			</table>
			</form>
	
	
	</div>


</body>
</html>