import 'package:flutter/material.dart';
import 'package:flutter_movie_app/presentation/pages/home_page/home_page_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailPage extends ConsumerWidget {
  final int movieId;

  DetailPage(this.movieId);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                        'https://image.tmdb.org/t/p/original${movies.getMovieDetail!.posterPath}',
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.error),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Row(
                        children: [
                          Text(
                            movies.getMovieDetail!.title ?? 'No Title',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('${movies.getMovieDetail!.releaseDate}'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Text(
                        '${movies.getMovieDetail!.tagline ?? '정보 없음'}',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Text(
                        '러닝타임: ${movies.getMovieDetail!.runtime ?? 0}분',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20),
                      child: const Divider(
                        color: Colors.white38,
                        thickness: 1.0,
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        child: Row(
                          children: [
                            ...movies.getMovieDetail!.genres.map((genre) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                    right: 8.0), // 각 항목 간의 간격 조정
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        border: Border.all(color: Colors.white),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        genre.name,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Theme.of(context).highlightColor,
                                        ),
                                      ),
                                    )),
                              );
                            }).toList(),
                          ],
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20),
                      child: const Divider(
                        color: Colors.white38,
                        thickness: 1.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Text('${movies.getMovieDetail!.overview ?? '정보 없음'}',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: const Divider(
                        color: Colors.white38,
                        thickness: 1.0,
                      ),
                    ),
                    const Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Text(
                        '흥행 정보',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    SizedBox(
                      //popularity평점 평점투표수 인기점수 예산 수익
                      //popularity ,voteAverage,voteCount,budget,revenue
                      height: 80,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: ListView(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          scrollDirection: Axis.horizontal,
                          children: [
                            Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Colors.white
                                )
                                
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text('${movies.getMovieDetail!.popularity}',
                                )),
                            ),
                            SizedBox(width: 10,),
                            Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Colors.white
                                )
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text('${movies.getMovieDetail!.voteAverage}')),
                            ),
                            SizedBox(width: 10,),
                            Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Colors.white
                                )
             
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text('${movies.getMovieDetail!.budget}')),
                            ),
                            SizedBox(width: 10,),
                            Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Colors.white
                                )
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text('${movies.getMovieDetail!.revenue}')),
                            ),
                            SizedBox(width: 10,),
                            Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Colors.white
                                )
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text('${movies.getMovieDetail!.popularity}')),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      child: SizedBox(
                        height: 100,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount:
                              movies.getMovieDetail!.productionCompanies.length,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: EdgeInsets.all(20),
                              width: 150,
                              margin: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],),
                              child: movies.getMovieDetail!
                                          .productionCompanies[index].logoPath !=
                                      null
                                  ? Image.network(
                                      'https://image.tmdb.org/t/p/original${movies.getMovieDetail!.productionCompanies[index].logoPath}')
                                  : Text(movies.getMovieDetail!
                                      .productionCompanies[index].name),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
    );
  }
}