     
     
     //회원가입 유효성 체크 

     $(document).ready(function() {
        // 유효성 검사 함수 정의
        function validateForm() {
          let allInputsValid = true;
          $('input').each(function() {
            if ($(this).val() === '') {
              allInputsValid = false;
              return false;
            }
          });
      
          if (!allInputsValid) {
            alert('모든 데이터를 입력하세요');
            return false;
          }
      
          let id = $('#id').val();
          if (id.length < 8 || id.length > 20) {
            alert("8~20 사이 입력")
            return false;
          }
      
          let email = $('#email').val();
          if (!email.includes('@')) {
            alert('이메일을 잘 입력하세요');
            return false;
          }
      
          let phone = $('#phone').val();
          if (!phone.startsWith('010-')) {
            alert('010-xxxx-xxxx로 입력하세요');
            return false;
          }
      
          return true;
        }
      
        // Join 버튼 클릭 시 유효성 검사 수행
        $('#submit-button').click(function() {
          if (!validateForm()) {
            return false;
          }else{
            //alert("회원가입이 완료되었습니다.")
          }
        });
     
      });
 
      



/*
      회원가입 시
1. 회원가입 만든거에 로컬 스토리지에 저장
2. 입력창에서 내용 가지고 와서 로컬 스토리지에 객체 형식 저장
3. 로그인창 1개 새로 만들기 

*/

const form = document.getElementById("joinmembership");

form.addEventListener("submit", function(event) {
  event.preventDefault(); // 기본 동작 중단

  // 아이디와 비밀번호 입력값 가져오기
  const id = document.getElementById("id").value;
  const password = document.getElementById("password").value;

  // 로컬 스토리지에 저장
  localStorage.setItem("id", id);
  localStorage.setItem("password", password);

  // 회원가입 완료 메시지 출력
  alert("회원가입이 완료되었습니다!");
});


