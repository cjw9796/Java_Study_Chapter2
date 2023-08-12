$(() => {
	
//	$('p').eq(0).css('color', 'blue');
//	$('p:eq(0)').css('color', 'red');
//	$('span').css('color', 'green');

//	0번째 <p> 태그를 선택한 후 <span> 태그를 선택한다.
//	$('p:eq(0)').add('span').css('color', 'hotpink');

	//add('선택자'): 선택된 요소에 추가적으로 selector 표현식을 작성한다.
	$('p').eq(0).add('span:eq(1)').add('p:eq(1)').css('color', 'yellowgreen');

	$('div').children().css('color', 'dodgerblue');
	$('div').children().click(function () {
		
		if ($(this).is('span')) {	//is('선택자'): 선택된 요소 중에 원하는 요소가 있나 확인한다.
			$(this).css('color', 'red');
		}
		if ($(this).is('b')) {
			$(this).css('fontSize', '30px');
		}
		if ($(this).is('p')) {
			$(this).css('color', 'lime');
		}
		
	});

});






















