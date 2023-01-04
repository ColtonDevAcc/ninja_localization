part of 'app_cubit.dart';

@immutable
class AppState {
  final String? language;

  const AppState({this.language});

  AppState copyWith({String? language}) {
    return AppState(language: language ?? this.language);
  }
}
