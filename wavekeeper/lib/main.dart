import 'package:flutter/material.dart';
import 'package:flutter_wavekeeper/screens/business/business.dart';
import 'package:flutter_wavekeeper/screens/home/home.dart';
import 'package:flutter_wavekeeper/screens/profile/aboutApp.dart';
import 'package:flutter_wavekeeper/screens/profile/account.dart';
import 'package:flutter_wavekeeper/screens/profile/privacy.dart';
import 'package:flutter_wavekeeper/screens/profile/profile.dart';
import 'package:flutter_wavekeeper/screens/profile/chatbot.dart';
import 'package:flutter_wavekeeper/screens/profile/sales.dart';
import 'package:flutter_wavekeeper/screens/profile/yourMusic.dart';
import 'package:flutter_wavekeeper/screens/start/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  get nome => null;
  
  get nomeArtistico => null;
  
  get email => null;
  
  get senha => null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        brightness: Brightness.dark,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
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
     
      home: ProfileView(),
//usuario:Usuario(nome: nome, nomeArtistico: nomeArtistico, email: email, senha: senha)

     routes: {
        '/your_music': (context) => YourMusicPage(),
        '/sales': (context) => SalesPage(),
        '/account': (context) => AccountPage(),
        '/frequently_asked_questions': (context) => ChatBotPage(),
        '/privacy': (context) => PrivacyPage(),
        '/about_the_app': (context) => AboutAppPage(),
      },
    );
  }
}