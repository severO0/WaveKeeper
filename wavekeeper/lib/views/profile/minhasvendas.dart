import 'package:flutter/material.dart';
import 'usuario.dart';

class TelaMinhasVendas extends StatelessWidget {
  final Usuario usuario;

  const TelaMinhasVendas({Key? key, required this.usuario}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minhas Vendas'),
      ),
      body: Center(
        child: Text('Tela de Minhas Vendas para ${usuario.nomeArtistico}'),
      ),
    );
  }
}
