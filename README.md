
<img src="https://github.com/user-attachments/assets/7c3f1f4d-f0b0-4928-a2dc-c40d477f5dd5" alt="App" width="300">
<img src="https://github.com/user-attachments/assets/ea4adfe9-9a1a-4c8d-8262-a1f137e64b49" alt="App" width="300">

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
lib
 ┣ data
 ┃ ┣ data_source
 ┃ ┃ ┣ movie_data_source.dart
 ┃ ┃ ┗ movie_data_source_impl.dart
 ┃ ┣ dto
 ┃ ┃ ┗ movie_response_dto.dart
 ┃ ┗ repository
 ┃ ┃ ┗ movie_repository_impl.dart
 ┣ domain
 ┃ ┣ entity
 ┃ ┃ ┣ movie.dart
 ┃ ┃ ┣ movie_detail.dart
 ┃ ┃ ┗ movie_list.dart
 ┃ ┣ repository
 ┃ ┃ ┗ movie_repository.dart
 ┃ ┗ usecase
 ┃ ┃ ┗ fetch_movies_usecase.dart
 ┣ presentation
 ┃ ┣ pages
 ┃ ┃ ┣ detail_page
 ┃ ┃ ┃ ┣ detail_page.dart
 ┃ ┃ ┃ ┗ detail_page_view_model.dart
 ┃ ┃ ┗ home_page
 ┃ ┃ ┃ ┣ home_page.dart
 ┃ ┃ ┃ ┗ home_page_view_model.dart
 ┃ ┣ widgets
 ┃ ┗ providers.dart
 ┣ main.dart
 ┗ theme.dart