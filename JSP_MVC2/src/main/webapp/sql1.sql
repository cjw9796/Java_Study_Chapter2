CREATE DATABASE joinmvcdb04;

USE joinmvcdb04;

CREATE TABLE member(
    id VARCHAR(20),
    pw VARCHAR(20),
    name VARCHAR(20),
    tel VARCHAR(20),
    email VARCHAR(30),
    field VARCHAR(20),       -- 지원분야
    skill VARCHAR(20),       -- 기술능력
    major VARCHAR(20)        -- 전공분야
);

SELECT * FROM member;


-- 강제로 값 입력 후 로그인 할 때
-- INSERT INTO MEMBER VALUES('qwer', '1111', '홍길동', '01000001111', 'asdf@gmail.com', 'back', 'jsp', '컴공');


