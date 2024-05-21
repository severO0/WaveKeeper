import 'package:flutter/material.dart';
import 'usuario.dart';

class TelaPrivacidade extends StatelessWidget {
  final Usuario usuario;

  const TelaPrivacidade({Key? key, required this.usuario}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacidade'),
      ),
      body: Center(
        child: Text('Tela de Privacidade para ${usuario.nomeArtistico}'),
      ),
    );
  }
}
