import 'package:flutter_movie_app/domain/entity/movie_list.dart';
import 'package:flutter_movie_app/presentation/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailPageViewModel extends Notifier<MovieList> {
  @override
  MovieList build() {
    MovieList.initial();
    return MovieList();
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

final detailPageViewModel =
    NotifierProvider<DetailPageViewModel, MovieList>(() => DetailPageViewModel());
