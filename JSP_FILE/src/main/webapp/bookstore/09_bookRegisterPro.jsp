<%@page import="bookstore.BookDAO"%>
<%@page import="bookstore.BookDTO"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");
%>

<%
// 웹 서버 공간에 이미지를 업로드 해서 사용하는 내용! 
String realFolder = ""; //웹 어플리케이션 상의 절대 경로 
String filename = "";
MultipartRequest multi = null;

// 파일이 업로드 되는 폴더 지정 
String saveFolder = "bookstore/imageFileSave";
String encType = "utf-8";
int maxSize = 5 * 1024 * 1024;

// 실제 웹 서버에 저장되는 내부 폴더경로를 가져오기 
ServletContext context = getServletContext();
realFolder = context.getRealPath(saveFolder);
System.out.println("realFolder = " + realFolder);

try {

	// 전송을 담당할 컴포넌트를 생성하고 파일을 전송 
	// 전송할 파일명 = 가지고 있는 객체, 서버상의 절대경로, 업로드될 파일크기,인코딩 타입,기본보안적용
	multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());

	// 전송한 파일을 정보를 가져와 출력 
	Enumeration files = multi.getFileNames();

	// 정보가 있다면 
	while (files.hasMoreElements()) {
		String key = (String) files.nextElement();

		// 서버에 저장된 파일 이름 
		filename = multi.getFilesystemName(key);

	}
} catch (Exception e) {
	System.out.println("상품추가시 에러 !발생!");
}
%>

<%
String book_kind = multi.getParameter("book_kind");
String book_title = multi.getParameter("book_title");
String book_price = multi.getParameter("book_price");
String book_count = multi.getParameter("book_count");
String author = multi.getParameter("author");
String publishing_com = multi.getParameter("publishing_com");
String book_content = multi.getParameter("book_content");
String discount_rate = multi.getParameter("discount_rate");

String year = multi.getParameter("publishing_year");
// 폼태그에서 넘어오는 데이터를 BookDTO 객체에 저장 
// 데이터 꺼내오는 것은 밑에 소스 보기 
String month = "";
if (multi.getParameter("publishing_month").length() == 1) {
	month = month + "0" + multi.getParameter("publishing_month");
} else {
	month = multi.getParameter("publishing_month");
}

String day = "";
if (multi.getParameter("publishing_day").length() == 1) {
	day = day + "0" + multi.getParameter("publishing_day");
} else {
	day = multi.getParameter("publishing_day");
}

BookDTO dto = new BookDTO();
dto.setBook_kind(book_kind);
dto.setBook_title(book_title);
dto.setBook_price(Integer.parseInt(book_price));
dto.setBook_count(Integer.parseInt(book_count));
dto.setAuthor(author);
dto.setPublishing_com(publishing_com);
dto.setPublishing_date(year + "-" + month + "-" + day);

if (filename != null) {
	dto.setBook_image(filename);
} else {
	dto.setBook_image("nothing.jpg");
}

dto.setBook_content(book_content);
dto.setDiscount_rate(Integer.parseInt(discount_rate));

BookDAO dao = BookDAO.getInstance();
dao.insertBook(dto);

response.sendRedirect("10_bookList.jsp?book_kind=" + book_kind);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>09_bookRegisterPro.jsp 관리자 상품 등록 처리</title>
</head>
<body>
</body>
</html>