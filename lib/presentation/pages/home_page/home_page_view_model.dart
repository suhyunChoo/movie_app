import 'package:flutter/material.dart';
import 'package:flutter_movie_app/domain/entity/movie.dart';
import 'package:flutter_movie_app/domain/entity/movie_list.dart';
import 'package:flutter_movie_app/presentation/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePageViewModel extends Notifier<MovieList> {
  @override
  MovieList build() {
    fetchMovies();
    MovieList.initial();
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

      state = state.copyWith(
          nowPlayingMovies: nowPlayingMovies!,
          popularMovies: popularMovies!,
          topRatedMovies: topRatedMovies!,
          upcomingMovies: upcomingMovies!);
    } catch (e) {
      print(e);
    }
  }

  Future<void> fetchDetail(int id) async {
    try {
      final movieDetail =
          await ref.read(fetchMoviesUsecaseProvider).getDetail(id);

      state = state.copyWith(getMovieDetail: movieDetail);
    } catch (e) {
      print(e);
    }
  }
}

final homePageViewModel =
    NotifierProvider<HomePageViewModel, MovieList>(() => HomePageViewModel());
