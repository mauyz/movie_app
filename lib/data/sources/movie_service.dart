import "dart:async";
import 'package:chopper/chopper.dart';
import 'package:movie_app/data/models/popular_result.dart';
import 'package:movie_app/injection.dart';

part "movie_service.chopper.dart";

@ChopperApi(baseUrl: "movie")
abstract class MovieService extends ChopperService{

  static MovieService create() =>
      _$MovieService(locator<ChopperClient>());

  @Get(path: 'popular')
  Future<Response<PopularResult>> getPopularMovies();
}