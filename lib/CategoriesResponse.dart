import 'package:flutter/foundation.dart';
import 'package:movie_app_http/Categories.dart';

import 'Movie.dart';

class CategoriesResponse {
  int success;
  List<Categories> categoryList;

  CategoriesResponse(this.success, this.categoryList);

  factory CategoriesResponse.fromJson(Map<String,dynamic> json) {
    var jsonArray = json["kategoriler"] as List;

    List<Categories> categoryList = jsonArray.map((jsonNesnesi) => Categories.fromJson(jsonNesnesi)).toList();

    return CategoriesResponse(json["success"] as int,categoryList);
  }
}