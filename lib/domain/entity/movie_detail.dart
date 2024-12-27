// class MovieDetail {
//   /// 영화의 예산
//   final int budget;

//   /// 영화의 장르 리스트 (예: ["액션", "드라마", "스릴러"])
//   final List<String> genres;

//   /// 영화의 고유 ID (API에서 유니크한 식별자)
//   final int id;

//   /// 제작 회사 로고들의 리스트 (각 로고는 이미지 경로 또는 URL일 수 있음)
//   final List<String> production_companies;

//   /// 영화에 대한 간략한 설명 (줄거리)
//   final String overview;

//   /// 영화의 인기 점수 (예: TMDB에서 제공하는 popularity 점수)
//   final double popularity;

//   /// 영화의 개봉일 (예: 2023-05-01)
//   final DateTime releaseDate;

//   /// 영화의 총 수익 (revenue)
//   final int revenue;

//   /// 영화의 상영 시간 (분 단위)
//   final int runtime;

//   /// 영화의 태그라인 (짧은 홍보 문구)
//   final String tagline;

//   /// 영화의 제목
//   final String title;

//   /// 영화의 평균 평점 (예: 8.4)
//   final double voteAverage;

//   /// 영화에 대한 총 투표 수
//   final int voteCount;

//   MovieDetail({
//     required this.budget,
//     required this.genres,
//     required this.id,
//     required this.production_companies,
//     required this.overview,
//     required this.popularity,
//     required this.releaseDate,
//     required this.revenue,
//     required this.runtime,
//     required this.tagline,
//     required this.title,
//     required this.voteAverage,
//     required this.voteCount,
//   });
// }
// adult: false, 
// backdrop_path: /3V4kLQg0kSqPLctI5ziYWabAZYF.jpg, 
// belongs_to_collection: {id: 558216, name: Venom Collection, poster_path: /aC1yeoBdQL0fukiKrEAFocJ572O.jpg, backdrop_path: /vq340s8DxA5Q209FT8PHA6CXYOx.jpg}, 
// budget: 120000000, 
// genres: [{id: 28, name: Action}, {id: 878, name: Science Fiction}, {id: 12, name: Adventure}, {id: 53, name: Thriller}], 
// homepage: https://venom.movie, 
// id: 912649, 
// imdb_id: tt16366836, 
// origin_country: [US], 
// original_language: en, 
// original_title: Venom: The Last Dance, 
// overview: Eddie and Venom are on the run. Hunted by both of their worlds and with the net closing in, the duo are forced into a devastating decision that will bring the curtains down on Venom and Eddie's last dance., 
// popularity: 4545.315, 
// poster_path: /aosm8NMQ3UyoBVpSxyimorCQykC.jpg, 
// production_companies: [{id: 5, logo_path: /71BqEFAF4V3qjjMPCpLuyJFB9A.png, name: Columbia Pictures, origin_country: US}, {id: 84041, logo_path: /nw4kyc29QRpNtFbdsBHkRSFavvt.png

// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

MovieDetail MovieDetailFromJson(String str) => MovieDetail.fromJson(json.decode(str));

String MovieDetailToJson(MovieDetail data) => json.encode(data.toJson());

class MovieDetail {
    bool adult;
    String backdropPath;
    dynamic belongsToCollection;
    int budget;
    List<Genre> genres;
    String homepage;
    int id;
    String imdbId;
    List<String> originCountry;
    String originalLanguage;
    String originalTitle;
    String overview;
    double popularity;
    String posterPath;
    List<ProductionCompany> productionCompanies;
    List<ProductionCountry> productionCountries;
    DateTime releaseDate;
    int revenue;
    int runtime;
    List<SpokenLanguage> spokenLanguages;
    String status;
    String tagline;
    String title;
    bool video;
    double voteAverage;
    int voteCount;

    MovieDetail({
        required this.adult,
        required this.backdropPath,
        required this.belongsToCollection,
        required this.budget,
        required this.genres,
        required this.homepage,
        required this.id,
        required this.imdbId,
        required this.originCountry,
        required this.originalLanguage,
        required this.originalTitle,
        required this.overview,
        required this.popularity,
        required this.posterPath,
        required this.productionCompanies,
        required this.productionCountries,
        required this.releaseDate,
        required this.revenue,
        required this.runtime,
        required this.spokenLanguages,
        required this.status,
        required this.tagline,
        required this.title,
        required this.video,
        required this.voteAverage,
        required this.voteCount,
    });

    factory MovieDetail.fromJson(Map<String, dynamic> json) => MovieDetail(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        belongsToCollection: json["belongs_to_collection"],
        budget: json["budget"],
        genres: List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
        homepage: json["homepage"],
        id: json["id"],
        imdbId: json["imdb_id"],
        originCountry: List<String>.from(json["origin_country"].map((x) => x)),
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"]?.toDouble(),
        posterPath: json["poster_path"],
        productionCompanies: List<ProductionCompany>.from(json["production_companies"].map((x) => ProductionCompany.fromJson(x))),
        productionCountries: List<ProductionCountry>.from(json["production_countries"].map((x) => ProductionCountry.fromJson(x))),
        releaseDate: DateTime.parse(json["release_date"]),
        revenue: json["revenue"],
        runtime: json["runtime"],
        spokenLanguages: List<SpokenLanguage>.from(json["spoken_languages"].map((x) => SpokenLanguage.fromJson(x))),
        status: json["status"],
        tagline: json["tagline"],
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
    );

    Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "belongs_to_collection": belongsToCollection,
        "budget": budget,
        "genres": List<dynamic>.from(genres.map((x) => x.toJson())),
        "homepage": homepage,
        "id": id,
        "imdb_id": imdbId,
        "origin_country": List<dynamic>.from(originCountry.map((x) => x)),
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "production_companies": List<dynamic>.from(productionCompanies.map((x) => x.toJson())),
        "production_countries": List<dynamic>.from(productionCountries.map((x) => x.toJson())),
        "release_date": "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "revenue": revenue,
        "runtime": runtime,
        "spoken_languages": List<dynamic>.from(spokenLanguages.map((x) => x.toJson())),
        "status": status,
        "tagline": tagline,
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
    };
}

class Genre {
    int id;
    String name;

    Genre({
        required this.id,
        required this.name,
    });

    factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}

class ProductionCompany {
    int id;
    String? logoPath;
    String name;
    String originCountry;

    ProductionCompany({
        required this.id,
        required this.logoPath,
        required this.name,
        required this.originCountry,
    });

    factory ProductionCompany.fromJson(Map<String, dynamic> json) => ProductionCompany(
        id: json["id"],
        logoPath: json["logo_path"],
        name: json["name"],
        originCountry: json["origin_country"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "logo_path": logoPath,
        "name": name,
        "origin_country": originCountry,
    };
}

class ProductionCountry {
    String iso31661;
    String name;

    ProductionCountry({
        required this.iso31661,
        required this.name,
    });

    factory ProductionCountry.fromJson(Map<String, dynamic> json) => ProductionCountry(
        iso31661: json["iso_3166_1"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "iso_3166_1": iso31661,
        "name": name,
    };
}

class SpokenLanguage {
    String englishName;
    String iso6391;
    String name;

    SpokenLanguage({
        required this.englishName,
        required this.iso6391,
        required this.name,
    });

    factory SpokenLanguage.fromJson(Map<String, dynamic> json) => SpokenLanguage(
        englishName: json["english_name"],
        iso6391: json["iso_639_1"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "english_name": englishName,
        "iso_639_1": iso6391,
        "name": name,
    };
}
