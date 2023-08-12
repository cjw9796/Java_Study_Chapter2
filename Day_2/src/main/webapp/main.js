 
 /*
 // URL에서 사용자 정보 추출
 const urlParams = new URLSearchParams(window.location.search);
 const userId = urlParams.get('loggedInUser');

 // 사용자 정보를 이용하여 환영 메시지 출력
 const welcomeMessageElement = document.getElementById('welcome-message');
 welcomeMessageElement.innerText = `${userId}님 로그인 환영합니다.`;   
 */
 
 const urlParams = new URLSearchParams(window.location.search);
    const loggedInUser = urlParams.get('user');

    const welcomeMessageEl = document.getElementById('welcome-message');
    if (loggedInUser) {
      welcomeMessageEl.innerText = `${loggedInUser}님 로그인 환영합니다.`;
    } else {
      welcomeMessageEl.innerText = '로그인이 필요합니다.';
    }

