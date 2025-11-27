// Estado => isDarkModeProvider = bool

import 'package:flutter_riverpod/legacy.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

// Listado de colores inmutable
final colorListProvider = StateProvider((ref) => colorList);

// Un simple boolean
final isDarkModeProvider = StateProvider<bool>((ref) => false);

// Un simple init
final selectedColorProvider = StateProvider((ref) => 0);

//Un objeto de tipo AppTheme (custom)
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier(),
);

// Controller o notifier
class ThemeNotifier extends StateNotifier<AppTheme> {
  // State = new AppTheme
  ThemeNotifier() : super(AppTheme());

  void toggleDarkMode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColorIndex() {}
}
