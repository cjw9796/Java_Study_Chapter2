/**
 * 
 */
 
 // 게시글 리스트를 저장할 배열
let postList = [];

// 등록 버튼 클릭 시 실행되는 함수
function submitPost() {
  // 입력값 가져오기
  const title = document.getElementsByName("title")[0].value;
  const name = document.getElementsByName("name")[0].value;
  const pass = document.getElementsByName("pass")[0].value;
  const content = document.getElementsByName("content")[0].value;

  // 현재 시간을 작성일로 저장
  const date = new Date();
  const timestamp = date.getTime();

  // 새로운 게시글 객체 생성
  const post = {
    id: postList.length + 1,
    title: title,
    name: name,
    pass: pass,
    content: content,
    date: timestamp,
    views: 0
  };

  // 게시글 리스트에 추가
  postList.push(post);

  // 게시글 리스트 업데이트
  updatePostList();

  // 입력값 초기화
  document.getElementsByName("title")[0].value = "";
  document.getElementsByName("name")[0].value = "";
  document.getElementsByName("pass")[0].value = "";
  document.getElementsByName("content")[0].value = "";
}

// 게시글 리스트 업데이트 함수
function updatePostList() {
  const addtr = document.getElementById("addtr");
  addtr.innerHTML = "";

  postList.forEach(post => {
    const tr = document.createElement("tr");
    tr.innerHTML = `
      <td>${post.id}</td>
      <td>${post.title}</td>
      <td>${post.name}</td>
      <td>${new Date(post.date).toLocaleDateString()}</td>
      <td>${post.views}</td>
    `;
    addtr.appendChild(tr);
  });
}

// 초기화 버튼 클릭 시 실행되는 함수
function resetForm() {
  // 게시글 리스트 초기화
  postList = [];
  updatePostList();

  // 입력값 초기화
  document.getElementsByName("title")[0].value = "";
  document.getElementsByName("name")[0].value = "";
  document.getElementsByName("pass")[0].value = "";
  document.getElementsByName("content")[0].value = "";
}

// 취소 버튼 클릭 시 실행되는 함수
function cancelPost() {
  // 가장 최근에 작성한 게시글 삭제
  postList.pop();
  updatePostList();
}

// 등록 버튼 클릭 이벤트 등록
const submitBtn = document.querySelector("input[type='submit']");
submitBtn.addEventListener("click", e => {
  e.preventDefault();
  submitPost();
});

// 초기화 버튼 클릭 이벤트 등록
const resetBtn = document.querySelector("input[type='reset']");
resetBtn.addEventListener("click", e => {
  e.preventDefault();
  resetForm();
});

// 취소 버튼 클릭 이벤트 등록
const cancelBtn = document.querySelector("input[type='button']");
cancelBtn.addEventListener("click", e => {
  e.preventDefault();
  cancelPost();
});
