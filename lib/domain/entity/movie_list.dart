import 'package:flutter_movie_app/domain/entity/movie.dart';
import 'package:flutter_movie_app/domain/entity/movie_detail.dart';

class MovieList {
  final List<Movie> nowPlayingMovies;
  final List<Movie> popularMovies;
  final List<Movie> topRatedMovies;
  final List<Movie> upcomingMovies;
  final MovieDetail? getMovieDetail;

  MovieList({
    this.nowPlayingMovies = const [],
    this.popularMovies = const [],
    this.topRatedMovies = const [],
    this.upcomingMovies = const [],
    this.getMovieDetail,
  });

  factory MovieList.initial() {
    return MovieList(
      popularMovies: [],
      nowPlayingMovies: [],
      topRatedMovies: [],
      upcomingMovies: [],
      getMovieDetail: null,
    );}

    MovieList copyWith({
    List<Movie>? nowPlayingMovies,
    List<Movie>? popularMovies,
    List<Movie>? topRatedMovies,
    List<Movie>? upcomingMovies,
    MovieDetail? getMovieDetail,
  }) {
    return MovieList(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      popularMovies: popularMovies ?? this.popularMovies,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      upcomingMovies: upcomingMovies ?? this.upcomingMovies,
      getMovieDetail: getMovieDetail ?? this.getMovieDetail,
    );
  }
}