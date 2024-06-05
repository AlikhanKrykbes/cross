class Movie {
  int id;
  String title;
  String overview;
  String posterPath;
  double rating;

  Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.rating,
  });

  factory Movie.fromJson(Map<String, dynamic> parsedJson) {
    return Movie(
      id: parsedJson['id'] ?? 0,
      title: parsedJson['title'] ?? "",
      overview: parsedJson['overview'] ?? "",
      posterPath: parsedJson['poster_path'] != null
          ? 'https://image.tmdb.org/t/p/w500${parsedJson['poster_path']}'
          : "",
      rating: (parsedJson['vote_average'] as num).toDouble(),
    );
  }

  String get description => overview;
}
