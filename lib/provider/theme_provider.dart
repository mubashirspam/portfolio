import 'package:flutter/material.dart';

class ThemeConstants {
  static const List<Color> availableColors = [
    Colors.deepPurple,
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.red,
    Colors.teal,
    Colors.indigo,
    Colors.pink,
  ];
}

abstract class IThemeService {
  void changeColor(Color newColor);
  void changeThemeMode(ThemeMode mode);
  void setLightTheme();
  void setDarkTheme();
  void setSystemTheme();
}

abstract class IThemeProvider {
  ThemeData get lightTheme;
  ThemeData get darkTheme;
  ThemeMode get themeMode;
  Color get seedColor;
}

abstract class AppThemeBase extends ChangeNotifier
    implements IThemeService, IThemeProvider {}

class ThemeManager extends AppThemeBase {
  static final ThemeManager instance = ThemeManager._();

  ThemeManager._();

  Color _seedColor = Colors.deepPurple;
  ThemeMode _themeMode = ThemeMode.system;

  @override
  Color get seedColor => _seedColor;

  @override
  ThemeMode get themeMode => _themeMode;

  @override
  ThemeData get lightTheme => ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: _seedColor,
      brightness: Brightness.light,
    ),
    useMaterial3: true,
  );

  @override
  ThemeData get darkTheme => ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: _seedColor,
      brightness: Brightness.dark,
    ),
    useMaterial3: true,
  );

  @override
  void changeColor(Color newColor) {
    _seedColor = newColor;
    notifyListeners();
  }

  @override
  void changeThemeMode(ThemeMode mode) {
    _themeMode = mode;
    notifyListeners();
  }

  @override
  void setLightTheme() {
    changeThemeMode(ThemeMode.light);
  }

  @override
  void setDarkTheme() {
    changeThemeMode(ThemeMode.dark);
  }

  @override
  void setSystemTheme() {
    changeThemeMode(ThemeMode.system);
  }
}
