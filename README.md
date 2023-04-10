# GithubUnfollowchecker
깃허브 언팔체크앱을 만들어보자

<img src ='https://postfiles.pstatic.net/MjAyMjExMTRfMTQ3/MDAxNjY4NDIyMTkwMzg1.STJrpJ0OHOzgBfucsTBMWtlUI5i9NjtlMP__XGI-yTog.KS3qJl0C6F8MS5sqDNlJhVvh-b_OFEmf7CC-eCPiddgg.PNG.chanhongy6/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7_2022-11-14_%EC%98%A4%ED%9B%84_7.34.43.png?type=w966' width=300px/>      <img src='https://postfiles.pstatic.net/MjAyMjExMTRfMjQx/MDAxNjY4NDIyMTkzODI1.crYdQRXvaKKtnhb5YVjJgUV7sxh1DKmSs1nqfwt4Z5og.3DtKrqH_ojBRYmuxeF0ekZWCPqke6dRUmVNRvxZjRvsg.PNG.chanhongy6/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7_2022-11-14_%EC%98%A4%ED%9B%84_7.35.40.png?type=w966' width=300px/>      <img src='https://postfiles.pstatic.net/MjAyMjExMTRfNTgg/MDAxNjY4NDIyNDExOTM0.cMpmn5UrWwL3EaYyeBPnVNFJ7oVq6DvMjLn_Q568eEMg.j1P1minUpdF2nW8pRZLY3B5kw4IpEey7MlyOwBIs7Oog.PNG.chanhongy6/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7_2022-11-14_%EC%98%A4%ED%9B%84_7.38.58.png?type=w966' width = 300px/>

입력창에 깃허브 아이디를 입력하면 나는 팔로우했지만 나를 팔로우하지 않은 사람들을 찾아주는 어플입니다.

아쉽게도 올가는 구분이 안되서 이점 감안해주시기 바랍니다;

UI는 항상 개선중이고 유지보수, 기능추가도 하고있습니다.

###	존재하지 않는 유저 여부 확인 추가

###	유저를 누르면 유저 깃허브 링크 웹뷰를 띄워주는 기능 추가

### 뷰 단에서 비즈니스 로직을 돌리던 코드를 백엔드와 프론트엔드 단으로 나누었습니다.
##### 속도는 golang의 goroutine을 사용해 병렬처리를 해서 개선할 예정입니다. (2023 04 09 병렬처리 완료)
##### Future.builder의 중첩호출로 인해 리스트를 내릴때마다 서버 재호출이 되서 순서가 섞이던 버그를 한번에 받아옴으로써 에러를 해결했습니다.

### 개선된 언팔체커는 테스트 결과 어지간하면 2초 이내로 모든 리스트를 보여줍니다.


<img src = 'https://postfiles.pstatic.net/MjAyMzA0MTBfMjIy/MDAxNjgxMTMyNjQ4NzI3.x_WJoV0wfao5rTUQ5-e40lX9rOOo9yUX5UihdhipWrMg.xBiqYhLF6DXb8vmIn7_ukx0JRAe4A9sjy7CsVHk2z-Ag.PNG.chanhongy6/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7_2023-04-10_%EC%98%A4%ED%9B%84_10.16.44.png?type=w966' width=200px/>

만약 언팔로워나 언팔로잉 유저가 없을 시 존재하지 않아도 없는 유저라고 뜨던 버그를 백엔드단에서 비어있는 리스트에 쓰레기값을 추가해줌으로써 없는 유저인지, 리스트가 비어있는지를 판별했습니다.

프론트단에서 받아온 데이터에 "1"이 들어있을 경우 조건을 분리시켜 보여줄 계획입니다.
