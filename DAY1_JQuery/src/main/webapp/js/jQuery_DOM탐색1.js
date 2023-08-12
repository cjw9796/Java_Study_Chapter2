$(() => {
	//first(): 첫 번째 요소 탐색
	$('div > p').first().click(() => $('div > b').first().toggle());

	//eq(index): index로 요소 탐색	
	$('div > p').eq(1).click(() => {
		// $('div > b:eq(1)').toggle();
		// $('div > b:eq(1)').css('color', 'red');
		// $('div > b:eq(2)').css('color', 'blue').html('기능 연결');
		// end(): 마지막에 실행한 메소드의 실행 전 상태로 선택된 요소 집합을 복원시킨다.
		$('div > b').eq(1).css('color', 'red').toggle().end().eq(2).css('color', 'blue').html('기능 연결');
	});
	
	//slice(start, end): index로 구간(start 부터 end - 1 까지) 요소 탐색
	$('div > p').eq(2).click(() => {
		$('div > b').slice(1, 3).css('color', 'hotpink').toggle();
	});
	
	//last(): 마지막 요소 탐색
	$('div > p').last().click(() => {
		$('div > b').last().css('color', 'dodgerblue').toggle();	
	});
	
});






















