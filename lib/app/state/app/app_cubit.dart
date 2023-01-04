import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppState());

  void changeLanguage(String language) {
    if (language == state.language) {
      return;
    }

    emit(state.copyWith(language: language));
  }
}
