# VaccinationCenter
## 공공 데이터 오픈 Api를 활용한 코로나 예방접종센터 정보 및 위치 찾기

### 계층 설명
- **Domain**: 비지니스 로직을 포함하고 있는 계층
    - Entity: 비지니스 모델
    - UseCase: 비지니스 로직, Repository를 통해 전달받은 데이터를 가공 및 조합
    - Repository(Interface): Repository의 추상화 객체인 프로토콜
- **Data**: 직접적으로 데이터를 획득하는 계층(서버, 로컬 저장소 등)
    - Data Mapper: 네트워크 시 데이터를 주고 받을 때 사용하는 Codable한 객체 및 Entity로 Mapping하는 로직
    - API(Network): 네트워크를 담당하는 객체(Moya)
    - Repository(implement): 네트워크를 통해 전달받은 데이터를 Domain Entitiy로 Mapping하여 UseCase로 전달
- **Presentation**: UI와 UI를 제어하기 위한 코드를 포함하는 계층
    - ViewModel: UseCase로부터 전달받은 Entity를 View로 바인딩 할 수 있도록 가공
    - View(ViewController): 사용자 Action을 전달하거나 바인딩한 데이터를 View로 표시
<img width="363" alt="스크린샷 2023-08-24 오전 10 41 04" src="https://github.com/Sonjh1306/DailyAlgorithm/assets/73586326/5f2148f5-7796-489f-9a43-69ef28758faa"> 

### 데이터 흐름 및 의존성 
<img width="597" alt="스크린샷 2023-08-24 오전 10 34 22" src="https://github.com/Sonjh1306/DailyAlgorithm/assets/73586326/7f877338-9781-4383-a56d-4626780bde3a">
<img width="541" alt="스크린샷 2023-08-24 오전 10 34 29" src="https://github.com/Sonjh1306/DailyAlgorithm/assets/73586326/fa7c8e53-261c-4159-96b3-503769c1269e">


### App ScreenShot
|<img src="https://user-images.githubusercontent.com/73586326/134471600-4b1de793-01e5-443a-8f49-ce4c8ee05918.jpeg" width="300">|<img src="https://user-images.githubusercontent.com/73586326/134471912-d530d24a-79d0-4f96-9f86-2a3b1deaf3d3.jpeg" width="300">|
|:---:|:---:|
|**예방접종센터 리스트**|**디테일 정보 화면**|

|<img src="https://user-images.githubusercontent.com/73586326/134472062-ee751524-8797-44d4-921a-c43effd92091.jpeg" width="300">|<img src="https://user-images.githubusercontent.com/73586326/134472104-5f44fb48-8e24-4364-824a-ee7b1cf26629.jpeg" width="300">|
|:---:|:---:|
|**현재 위치**|**예방접종센터 위치**|
