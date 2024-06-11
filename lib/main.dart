import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'profile_screen.dart';
import 'data_analysis_screen.dart';
import 'splash_screen.dart';
import 'services/data_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DataService.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chronotype App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          ),
        ),
        cardTheme: CardTheme(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          elevation: 5,
        ),
      ),
      home: SplashScreen(),
      routes: {
        '/home': (context) => HomeScreen(email: 'example@example.com'),
        '/profile': (context) => ProfileScreen(email: 'example@example.com'),
        '/analysis': (context) => DataAnalysisScreen(email: 'example@example.com'),
      },
    );
  }
}
