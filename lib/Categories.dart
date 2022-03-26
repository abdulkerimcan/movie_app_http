class Categories {
  String category_id;
  String category_name;

  Categories(this.category_id, this.category_name);

  factory Categories.fromJson(Map<String,dynamic> json) {
    return Categories(json["kategori_id"], json["kategori_ad"]);
  }
}