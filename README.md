# VaccinationCenter
## 공공 데이터 오픈 Api를 활용한 코로나 예방접종센터 정보 및 위치 찾기

### 개발 기간
- 2021.09.18 ~ 2021.09.23

### 구성인원 및 기여도
- iOS 1명(기여도 100%)


### 관련 기술
- RxSwift, RxCocoa, SnapKit, Alamofire, MapKit


### App 기능
1. 공공 데이터 오픈 Api를 통한 예방접종센터 리스트 불러오기
2. 해당 예방접종센터 Cell 선택 시 자세한 정보 표시하기
3. 지도 버튼 선택 시 지도 화면으로 이동
4. 현재위치로 버튼 선택 시 나의 현재 위치 표시
5. 접종센터로 버튼 선택 시 해당 예방접종센터의 위치 표시


### 구현 방향 및 목표
1. 스토리보드 없이 코드로만 View 구현(SnapKit 라이브러시리 사용)
2. RxSwift를 사용하여 비동기 이벤트 처리
3. MapKit을 활용한 위치 MarKer 표시
4. TableView Pagination 구현(스크롤 시 10개씩 추가 데이터 받아오기)


### App Architecture
<img width="1022" alt="스크린샷 2021-09-23 오후 5 16 12" src="https://user-images.githubusercontent.com/73586326/134474957-7a443543-b4c9-4dd2-a0c6-dd87831f85c7.png">


### App ScreenShot
|<img src="https://user-images.githubusercontent.com/73586326/134471600-4b1de793-01e5-443a-8f49-ce4c8ee05918.jpeg" width="300">|<img src="https://user-images.githubusercontent.com/73586326/134471912-d530d24a-79d0-4f96-9f86-2a3b1deaf3d3.jpeg" width="300">|
|:---:|:---:|
|**예방접종센터 리스트**|**디테일 정보 화면**|

|<img src="https://user-images.githubusercontent.com/73586326/134472062-ee751524-8797-44d4-921a-c43effd92091.jpeg" width="300">|<img src="https://user-images.githubusercontent.com/73586326/134472104-5f44fb48-8e24-4364-824a-ee7b1cf26629.jpeg" width="300">|
|:---:|:---:|
|**현재 위치**|**예방접종센터 위치**|
