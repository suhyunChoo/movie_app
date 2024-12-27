import 'package:flutter_movie_app/data/data_source/movie_data_source_impl.dart';
import 'package:flutter_movie_app/data/dto/movie_response_dto.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  test('impl test', ()async{
    MovieDataSourceImpl movieDataSourceImpl = MovieDataSourceImpl();
    List<MovieResponseDto>? result = await movieDataSourceImpl.fetchNowPlayingMovies();
    expect(result != null, true);
    expect(result!.isNotEmpty, true);
    for (var movie in result) {
        print(movie.title);
      }
  });
}
