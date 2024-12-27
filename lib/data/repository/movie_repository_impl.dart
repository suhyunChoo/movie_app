
import 'package:flutter_movie_app/data/data_source/movie_data_source.dart';
import 'package:flutter_movie_app/data/dto/movie_response_dto.dart';
import 'package:flutter_movie_app/domain/entity/movie.dart';
import 'package:flutter_movie_app/domain/entity/movie_detail.dart';
import 'package:flutter_movie_app/domain/repository/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  MovieRepositoryImpl(this._movieDataSource);
  final MovieDataSource _movieDataSource;

  @override
  Future<List<Movie>?> fetchNowPlayingMovies() async {
    final result = await _movieDataSource.fetchNowPlayingMovies();
    return result!
        .map(
          (e) => Movie(
            id: e.id,
            posterPath: e.posterPath,
          ),
        )
        .toList();
  }

  @override
  Future<MovieDetail?> fetchMovieDetail(int id) async{
    final result = await _movieDataSource.fetchMovieDetail(id);
    if(result == null){
      return null;
    }
    return result;

  }

  @override
  Future<List<Movie>?> fetchPopularMovies() async{
        final result = await _movieDataSource.fetchPopularMovies();
    return result!
        .map(
          (e) => Movie(
            id: e.id,
            posterPath: e.posterPath,
          ),
        )
        .toList();
  }

  @override
  Future<List<Movie>?> fetchTopRatedMovies() async{
        final result = await _movieDataSource.fetchTopRatedMovies();
    return result!
        .map(
          (e) => Movie(
            id: e.id,
            posterPath: e.posterPath,
          ),
        )
        .toList();
  }

  @override
  Future<List<Movie>?> fetchUpcomingMovies() async{
        final result = await _movieDataSource.fetchUpcomingMovies();
    return result!
        .map(
          (e) => Movie(
            id: e.id,
            posterPath: e.posterPath,
          ),
        )
        .toList();
  }
}
