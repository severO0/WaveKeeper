import 'package:flutter/material.dart';
import 'usuario.dart';

class TelaEdicaoPerfil extends StatelessWidget {
  final Usuario usuario;

  const TelaEdicaoPerfil({Key? key, required this.usuario}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Perfil'),
      ),
      body: Center(
        child: Text('Tela de Edição de Perfil para ${usuario.nomeArtistico}'),
      ),
    );
  }
}
