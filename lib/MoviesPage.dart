
import 'package:flutter/material.dart';

import 'Categories.dart';
import 'Detail.dart';
import 'Movie.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'MovieResponse.dart';

class MoviesPage extends StatefulWidget {
  Categories categories;


  MoviesPage({required this.categories});

  @override
  _MoviesPageState createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {


  List<Movie> moviesResponse(String response) {
    return MovieResponse.fromJson(json.decode(response)).movieList;
  }


  Future<List<Movie>> getMovie() async {
    var url = Uri.parse("http://kasimadalan.pe.hu/filmler/filmler_by_kategori_id.php");
    var veri = {"kategori_id":widget.categories.category_id};
    var response = await http.post(url,body: veri);

    return moviesResponse(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Categories : ${widget.categories.category_name}"),
        leading: Icon(Icons.movie_sharp),
      ),
      body: FutureBuilder<List<Movie>>(
        future: getMovie(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var movieList = snapshot.data;
            return GridView.builder(
              itemCount: movieList!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 3.5
              ),
              itemBuilder: (context, index) {
                var movie = movieList[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Detail(movie)));
                  },
                  child: Card(
                    elevation: 10.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset("images/${movie.movie_img}"),
                        ),

                        Text("${movie.movie_name}",
                            style: const TextStyle(
                                color: Colors.blueAccent,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return Center();
          }
        },
      ),
    );
  }
}
