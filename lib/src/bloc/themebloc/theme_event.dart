import 'package:blocpracticepattern/src/data/app_theme.dart';
import 'package:flutter/material.dart';

@immutable
abstract class ThemeEvent {}

class ThemeToggle extends ThemeEvent {
  final AppTheme theme;

  ThemeToggle(this.theme);
}
