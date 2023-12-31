<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캘린더(한달 달력 출력)</title>
</head>
<body>

	<%
	Calendar start = Calendar.getInstance();
	Calendar end = Calendar.getInstance();
	
	//내가 월하는 날짜를 변경하기 위해서는 set() 사용 
	//set() : 캘린더 인스턴스에서 저장된 시간, 날짜를 수정, 변경하는 메서드
	int year = 2023;
	int month = 6;
	
	// 6월 1일 
	start.set(year,month -1,1);
	
	// 7월 1일
	end.set(year,month,1);

	// add() 함수를 이용해서 30,31일 마지막 일을 구한다.
	// 6월 30일 다른 필드에 영향준다. 
	
	
	// roll() 다른 필드에 영향을 안 준다. 
	// 7월 30일 
	end.add(Calendar.DATE, -1);
    
	//지정된 요일 불러오기
	int dayweek = start.get(Calendar.DAY_OF_WEEK);
	
	//일요일부터 토요일까지 
	System.out.println();
	System.out.println("=========="+ month + "월==========");
	System.out.println("su mo tu we th fr sa");
	// System.out.printf("%5d", "일월화수목금토");
	
	//1일이 일요일이면 앞에 공백 없이 출력을 할 수 있지만
	//1일이 월,화,수요일 같은 경우에는 앞에 달력 공백이 생길 수 있다.
	for(int i = 1; i<dayweek; i++){
		System.out.print("   ");
	}
	
	// 실제 1일부터 30일 혹은 31일까지 출력 
	for(int i = 1, n =dayweek; i<= end.get(Calendar.DATE); i++, n++){
		
		// n요일을 상수값으로 가지고와서 목요일 금요일 출력 
		// i 날짜
		//이스케이스 시퀀스 문자(특수문자) 문자열 안에서 포맷을 지정해서 정렬을 할 수 있다. 
		
		System.out.printf("%3d",i);
		
		if(n % 7 == 0){
			System.out.println();
			
			
		}
	}
	%>
	

</body>
</html>