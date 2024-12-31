<!-- <p align="center">
  <img src="assets/images/mainLogo.svg" alt="App Logo" width="300">
</p> -->

# 영화 정보 앱

가장 인기 있는 영화 부터 개봉 예정작까지, 영화 정보를 알려주는 앱 입니다.

## 📚 프로젝트 소개

TMDB와 통신하여 실시간으로 영화 데이터를 받아와 보여주는 영화 정보 앱을 구현했습니다.

### 주요 기능

- **영화 리스트**: 실시간으로 가장 인기 있는 영화, 상영작, 개봉 예정작을 받아와 보여줍니다.

- **영화 상세 정보**: 영화 포스터를 누르면 개봉일, 카테고리등의 상세정보를 보여줍니다.

## 🚀 주요 기술 스택

### 프론트엔드

- **Flutter**: Dart를 활용해서 크로스플랫폼 모바일 애플리케이션을 개발
- **Riverpod**: 상태 관리 및 데이터 흐름 제어


## 📂 프로젝트 구조

```
lib/
│
├── core/
│   └── geolocator_helper.dart # 위치 정보 사용
│
├── data/                      # 데이터 레이어
│   ├── model/                 # 데이터 모델 정의
│   │   ├── chat.dart          # Chat 모델 클래스
│   │   ├── message.dart       # Chat 내의 Message 모델 클래스
│   │   ├── pet.dart           # Pet 모델 클래스
│   │   └── user_model.dart    # User 모델 클래스
│   │
│   └── repository/            # 데이터 관리 및 CRUD
│       ├── auth_repository.dart
│       ├── chat_repository.dart
│       ├── friends_repository.dart
│       ├── message_repository.dart
│       ├── my_page_repository.dart
│       ├── user_repository.dart
│       └── vworld0_repository.dart
│
├── ui/                        # UI 레이어
│   ├── pages/                 # 페이지별 UI 화면
│   │   ├── home/              # 홈 탭
│   │   │   ├── _tab/          # 탭별 화면
│   │   │   │   ├── friends/   # 친구 찾기
│   │   │   │   └── mypage/    # 마이페이지
│   │   └── login_join/        # 로그인 화면
│   │
│   └── widgets/               # 재사용 가능한 위젯들
│       ├── dog_snack_bar.dart # 로그인 관련 알림 스낵바
│       └── logo_text.dart
│
├── user_data.dart             # 사용자 데이터
└── main.dart                  # 앱 시작점
```
