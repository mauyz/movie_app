import 'dart:async';
import 'package:chopper/chopper.dart';

class HeaderInterceptor implements RequestInterceptor {
  static const String authHeader = "Authorization";
  static const String bearer = "Bearer ";
  static const String v4AuthHeader =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkNjIzMmNhYTRiNTYzMmQ3NDcyZDMyNmRlY2QyODBlMSIsInN1YiI6IjYyNTJiMGQ3OWQ2ZTMzMWQ3YTA5YzljZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.BwhNCaJCNbPvZKw5awVAE7fiPOKvSOQ8Ahi0Ezl6HbM";

  @override
  FutureOr<Request> onRequest(Request request) async {
    Request newRequest =
        request.copyWith(headers: {authHeader: bearer + v4AuthHeader});
    return newRequest;
  }
}
