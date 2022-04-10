import 'package:chopper/chopper.dart';
import 'package:movie_app/data/models/popular_result.dart';
import 'package:movie_app/domain/repositories/movie_repository.dart';

class GetPopularMovie{
  final MovieRepository movieRepository;
  GetPopularMovie(this.movieRepository);

  Future<Response<PopularResult>> call() {
    return movieRepository.getPopularMovies();
  }
}