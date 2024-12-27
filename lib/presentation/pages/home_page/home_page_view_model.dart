import 'package:flutter/material.dart';
import 'package:flutter_movie_app/domain/entity/movie.dart';
import 'package:flutter_movie_app/domain/entity/movie_list.dart';
import 'package:flutter_movie_app/presentation/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePageViewModel extends Notifier<MovieList> {
  @override
  MovieList build() {
    fetchMovies();
    // fetchNowPlayingMovies();
    //fetchPopularMovies();
    // fetchUpcomingMovies();
    // fetchTopRatedMovies();
    return MovieList();
  }

  Future<void> fetchMovies() async {
    try {
      final popularMovies =
          await ref.read(fetchMoviesUsecaseProvider).getPopular();
      final nowPlayingMovies =
          await ref.read(fetchMoviesUsecaseProvider).excute();
      final topRatedMovies =
          await ref.read(fetchMoviesUsecaseProvider).getTopRated();
      final upcomingMovies =
          await ref.read(fetchMoviesUsecaseProvider).getUpcoming();

      state = MovieList(
          nowPlayingMovies: nowPlayingMovies!,
          popularMovies: popularMovies!,
          topRatedMovies: topRatedMovies!,
          upcomingMovies: upcomingMovies!);
    } catch (e) {
      print(e);
    }
  }

  // Future<void> fetchNowPlayingMovies() async {
  //   state = await ref.read(fetchMoviesUsecaseProvider).excute();
  // }

  // Future<void> fetchPopularMovies() async {
  //   state = await ref.read(fetchMoviesUsecaseProvider).getPopular();
  // }

  // Future<void> fetchTopRatedMovies() async {
  //   state = await ref.read(fetchMoviesUsecaseProvider).getTopRated();
  // }

  // Future<void> fetchUpcomingMovies() async {
  //   state = await ref.read(fetchMoviesUsecaseProvider).getUpcoming();
  // }

  // Future<void> fetchMovieDetail() async {
  //   //수정해야 함
  //   // state = await ref.read(fetchMoviesUsecaseProvider).excute();
  // }
}

final homePageViewModel =
    NotifierProvider<HomePageViewModel, MovieList>(() => HomePageViewModel());
