class Games {
  int id;
  double rating;
  int top;
  int playtime;
  String slug;
  String name;
  String? released;
  String image;
  String? updated;
  List ratings;
  List platforms;
  List genres;
  List tags;
  List? screenshots;

  Games(
      {required this.id,
      required this.rating,
      required this.top,
      required this.playtime,
      required this.slug,
      required this.name,
      required this.released,
      required this.image,
      required this.updated,
      required this.ratings,
      required this.platforms,
      required this.genres,
      required this.tags,
      required this.screenshots});

  Games.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        rating = json['rating'],
        top = json['rating_top'],
        playtime = json['playtime'],
        slug = json['slug'],
        name = json['name'],
        released = json['released'],
        image =
            (json['background_image'] != null) ? json['background_image'] : "",
        updated = json['updated'],
        ratings = json['ratings'],
        platforms = json['parent_platforms'],
        genres = json['genres'],
        tags = json['tags'],
        screenshots = json['screenshots'];
}
