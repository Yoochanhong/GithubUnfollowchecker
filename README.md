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


<img src = 'https://postfiles.pstatic.net/MjAyMzA0MTBfMjIy/MDAxNjgxMTMyNjQ4NzI3.x_WJoV0wfao5rTUQ5-e40lX9rOOo9yUX5UihdhipWrMg.xBiqYhLF6DXb8vmIn7_ukx0JRAe4A9sjy7CsVHk2z-Ag.PNG.chanhongy6/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7_2023-04-10_%EC%98%A4%ED%9B%84_10.16.44.png?type=w966' width=400px/>

만약 언팔로워나 언팔로잉 유저가 없을 시 존재하지 않아도 없는 유저라고 뜨던 버그를 백엔드단에서 비어있는 리스트에 쓰레기값을 추가해줌으로써 없는 유저인지, 리스트가 비어있는지를 판별했습니다.

프론트단에서 받아온 데이터에 "1"이 들어있을 경우 조건을 분리시켜 보여줄 계획입니다. (2023 04 10 분기처리 완료)

### 유저 검색 기능 추가

<img src = 'https://postfiles.pstatic.net/MjAyMzA0MjBfMTQz/MDAxNjgxOTkyNDU4Nzk1.NyjnAEbzFfJP5bBKgLJEFgNv_YkW_twDT7qHRftgX7Mg.d8QHDejgFeGglF13S8qARCQufFXAMCWK8ekt-FN7tFMg.PNG.chanhongy6/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7_2023-04-20_%EC%98%A4%ED%9B%84_9.05.57.png?type=w966' width = 300px/> <img src = 'https://postfiles.pstatic.net/MjAyMzA0MjBfMjAz/MDAxNjgxOTkyNDY1MDU4.XMWu6jVqH3TW_W6aZp2x4VJ_yvWUxWDTHaceGkjTtHsg._eRAqeZoqpgoiIbj50aDpH2tpj93anrul96SqWz2r_Ag.PNG.chanhongy6/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7_2023-04-20_%EC%98%A4%ED%9B%84_9.06.08.png?type=w966' width=300px/>

앱바에 TextField를 추가시켜 TextController에 있는 글자가 포함된 리스트만 보여줍니다.

만약 없는 유저일 경우 검색결과가 존재하지 않는다고 표시해주었습니다. (2023 04 20)

### 🌟🌟 2023-04-21 부터 올가를 구분해서 보여드립니다!!

<img src = 'https://postfiles.pstatic.net/MjAyMzA0MjFfMjk2/MDAxNjgyMDQ2NjUxODAx.V406_HyKdp6zNNCg0M2XLAq0te2lelUeDuvaVNnXH78g.C6tCDWUso0tBrnQuThSiGWmza9MAftO61vcaukGwDdYg.PNG.chanhongy6/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7_2023-04-21_%EC%98%A4%ED%9B%84_12.06.20.png?type=w966' width = 500px/> 

타입이 User인 사람만 추출해서 리스트에 넣는 방식으로 보여줍니다.



<img src = 'https://postfiles.pstatic.net/MjAyMzA0MjFfMTcz/MDAxNjgyMDQ2ODg5NjQ1.c1Hkba8UUGPQPXAfG5JZ2bqTHpiqXOPU90aXH0gZ4xEg.yYzawrabyCq9awO--s7tbIPdVzsFiU38SuqFjK1s8a0g.PNG.chanhongy6/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7_2023-04-21_%EC%98%A4%ED%9B%84_12.13.39.png?type=w966' width = 300px/><img src = 'https://postfiles.pstatic.net/MjAyMzA0MjFfOTEg/MDAxNjgyMDQ2ODkzNDEw.bgqegVgnReQpYzGxSH_uvzzoriKsC3BJMYopOh-Ln0Qg.6cWV5tF8WnVXyVmXvDVq8c4yTEf3_n2qUPlkJMkp6ssg.PNG.chanhongy6/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7_2023-04-21_%EC%98%A4%ED%9B%84_12.13.51.png?type=w966' width = 300px/>

수정 전에는 Organizations들이 포함되어 언팔로우 리스트에 올라왔지만, 수정 후부터는 유저만 뜨도록 변경되었습니다.

### 2023-04-30 MVVM으로 변경

그동안 잘못 알고 있던 MVVM 아키텍쳐를 올바르게 설계해서 재구조화 시켰습니다.

Stateful위젯 안에 FutureBuilder로 데이터 처리 결과에 따라 분기처리하던 로직을 Provider를 사용해 ViewModel로 가져오는 결과에서 로딩이 구현되지 않아 체감상 느릴 수 있습니다.
로딩과 그동안 있던 기능들까지 다시 복구할 예정입니다.
