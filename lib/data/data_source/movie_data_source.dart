import 'package:flutter_movie_app/data/dto/movie_response_dto.dart';
import 'package:flutter_movie_app/domain/entity/movie_detail.dart';

//인터페이스

abstract interface class MovieDataSource {
  Future<List<MovieResponseDto>?> fetchNowPlayingMovies();
  Future<MovieDetail?> fetchMovieDetail(int id);
  Future<List<MovieResponseDto>?> fetchPopularMovies();
  Future<List<MovieResponseDto>?> fetchTopRatedMovies();
  Future<List<MovieResponseDto>?> fetchUpcomingMovies();



}
