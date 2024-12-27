import 'package:flutter/material.dart';
import 'package:flutter_movie_app/domain/entity/movie.dart';
import 'package:flutter_movie_app/domain/entity/movie_list.dart';
import 'package:flutter_movie_app/presentation/pages/detail_page/detail_page.dart';
import 'package:flutter_movie_app/presentation/pages/home_page/home_page_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer(builder: (context, ref, child) {
        final movies = ref.watch(homePageViewModel);
        if (movies == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text('가장 인기있는 영화'),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                        padding: EdgeInsets.all(20),
                        width: double.infinity,
                        child: AspectRatio(
                            aspectRatio: 2 / 3,
                            child: Image.network(
                                'https://image.tmdb.org/t/p/original/${movies.popularMovies[0].posterPath}'))),
                  ),
                  movieWidget(context,movies.nowPlayingMovies,'현재상영중'),
                  movieWidget(context,movies.popularMovies, '인기순'),
                  movieWidget(context,movies.topRatedMovies,'평점 높은 순'),
                  movieWidget(context,movies.upcomingMovies, '개봉예정'),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }

  Column movieWidget(BuildContext context,List<Movie> movie, String text) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: Text(text),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              (context),
              MaterialPageRoute(builder: (context) => DetailPage()),
            );
            print('touch');
          },
          child: SizedBox(
            height: 180,
            child: ListView.builder(
              itemCount: movie.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  width: 100,
                  margin: EdgeInsets.all(5),
                  child: Image.network(
                      'https://image.tmdb.org/t/p/original/${movie[index].posterPath}'),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
