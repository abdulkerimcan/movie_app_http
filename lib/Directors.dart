class Directors {
  String director_id;
  String director_name;

  Directors(this.director_id, this.director_name);

  factory Directors.fromJson(Map<String,dynamic> json) {
    return Directors(json["yonetmen_id"], json["yonetmen_ad"]);
  }
}