import 'package:flutter/material.dart';
import 'package:flutter_movie_app/presentation/pages/home_page/home_page_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailPage extends ConsumerWidget {
  final int movieId;

  DetailPage(this.movieId);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 비동기 상태 구독
    final movies = ref.watch(homePageViewModel);
    ref.read(homePageViewModel.notifier).fetchDetail(movieId);

    return Scaffold(
      appBar: AppBar(),
      body: movies.getMovieDetail == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AspectRatio(
                      aspectRatio: 2 / 3,
                      child: Image.network(
                        'https://image.tmdb.org/t/p/original/${movies.getMovieDetail!.posterPath}',
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.error),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        movies.getMovieDetail!.title ?? 'No Title',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '태그라인: ${movies.getMovieDetail!.tagline ?? '정보 없음'}',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '러닝타임: ${movies.getMovieDetail!.runtime ?? 0}분',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '카테고리: ${movies.getMovieDetail!.genres ?? '정보 없음'}',)
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '영화 설명: ${movies.getMovieDetail!.overview ?? '정보 없음'}',
                      ),
                    ),
                    const Divider(
                      color: Colors.grey,
                      thickness: 1.0,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        '흥행 정보',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    SizedBox(
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10, // 실제 데이터로 변경 필요
                        itemBuilder: (context, index) {
                          return Container(
                            width: 100,
                            margin: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              border: Border.all(width: 2),
                            ),
                            child: Center(child: Text('$index')),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
    );
  }
}
