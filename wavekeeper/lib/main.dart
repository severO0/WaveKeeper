import 'package:flutter/material.dart';
import 'package:wavekeeper/views/login.dart';
import 'package:wavekeeper/views/profile.dart';
import 'package:wavekeeper/views/profile/audio.dart';
import 'package:wavekeeper/views/profile/edicaoperfil.dart';
import 'package:wavekeeper/views/profile/minhascompras.dart';
import 'package:wavekeeper/views/profile/minhasvendas.dart';
import 'package:wavekeeper/views/profile/privacidade.dart';
import 'package:wavekeeper/views/profile/sobreApp.dart';
import 'package:wavekeeper/views/profile/viewprofile.dart';

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
      home: ProfileView(),
      routes: {
        '/minhasvendas': (context) => MinhasVendas(),
        '/minhascompras': (context) => MinhasCompras(),
        '/privacidade': (context) => Privacidade(),
        '/edicaoperfil': (context) => EdicaoPerfil(),
        '/audio': (context) => Audio(),
        '/sobreApp': (context) => SobreApp(),
        '/viewProfile': (context) => ViewProfile(),
      }
//usuario:Usuario(nome: nome, nomeArtistico: nomeArtistico, email: email, senha: senha)
    );
  }
}