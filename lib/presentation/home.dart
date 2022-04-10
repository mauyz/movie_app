import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/data/models/popular_result.dart';
import 'package:movie_app/domain/repositories/movie_repository.dart';
import 'package:movie_app/domain/usecases/get_popular_movie.dart';
import 'package:movie_app/injection.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GetPopularMovie getPopularMovie =
        GetPopularMovie(locator<MovieRepository>());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Popular now"),
      ),
      body: FutureBuilder<Response<PopularResult>>(
        future: getPopularMovie.call(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  snapshot.error.toString(),
                  textAlign: TextAlign.center,
                  textScaleFactor: 1.3,
                ),
              );
            }
            final data = snapshot.data;
            if (data == null) {
              return Center(
                child: Text(
                  snapshot.error.toString(),
                  textAlign: TextAlign.center,
                  textScaleFactor: 1.3,
                ),
              );
            }
            final popular = data.body;
            if (popular == null) {
              return Center(
                child: Text(
                  snapshot.error.toString(),
                  textAlign: TextAlign.center,
                  textScaleFactor: 1.3,
                ),
              );
            }
            return _buildMovieList(context, popular);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  ListView _buildMovieList(BuildContext context, PopularResult popular) {
    const imageURL = "https://image.tmdb.org/t/p/w500/";
    return ListView.builder(
      itemCount: popular.results.length,
      padding: const EdgeInsets.all(8),
      itemBuilder: (context, index) {
        return Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Builder(
                  builder: (context) {
                    final poster = popular.results[index].posterPath;
                    if(poster == null){
                      return const SizedBox(
                        width: 150,
                        height: 200,
                        child: Center(
                          child: Text(
                            "No image",
                            textAlign: TextAlign.center,
                            textScaleFactor: 1.3,
                          ),
                        ),
                      );
                    }
                    return Container(
                      width: 150,
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            imageURL + poster,
                          ),
                          fit: BoxFit.contain,
                        ),
                      ),
                    );
                  }
                ),
                Expanded(
                  child: SizedBox(
                    height: 200,
                    child: Column(
                      children: <Widget>[
                        // 5
                        Text(
                          popular.results[index].title,
                          style: const TextStyle(fontSize: 14),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Expanded(
                          child: Text(
                            popular.results[index].overview,
                            style: const TextStyle(fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
