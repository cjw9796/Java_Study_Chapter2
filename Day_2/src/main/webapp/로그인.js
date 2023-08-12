/*
로그인 시 
1. input 2개랑 버튼 하나 만들고
입력한 결과를 웹 스토리지에 있는 데이터랑 비교한다.
객체 받기 
2. 데이터가 맞으면 main 페이지로 이동 -> 버튼 밑에 "~님 로그인 환영합니다." 출력 
3. 실패 : 아이디 또는 패스워드를 확인하세요 

*/ 

const form = document.getElementById("joinmembership");
const submitButton = document.getElementById("submit-button");

submitButton.addEventListener("click", function(event) {
  event.preventDefault(); // 기본 동작 중단

  // 아이디와 비밀번호 입력값 가져오기
  const id = document.getElementById("id").value;
  const password = document.getElementById("password").value;

  // 로컬 스토리지에서 아이디와 비밀번호 가져오기
  const savedId = localStorage.getItem("id");
  const savedPassword = localStorage.getItem("password");

  // 아이디와 비밀번호 비교
  if (id === savedId && password === savedPassword) {
    // 로그인 성공
    localStorage.setItem("loggedInUser", id); // 로그인한 사용자 정보 저장
    location.href = `main.html?user=${id}`; // main.html로 이동하며 사용자 정보 전달
  } else {
    // 로그인 실패
    alert("아이디 또는 비밀번호를 확인하세요.");
  }
});