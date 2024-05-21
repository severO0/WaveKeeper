import 'package:flutter/material.dart';
import 'usuario.dart';

class TelaAudio extends StatelessWidget {
  final Usuario usuario;

  const TelaAudio({Key? key, required this.usuario}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Áudio'),
      ),
      body: Center(
        child: Text('Tela de Áudio para ${usuario.nomeArtistico}'),
      ),
    );
  }
}
