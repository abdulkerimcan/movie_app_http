import 'package:movie_app_http/Movie.dart';

class MovieResponse {
  int success;
  List<Movie> movieList;

  MovieResponse(this.success, this.movieList);

  factory MovieResponse.fromJson(Map<String,dynamic> json) {
    var jsonArray = json["filmler"] as List;

    List<Movie> movieList = jsonArray.map((jsonNesnesi) => Movie.fromJson(jsonNesnesi)).toList();
    
    return MovieResponse(json["success"] as int,movieList);
  }
}