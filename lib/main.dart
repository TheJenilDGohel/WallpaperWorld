import 'package:flutter/material.dart';

import 'package:wallpaperworld/screens/homescreen.dart';
import 'package:wallpaperworld/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wallpaper World',
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      darkTheme: ThemeData.dark(), //yet to create
      home: const HomePage(),
    );
  }
}
