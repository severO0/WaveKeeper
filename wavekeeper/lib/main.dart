import 'package:flutter/material.dart';
import 'package:wavekeeper/navigation/tabbar.dart';
import 'package:wavekeeper/views/login.dart'; 

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        brightness: Brightness.dark,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white10,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: TextStyle(
            fontSize: 12,
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 12,
          ),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white38,
        ),
      ),
      // Defina a tela de login como a primeira tela
      home: LoginScreen(),
    );
  }
}