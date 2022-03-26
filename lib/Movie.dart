import 'Categories.dart';
import 'Directors.dart';

class Movie {
  String movie_id;
  String movie_name;
  String movie_year;
  String movie_img;
  Categories categories;
  Directors directors;

  Movie(this.movie_id, this.movie_name, this.movie_year, this.movie_img,
      this.categories, this.directors);

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        json["film_id"] as String,
        json["film_ad"] as String,
        json["film_yil"] as String,
        json["film_resim"] as String,
        Categories.fromJson(json["kategori"]),
        Directors.fromJson(json["yonetmen"]));
  }
}
