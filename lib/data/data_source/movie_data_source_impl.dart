import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_movie_app/data/data_source/movie_data_source.dart';
import 'package:flutter_movie_app/data/dto/movie_response_dto.dart';
import 'package:http/http.dart';

class MovieDataSourceImpl implements MovieDataSource {


  @override
  Future<List<MovieResponseDto>?> fetchNowPlayingMovies() async {
    try {
      Client client = Client();
      Response result = await client.get(
          Uri.parse(
              'https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc&with_release_type=2|3&release_date.gte={min_date}&release_date.lte={max_date}'),
          headers: {
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhYTg3ZGMyNzBkNTc1ODE2M2VlY2ZkYTI4ZTQ5YmVjOSIsIm5iZiI6MTczNTE4MzczOC41MjE5OTk4LCJzdWIiOiI2NzZjY2Q3YWQwYjA4Zjk3MTg2MTM3ZDIiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.1WKk21HZS9Pvgr544pWs0wozGuaKmZRpua_z5mEGtfY',
            'accept': 'application/json',
          });
      if (result.statusCode == 200) {
        //  return List.from(json['results']).map((e) => MovieResponseDto.fromJson(e)).toList();
        final decodedJson = jsonDecode(result.body) as Map<String, dynamic>;
        return List.from(decodedJson['results'])
            .map((e) => MovieResponseDto.fromJson(e))
            .toList();
      }
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<List<MovieResponseDto>?> fetchPopularMovies() async {
    try {
      Client client = Client();
      Response result = await client.get(
          Uri.parse(
              'https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc'),
          headers: {
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhYTg3ZGMyNzBkNTc1ODE2M2VlY2ZkYTI4ZTQ5YmVjOSIsIm5iZiI6MTczNTE4MzczOC41MjE5OTk4LCJzdWIiOiI2NzZjY2Q3YWQwYjA4Zjk3MTg2MTM3ZDIiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.1WKk21HZS9Pvgr544pWs0wozGuaKmZRpua_z5mEGtfY',
            'accept': 'application/json',
          });
      if (result.statusCode == 200) {
        //  return List.from(json['results']).map((e) => MovieResponseDto.fromJson(e)).toList();
        final decodedJson = jsonDecode(result.body) as Map<String, dynamic>;
        return List.from(decodedJson['results'])
            .map((e) => MovieResponseDto.fromJson(e))
            .toList();
      }
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<List<MovieResponseDto>?> fetchTopRatedMovies() async {
    try {
      Client client = Client();
      Response result = await client.get(
          Uri.parse(
              'https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=vote_average.desc&without_genres=99,10755&vote_count.gte=200'),
          headers: {
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhYTg3ZGMyNzBkNTc1ODE2M2VlY2ZkYTI4ZTQ5YmVjOSIsIm5iZiI6MTczNTE4MzczOC41MjE5OTk4LCJzdWIiOiI2NzZjY2Q3YWQwYjA4Zjk3MTg2MTM3ZDIiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.1WKk21HZS9Pvgr544pWs0wozGuaKmZRpua_z5mEGtfY',
            'accept': 'application/json',
          });
      if (result.statusCode == 200) {
        //  return List.from(json['results']).map((e) => MovieResponseDto.fromJson(e)).toList();
        final decodedJson = jsonDecode(result.body) as Map<String, dynamic>;
        return List.from(decodedJson['results'])
            .map((e) => MovieResponseDto.fromJson(e))
            .toList();
      }
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<List<MovieResponseDto>?> fetchUpcomingMovies() async {
    try {
      Client client = Client();
      Response result = await client.get(
          Uri.parse(
              'https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc&with_release_type=2|3&release_date.gte={min_date}&release_date.lte={max_date}'),
          headers: {
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhYTg3ZGMyNzBkNTc1ODE2M2VlY2ZkYTI4ZTQ5YmVjOSIsIm5iZiI6MTczNTE4MzczOC41MjE5OTk4LCJzdWIiOiI2NzZjY2Q3YWQwYjA4Zjk3MTg2MTM3ZDIiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.1WKk21HZS9Pvgr544pWs0wozGuaKmZRpua_z5mEGtfY',
            'accept': 'application/json',
          });
      if (result.statusCode == 200) {
        //  return List.from(json['results']).map((e) => MovieResponseDto.fromJson(e)).toList();
        final decodedJson = jsonDecode(result.body) as Map<String, dynamic>;
        return List.from(decodedJson['results'])
            .map((e) => MovieResponseDto.fromJson(e))
            .toList();
      }
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }
  
  @override
  Future<List<MovieResponseDto>?> fetchMovieDetail() {
    // TODO: implement fetchMovieDetail
    throw UnimplementedError();
  }


}
