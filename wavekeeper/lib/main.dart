import 'package:flutter/material.dart';
import 'package:wavekeeper/views/business.dart';
import 'package:wavekeeper/views/home.dart';
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
     
      home: LoginScreen(),
      routes: {
        '/minhasvendas': (context) => const MinhasVendas(),
        '/minhascompras': (context) => const MinhasCompras(),
        '/privacidade': (context) => const Privacidade(),
        '/edicaoperfil': (context) => const EdicaoPerfil(),
        '/audio': (context) => const Audio(),
        '/sobreApp': (context) => const SobreApp(),
        '/viewProfile': (context) => ViewProfile(),
      }
//usuario:Usuario(nome: nome, nomeArtistico: nomeArtistico, email: email, senha: senha)
    );
  }
}