import 'package:chopper/chopper.dart';
import 'package:movie_app/data/models/popular_result.dart';

abstract class MovieRepository{
  Future<Response<PopularResult>> getPopularMovies();
  //Future<Response<List<Movie>>> getComing();
}