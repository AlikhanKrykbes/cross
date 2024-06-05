import 'package:equatable/equatable.dart';

abstract class MovieEvent extends Equatable {
  const MovieEvent();

  @override
  List<Object> get props => [];
}

class FetchUpcomingMovies extends MovieEvent {}

class LikeMovie extends MovieEvent {
  final int movieId;

  const LikeMovie(this.movieId);

  @override
  List<Object> get props => [movieId];
}
