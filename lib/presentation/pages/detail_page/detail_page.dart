import 'package:flutter/material.dart';
import 'package:flutter_movie_app/presentation/pages/detail_page/detail_page_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class DetailPage extends ConsumerWidget {
  final int movieId;
  final String tag;

  DetailPage(this.movieId, this.tag);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movies = ref.watch(detailPageViewModel);
    ref.read(detailPageViewModel.notifier).fetchDetail(movieId);
    return Scaffold(
      body: movies.getMovieDetail == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(
                      tag: '${tag}-${movieId}',
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: AspectRatio(
                          aspectRatio: 2 / 3,
                          child: Image.network(
                            'https://image.tmdb.org/t/p/original${movies.getMovieDetail!.posterPath}',
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(Icons.error),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                movies.getMovieDetail!.title,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight, // 오른쪽 정렬
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    DateFormat('yyyy-MM-dd').format(
                                        movies.getMovieDetail!.releaseDate),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            '${movies.getMovieDetail!.tagline}',
                          ),
                          Text(
                            '러닝타임: ${movies.getMovieDetail!.runtime}분',
                          ),
                          const Divider(
                            color: Colors.white38,
                            thickness: 1.0,
                          ),
                          Row(
                            children: [
                              ...movies.getMovieDetail!.genres.map((genre) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      right: 8.0), // 각 항목 간의 간격 조정
                                  child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          border:
                                              Border.all(color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          genre.name,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Theme.of(context)
                                                .highlightColor,
                                          ),
                                        ),
                                      )),
                                );
                              }),
                            ],
                          ),
                          const Divider(
                            color: Colors.white38,
                            thickness: 1.0,
                          ),
                          Text(
                            '${movies.getMovieDetail!.overview}',
                          ),
                          const Divider(
                            color: Colors.white38,
                            thickness: 1.0,
                          ),
                          Text(
                            '흥행 정보',
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(height: 10,),
                          SizedBox(
                            height: 100,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(20),
                                      border:
                                          Border.all(color: Colors.white)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${movies.getMovieDetail!.popularity}',
                                      ),
                                      Text('인기점수')
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  padding: EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border:
                                          Border.all(color: Colors.white)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                          '${movies.getMovieDetail!.voteAverage}'),
                                      Text('평점')
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  padding: EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border:
                                          Border.all(color: Colors.white)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                          '${movies.getMovieDetail!.budget}'),
                                      Text('예산')
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  padding: EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border:
                                          Border.all(color: Colors.white)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                    Text('${movies.getMovieDetail!.revenue}'),
                                    Text('수익')
                                  ]),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  padding: EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border:
                                          Border.all(color: Colors.white)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                          '${movies.getMovieDetail!.voteCount}'),

                                      Text('평점투표수')
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 10,),
                          SizedBox(
                            height: 100,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: movies
                                  .getMovieDetail!.productionCompanies.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  padding: EdgeInsets.all(20),
                                  width: 150,
                                  margin: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                  ),
                                  child: movies
                                              .getMovieDetail!
                                              .productionCompanies[index]
                                              .logoPath !=
                                          null
                                      ? Image.network(
                                          'https://image.tmdb.org/t/p/original${movies.getMovieDetail!.productionCompanies[index].logoPath}')
                                      : Text(movies.getMovieDetail!
                                          .productionCompanies[index].name),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
    );
  }
}
