import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'movie.dart';

class HttpHelper {
  final String apiKey = '4ea942c9a65f828493f4dbf6930cf581';
  final String urlBase = 'https://api.themoviedb.org/3/movie';
  final String urlUpcoming = '/upcoming';
  final String urlLanguage = '&language=en-US';
  final String urlApiKey = '?api_key=';
  final String urlSearchBase = 'https://api.themoviedb.org/3/search/movie';

  Future<List<Movie>> getUpcoming() async {
    final String upcoming = '$urlBase$urlUpcoming$urlApiKey$apiKey$urlLanguage';
    print('Upcoming URL: $upcoming');
    try {
      final response = await http.get(Uri.parse(upcoming));
      if (response.statusCode == HttpStatus.ok) {
        final jsonResponse = json.decode(response.body);
        final moviesMap = jsonResponse['results'];
        List<Movie> movies = List<Movie>.from(moviesMap.map((i) => Movie.fromJson(i)));
        return movies;
      } else {
        print('Error fetching upcoming movies: ${response.statusCode}');
        return [];
      }
    } catch (error) {
      print('Error fetching upcoming movies: $error');
      return [];
    }
  }

  Future<List<Movie>> findMovies(String title) async {
    final String query = '$urlSearchBase$urlApiKey$apiKey&query=$title';
    try {
      final response = await http.get(Uri.parse(query));
      if (response.statusCode == HttpStatus.ok) {
        final jsonResponse = json.decode(response.body);
        final moviesMap = jsonResponse['results'];
        List<Movie> movies = List<Movie>.from(moviesMap.map((i) => Movie.fromJson(i)));
        return movies;
      } else {
        print('Error searching movies: ${response.statusCode}');
        return [];
      }
    } catch (error) {
      print('Error searching movies: $error');
      return [];
    }
  }
}
