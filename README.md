# 웹 기반 쇼핑몰 구현 프로젝트 - 축하해요
Web-based Custom Celebration Card Making Shopping Mall

> **신한 금융SW 아카데미** <br> 2024.05 ~ 2024.06 <br> Spring / JavaScript / HTML, CSS 사용

### 사진을 클릭하시면 배포 페이지로 이동합니다 👏

[<img width="1512" alt="스크린샷 2024-06-26 오전 11 39 31" src="https://github.com/user-attachments/assets/d96ed9b9-0830-427a-9f1e-90e71cb13d02">](http://13.125.165.147:9090/)

## Team🐥

| 하소영 (Soyeong Ha)                                                                                              | 김민지(Minji Kim)                                                                                              | 서현오(Heonoh Seo)                                                                                              | 조예빈(Yebin Jo)                                                                                                | 최민서(Minseo Choi)                                                                                            |
|---------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------|
| ![soyeong](https://github.com/Jyebin/shinhan_team3_omok/assets/67955977/d4212bca-3100-4b21-bc24-3bb171350336) | ![minji](https://github.com/Jyebin/shinhan_team3_omok/assets/67955977/6a5d0a60-8ebb-4548-8071-2957265442ef) | ![hyeono](https://github.com/Jyebin/shinhan_team3_omok/assets/67955977/9efc21d8-3525-4ddf-8126-b2fcda73e8a5)  | ![yebin](https://github.com/Jyebin/shinhan_team3_omok/assets/67955977/47f41339-2451-4c5b-9461-e83772ad8ecc)| ![minseo](https://github.com/Jyebin/shinhan_team3_omok/assets/67955977/1135661a-ed49-4b5a-9962-16fb87eb53d4) |
| [@soyoungxxx](https://github.com/soyoungxxx/)                                                                                                    | [@wing-beat](https://github.com/wing-beat/)                                                                                                  | [@ohhyeonn](https://github.com/ohhyeonn/)                                                                                                    | [@Jyebin](https://github.com/Jyebin/)                                                                                                      | [@cmsxi](https://github.com/cmsxi/)    
| 팀장, 기획, 프론트엔드, 백엔드                                                                                            | 기획, 프론트엔드, 백엔드                                                                                              | 기획, 프론트엔드, 백엔드, 웹 퍼블리싱                                                                                       | 기획, 프론트엔드, 백엔드                                                                                               | 기획, 프론트엔드, 백엔드, 디자인                                                                                         |

## Project 목표
* 쇼핑몰 웹 페이지 구현
  - 쇼핑몰을 웹 버전으로 개발한다.
  - Spring, 바닐라 JavaScript를 이용하여 개발한다.
* 웹 CRUD 구현
  - 데이터베이스와 연동하여 사용자 정보와 판매 내역, 생성된 카드를 관리한다.
* 인터넷 결제 서비스 구현
  - 결제 및 결제 취소, 장바구니 기능을 필수로 구현한다.
* 편리한 카드 제작 시스템 제공
  - URL 공유 기능 및 모바일에 최적화 된 축하 카드를 구현한다.
* admin 페이지로 관리자 도구를 제공한다.
* 보안 및 개인정보 보호에 초점을 맞춰 개발한다.
* 시스템 전반에 걸쳐 예외 처리를 적용한다.
* Git 브랜치 전략을 활용하여 협업한다.
* 기능별로 프론트엔드와 백엔드를 모두 구현한다.
* Amazon RDS, EC2, S3를 활용하여 실제 배포를 통해 서비스를 제공한다.
* Github Action으로 CI/CD 구축
  - 배포 자동화를 통하여 서버 운용에 용이하도록 설정한다.

## 주요 기능 📦
1. **사용자 인증**: Javax.mail library를 활용하여 로그인 및 회원가입, 이메일 인증을 통한 사용자 인증 기능 및 탈퇴, 로그아웃 기능 구현
2. **인기카드**: 메인페이지에 슬라이더를 적용시켜 실시간으로 인기카드 반영
3. **최신카드**: 가장 최근에 생성된 카드를 카테고리별로 1개씩 메인 페이지에 반영
4. **카드 생성**: 카드 템플릿 선택 후 이름/날짜/사진/문구/이모티콘 등 여러 항목을 유저가 원하는대로 커스텀해 카드 생성 가능. JS Confetti 라이브러리를 통한 공감 버튼 구현
5. **장바구니**: 여러 카드를 생성해 장바구니에 담은 후 한 번에 결제할 수 있는 기능
6. **명예의 전당**: 사용자가 공개로 설정해둔 카드를 여러 기준으로(최신순/인기순 등) 정렬해 조회할 수 있는 기능
7. **커뮤니티**: 게시판에 글과 댓글을 작성할 수 있는 기능
8. **고객센터**: FAQ와 1:1 문의 기능
9. **관리자 페이지**: 관리자가 대시보드/주문목록/회원목록/1:1문의를 확인할 수 있는 페이지 구현
10. **결제** : iamport의 토스페이먼츠 결제 api를 활용한 카드 및 각종 페이 결제 기능
11. **보안성** : URL Manipulation 예방, XSS 공격 예방, SQL Injection 예방, 모든 페이지에 Error Page 적용

<br>

## 화면 구성 📺
| 메인 페이지 |
|---------------------------------------------------------------------------------------------------------------------------------------------|
| <img width="962" alt="메인페이지" src="https://github.com/user-attachments/assets/d21cc39b-2b70-4044-ba8e-b28157e05268"> |



| 카드 제작 페이지 |
|---------------------------------------------------------------------------------------------------------------------------------------------|
| <img width="962" alt="카드제작페이지" src="https://github.com/user-attachments/assets/6dc76e8c-a304-4612-bbc6-b5659154bea0"> |



| 완성 카드 페이지 1 | 완성 카드 페이지 2 |
|----------------------------------------------------------- | -------------------------------------------------------------------------------|
| <img width="481" alt="완성카드1" src="https://github.com/user-attachments/assets/4e4ad39e-fa7e-4df6-8bde-a29409f117a0"> | <img width="481" alt="완성카드2" src="https://github.com/user-attachments/assets/129d5fe3-27ca-43b9-98af-af43b197b410"> |



| 명예의 전당 |
|---------------------------------------------------------------------------------------------------------------------------------------------|
| <img width="962" alt="명예의전당" src="https://github.com/user-attachments/assets/dddd0e46-ab0f-41ab-8c99-9270080e6ed1"> |



| 커뮤니티 |
|---------------------------------------------------------------------------------------------------------------------------------------------|
| <img width="962" alt="커뮤니티" src="https://github.com/user-attachments/assets/3239b13f-a3e3-4760-96af-cc8f75154118"> |


| 관리자 페이지 |
|---------------------------------------------------------------------------------------------------------------------------------------------|
| <img width="962" alt="관리자" src="https://github.com/user-attachments/assets/6c571502-b58b-455a-b1ae-0c71fad6e274"> |


## Stacks 🛠️
<img src="https://img.shields.io/badge/html5-E34F26?style=for-the-badge&logo=html5&logoColor=white"> <img src="https://img.shields.io/badge/css-1572B6?style=for-the-badge&logo=css3&logoColor=white"> <img src="https://img.shields.io/badge/javscript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=white"> <img src="https://img.shields.io/badge/spring-6DB33F?style=for-the-badge&logo=spring&logoColor=white"> <img src="https://img.shields.io/badge/github-181717?style=for-the-badge&logo=github&logoColor=white"> <img src="https://img.shields.io/badge/apache tomcat-F8DC75?style=for-the-badge&logo=apache tomcat&logoColor=black"> <img src="https://img.shields.io/badge/mysql-4479A1?style=for-the-badge&logo=mysql&logoColor=white"> <img src="https://img.shields.io/badge/amazonec2-FF9900?style=for-the-badge&logo=amazonec2&logoColor=white"> <img src="https://img.shields.io/badge/amazonrds-527FFF?style=for-the-badge&logo=amazonrds&logoColor=white"> <img src="https://img.shields.io/badge/amazons3-569A31?style=for-the-badge&logo=amazons3&logoColor=white">

- 프론트엔드: HTML, CSS, JavaScript
- 백엔드: Java, JSP, Spring, EL, JSTL
- AJAX: 비동기 데이터 페칭
- 데이터베이스: MySQL, Amazon RDS
- 서버: Apache Tomcat, Amazon EC2
- 저장소: Amazon S3

## Database: ERD

![image](https://github.com/user-attachments/assets/cf182730-7f64-4ad6-ab2c-17fde6372c49)
