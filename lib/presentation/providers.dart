//뷰모델에서 직접 객체 생성하지 않을 수 있게
//use case 공급해주는 provider 생성
//뷰모델 내에서는 provider에 의해서 use case 공급받을 것.

import 'package:flutter_movie_app/data/data_source/movie_data_source.dart';
import 'package:flutter_movie_app/data/data_source/movie_data_source_impl.dart';
import 'package:flutter_movie_app/data/repository/movie_repository_impl.dart';
import 'package:flutter_movie_app/domain/repository/movie_repository.dart';
import 'package:flutter_movie_app/domain/usecase/fetch_movies_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _movieDataSourceProvider = Provider<MovieDataSource>((ref){
  return MovieDataSourceImpl();

});

final _movieRepositoryProvider = Provider<MovieRepository>((ref){
  final dataSource = ref.read(_movieDataSourceProvider);
  return MovieRepositoryImpl(dataSource);
});

final fetchMoviesUsecaseProvider = Provider((ref){
  final movieRepo = ref.read(_movieRepositoryProvider);
 return FetchMoviesUsecase(movieRepo);
});