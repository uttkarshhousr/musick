import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum AppThemeMode { light, dark }

class ThemeModeCubit extends Cubit<AppThemeMode> {
  ThemeModeCubit() : super(AppThemeMode.dark);

  void toggleTheme() {
    emit(state == AppThemeMode.light ? AppThemeMode.dark : AppThemeMode.light);
  }
}
