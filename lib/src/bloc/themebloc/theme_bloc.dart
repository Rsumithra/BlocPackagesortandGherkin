import 'package:bloc/bloc.dart';
import 'package:blocpracticepattern/src/data/app_theme.dart';



import 'theme_event.dart';

class ThemeBloc extends Bloc<ThemeEvent, AppTheme> {
  ThemeBloc() : super(AppTheme.Light) {
    on<ThemeEvent>((event, emit) {
      if (event is ThemeToggle) {
        emit(event.theme);
      }
    });
  }

  

 
}
