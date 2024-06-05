import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'http_helper.dart';
import 'movie.dart';
import 'movie_event.dart';
import 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final HttpHelper httpHelper;

  MovieBloc(this.httpHelper) : super(MovieLoading()) {
    on<FetchUpcomingMovies>((event, emit) async {
      emit(MovieLoading());
      try {
        final movies = await httpHelper.getUpcoming();
        emit(MovieLoaded(movies));
      } catch (_) {
        emit(MovieError());
      }
    });
  }
}
