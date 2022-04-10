import 'package:chopper/chopper.dart';
import 'package:movie_app/data/models/popular_result.dart';
import 'package:movie_app/data/sources/movie_service.dart';
import 'package:movie_app/domain/repositories/movie_repository.dart';

class MovieRepositoryImp implements MovieRepository{

  final MovieService movieService;

  MovieRepositoryImp(this.movieService);

  @override
  Future<Response<PopularResult>> getPopularMovies() {
    return movieService.getPopularMovies();
  }

}