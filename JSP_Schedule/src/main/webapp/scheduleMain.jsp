<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일명: scheduleMain.jsp</title>
</head>
<body>
<form action="schedulePro.jsp" method="post">
<table width="700" border="1" align="center" cellpadding="5" cellspacing="1">
    <thead>
        <th>일정 추가</th>
    </thead>

    <tbody>

        <tr>
            <td>시간, 이벤트명</td>
        </tr>
        <tr>

            <td>내용<textarea cols="100" rows="20" name="scheduletextarea"></textarea></td>
        </tr>

        <tr>
            <td colspan="2">
                기간설정창1(~부터)
                <input type="date" value="시작시간">
                <input type="time">
                (~까지)
                <input type="date" value="종료시간">
                <input type="time">

            </td>

        </tr>

        <tr>
            <td align="center">버튼구역
                <input type="submit" value="저장" onclick="location.href = 'schedulePro.jsp'">
                <input type="button" value="취소">
                <input type="button" value="삭제">
            </td>
        </tr>

    </tbody>


</table>
</form>



</body>
</html>