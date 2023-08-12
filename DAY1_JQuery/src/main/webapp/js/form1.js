/**
 * form1.js
 
 
 //이벤트 연결할 객체 
 
 function(){}; 
 
 //웹브라우저를 실행 할 때 문서가 준비 되어있다면 팝업을 띄우겠다. 
1. $(document).ready(function(){
	alert("싫다! 날이 너무 좋다!");
});

2. $().ready(function(){
	alert("싫다! 날이 너무 좋다!");
});

3. $().ready(()=>{
	alert("싫다! 날이 너무 좋다!");
});
 
4. $(function(){
	alert("싫다! 날이 너무 좋다!");
});

5. $(() =>{
	alert("싫다! 날이 너무 좋다!");
});

 */

 $(()=>{
	//onclick , onchange 와 같이 이벤트가 'on'으로 시작 
	$('select').eq(0).change(()=>{
	//select 태그의 change 이벤트 실행됨
	//option: selected는 option에서 선택된 태그를 가지고 온다. 
	let select = $('select:eq(0) > option:selected').eq(0).val();
	console.log(select);
	
	$('input:text').eq(0).val(select); 	//첫번째 text에 select한 값을 저장
	});
	
	
	$('input[name=gender]').click(()=>{
		let check = $('input[name=gender]:checked').val();
		console.log(check);
		
		$('input:text').eq(1).val(check); //두번째 text에 check한 값을 저장
	});
	
});