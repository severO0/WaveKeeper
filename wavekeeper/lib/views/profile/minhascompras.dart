import 'package:flutter/material.dart';
import 'usuario.dart';

class TelaMinhasCompras extends StatelessWidget {
  final Usuario usuario;

  const TelaMinhasCompras({Key? key, required this.usuario}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minhas Compras'),
      ),
      body: Center(
        child: Text('Tela de Minhas Compras para ${usuario.nomeArtistico}'),
      ),
    );
  }
}
