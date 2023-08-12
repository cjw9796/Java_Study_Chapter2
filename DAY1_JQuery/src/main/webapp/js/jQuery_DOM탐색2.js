$(() => {
	
	//find('선택자'): 선택된 요소 중에서 선택자로 지정한 요소를 찾는다.
//	$('div b').css({'fontSize': '30px', 'color': 'purple'});
	$('div').find('b').css({'font-size': '30px', 'color': 'tomato'});
	
	//children('선택자'): 선택된 요소의 자식 요소 중에서 선택자로 지정한 자식 요소를 찾는다.
//	$('#chd').text('손오공');
	$('div').children('#chd').html('<i>사오정</i>');
	
	$('span').css('fontSize', '20px').css('background', 'yellowgreen');
	$('span').parent().css('background', 'skyblue'); //parent(): 선택된 요소의 부모 요소를 찾는다.
	$('span').parents('div').css('background', 'dodgerblue'); //parents('선택자'): 선택된 요소의 부모 요소 중에서 선택자로 지정한 조상 요소를 찾는다.
	
	//next(): 선택된 요소의 바로 다음 형제 요소를 찾는다.
	$('p').eq(2).next().css('background', 'lime');
	//prev(): 선택된 요소의 바로 이전 형제 요소를 찾는다.
	$('p').eq(2).prev().css('background', 'hotpink');
	
});






















