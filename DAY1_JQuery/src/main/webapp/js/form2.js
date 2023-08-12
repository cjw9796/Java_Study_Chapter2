/**
 * 
 */
 
 $(() =>{
	//전체선택
	$('input:checkbox[name=all]').click(()=>{
		
		//prop('속성이름'): 인수로 지정된 속성의 프로퍼티를 얻어온다.
		let checked = $('input:checkbox[name=all]').prop('checked');
		
		//prop('속성이름',프로퍼티) : 인수로 지정된 속성의 프로퍼티를 변경한다.
		//만약 여러개의 데이터가 있으면 자동으로 반복해서 데이터 저장!  
		$('input:checkbox[name=chk]').prop('checked',checked);
		
		
	});
	
	
	
	$('input:checkbox[name=all]').click(()=>{
		
		let checkedwrite = $('input:checkbox[name=all]').prop('checked');
		
		$('#result').eq(0).val(checkedwrite);
		
	});



//과일 선택 시 선택한 과일 가격에 가격 출력 
$(document).ready(function() {
    // 전체선택 체크박스 클릭
    $('input[name="all"]').click(function() {
        // 전체선택 체크박스가 체크된 경우
        if($(this).prop('checked')) {
            // 모든 체크박스 체크
            $('input[name="chk"]').prop('checked', true);
        }
        // 전체선택 체크박스가 해제된 경우
        else {
            // 모든 체크박스 해제
            $('input[name="chk"]').prop('checked', false);
        }
        // 가격 합산
        calculatePrice();
    });
    
    // 일반 체크박스 클릭
    $('input[name="chk"]').click(function() {
        // 가격 합산
        calculatePrice();
        
        // 전체선택 체크박스 체크 여부 변경
        if($('input[name="chk"]:checked').length == $('input[name="chk"]').length) {
            $('input[name="all"]').prop('checked', true);
        }
        else {
            $('input[name="all"]').prop('checked', false);
        }
    });
    
    // 가격 합산 함수
    function calculatePrice() {
        var price = 0;
        $('input[name="chk"]:checked').each(function() {
            price += parseInt($(this).val());
        });
        $('#result').text(price);
    }
});












});