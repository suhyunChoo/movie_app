import 'dart:convert';

import 'package:flutter_movie_app/data/dto/movie_response_dto.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  String str = """{
  "dates": {
    "maximum": "2025-01-01",
    "minimum": "2024-11-20"
  },
  "page": 1,
  "results": [
    {
      "adult": false,
      "backdrop_path": "/cjEcqdRdPQJhYre3HUAc5538Gk8.jpg",
      "genre_ids": [
        28,
        14,
        35
      ],
      "id": 845781,
      "original_language": "en",
      "original_title": "Red One",
      "overview": "After Santa Claus (codename: Red One) is kidnapped, the North Pole's Head of Security must team up with the world's most infamous tracker in a globe-trotting, action-packed mission to save Christmas.",
      "popularity": 5364.959,
      "poster_path": "/cdqLnri3NEGcmfnqwk2TSIYtddg.jpg",
      "release_date": "2024-10-31",
      "title": "Red One",
      "video": false,
      "vote_average": 7.003,
      "vote_count": 1316
      
    }
    ]
    }""";
  test(
    'dto test',
    () async {
      Map<String, dynamic> map = jsonDecode(str);
      // MovieResponseDto movieResponseDto = MovieResponseDto.fromJson(map);
      List<dynamic> results = map['results'];

      // Map the 'results' list to MovieResponseDto
      List<MovieResponseDto> movieResponseDto =
          results.map((movie) => MovieResponseDto.fromJson(movie)).toList();

      print(movieResponseDto.first.id);
      expect(movieResponseDto.first.id, '845781');
    },
  );
}
