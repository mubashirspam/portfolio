import 'package:flutter/material.dart';
import 'package:mubashir/provider/theme_provider.dart';
import 'package:mubashir/view/home.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: ThemeManager.instance,
      builder: (context, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Mubashir',
          theme: ThemeManager.instance.lightTheme,
          darkTheme: ThemeManager.instance.darkTheme,
          themeMode: ThemeManager.instance.themeMode,
          home: Home(),
        );
      },
    );
  }
}
