// {
//   "dates": {
//     "maximum": "2025-01-01",
//     "minimum": "2024-11-20"
//   },
//   "page": 1,
//   "results": [
//     {
//       "adult": false,
//       "backdrop_path": "/cjEcqdRdPQJhYre3HUAc5538Gk8.jpg",
//       "genre_ids": [
//         28,
//         14,
//         35
//       ],
//       "id": 845781,
//       "original_language": "en",
//       "original_title": "Red One",
//       "overview": "After Santa Claus (codename: Red One) is kidnapped, the North Pole's Head of Security must team up with the world's most infamous tracker in a globe-trotting, action-packed mission to save Christmas.",
//       "popularity": 5364.959,
//       "poster_path": "/cdqLnri3NEGcmfnqwk2TSIYtddg.jpg",
//       "release_date": "2024-10-31",
//       "title": "Red One",
//       "video": false,
//       "vote_average": 7.003,
//       "vote_count": 1316
//     },



class MovieResponseDto {
    bool adult;
    String backdropPath;
    List<int> genreIds;
    int id;
    String originalLanguage;
    String originalTitle;
    String overview;
    double popularity;
    String posterPath;
    DateTime releaseDate;
    String title;
    bool video;
    double voteAverage;
    int voteCount;

    MovieResponseDto({
        required this.adult,
        required this.backdropPath,
        required this.genreIds,
        required this.id,
        required this.originalLanguage,
        required this.originalTitle,
        required this.overview,
        required this.popularity,
        required this.posterPath,
        required this.releaseDate,
        required this.title,
        required this.video,
        required this.voteAverage,
        required this.voteCount,
    });

    factory MovieResponseDto.fromJson(Map<String, dynamic> json) => MovieResponseDto(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"]?.toDouble(),
        posterPath: json["poster_path"],
        releaseDate: DateTime.parse(json["release_date"]),
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
    );

    Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "id": id,
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "release_date": "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
    };
}
