import 'package:chopper/chopper.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/data/repositories/movie_repository_imp.dart';
import 'package:movie_app/data/sources/header_interceptor.dart';
import 'package:movie_app/data/sources/model_converter.dart';
import 'package:movie_app/data/sources/movie_service.dart';
import 'package:movie_app/domain/repositories/movie_repository.dart';

final locator = GetIt.instance;

void init() {
  // repository
  locator.registerLazySingleton<ChopperClient>(
    () => ChopperClient(
      baseUrl: 'https://api.themoviedb.org/3',
      interceptors: [HttpLoggingInterceptor(),HeaderInterceptor()],
      converter: ModelConverter(),
      errorConverter: const JsonConverter(),
    ),
  );

  locator.registerLazySingleton<MovieService>(
          () => MovieService.create()
  );

  locator.registerLazySingleton<MovieRepository>(
        () => MovieRepositoryImp(locator())
  );
}
