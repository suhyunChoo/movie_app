import 'package:flutter_movie_app/domain/entity/movie.dart';
import 'package:flutter_movie_app/domain/entity/movie_detail.dart';
import 'package:flutter_movie_app/domain/repository/movie_repository.dart';

class FetchMoviesUsecase {

  FetchMoviesUsecase(this._movieRepository);

  final MovieRepository _movieRepository;

  Future<List<Movie>?>excute()async{
    return await _movieRepository.fetchNowPlayingMovies();
  }
  Future<List<Movie>?>getPopular()async{
    return await _movieRepository.fetchPopularMovies();
  }
  Future<List<Movie>?>getTopRated()async{
    return await _movieRepository.fetchTopRatedMovies();
  }
  Future<List<Movie>?>getUpcoming()async{
    return await _movieRepository.fetchUpcomingMovies();
  }
  Future<MovieDetail?>getDetail()async{
    // return await _movieRepository.fetchMovieDetail(int id);
  }

}