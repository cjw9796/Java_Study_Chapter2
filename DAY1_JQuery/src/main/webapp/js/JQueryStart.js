/**
 * 파일명: jquery1.js
 	JQueryStart.html
 */
 /*$()함수
	-제이쿼리 객체를 반환해서 그 안에 있는 메서드들을 사용해서 구현을 할 수 있다.  */
 
function a1(){
	// span에 선택해서 속성을 변경 
	//document.querySelector('')
	/*
	// 자바스크립트로 작성된 코드  
	//	let span = document.getElementsByTagName('span');
	//	let span = document.querySelectorAll('span');
	//	console.log(span.length);
	//	for (let i=0; i<span.length; i++) {
	//		span[i].style.color = 'dodgerblue';
	//	}
		
		제이쿼리는 배열 형태도 반복문 없이 알아서 처리한다. 
	*/	
	
	//제이쿼리로 바꾸면
	$('span').css('color','pink');
	
} 

// a2 아이디 //<li id="t1">선택 
function a2(){ 
	
	$('#t1').css('color','red');
	
}
// a3 클래스 //<li class="t2"> 선택 
function a3(){ 
	$('.t2').css('color','blue');
}

// 자식 //<li><span> 선택  
function a4(){  
	$('li > span').css('color','lime');
}

// 자손 //<li><b><span> 선택 

function a5(){
	$('li span').css('color','purple');
}

// nth-child
//  같은 부모 요소를 가지는 형제 요소 중에서 특정 순서있는
//   요소 선택 

// nth-child 앞에서부터 숫자로 세고 
// nth-last-child 뒤에서부터 숫자 센다
// 1부터 시작!

// $('li').eq(0)   $('li:eq(0)') 같은 의미
//	n은 자동을 0부터 1씩 증가하는 정수이고 '+', '-', '*' 연산을 사용할 수 있다.
//	$('li:nth-child(n)').css('backgroundColor', 'dodgerblue'); // 모두 선택된다.
//	$('li:nth-child(n + 3)').css('backgroundColor', 'dodgerblue'); // 3번째 부터 모두 선택된다.
//	'' 연산도 가능한데 '' 연산자를 사용하면 안되고 숫자가 n 앞에 나와야 한다.
//	$('li:nth-child(2n)').css('backgroundColor', 'dodgerblue'); // 짝수 인덱스만 선택한다.
//	$('li:nth-child(2n + 1)').css('backgroundColor', 'dodgerblue'); // 홀수 인덱스만 선택한다.


function a6(){ //li의 1,3번째의 배경을 바꾸겠다. 
$('li:nth-child(1)').css('backgroundColor','red');
$('li:nth-child(3)').css('backgroundColor','yellowgreen');
	
}

function a7(){ // li의 첫번째 태그 배경 설정 
	
	$('li:first-child').css('backgroundColor', 'tomato');
}

function a8(){ //li의 마지막 태그 배경 설정 
	$('li:last-child').css('backgroundColor', 'yellow');
}


















