import 'package:flutter/material.dart';
import 'profile/audio.dart';
import 'profile/edicaoperfil.dart';
import 'profile/minhascompras.dart';
import 'profile/minhasvendas.dart';
import 'profile/privacidade.dart';
import 'profile/usuario.dart';

class ProfileView extends StatelessWidget {

  final Usuario usuario;

  ProfileView({required this.usuario});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('C:\Faculdade\testeWave\logoWave.png.jpg'), 
            ),
            SizedBox(height: 10),
            Text(
              usuario.nomeArtistico,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            _buildBotao('MINHAS COMPRAS', () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TelaMinhasCompras(usuario: usuario)),
              );
            }),
            _buildBotao('MINHAS VENDAS', () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TelaMinhasVendas(usuario: usuario)),
              );
            }),
            _buildBotao('EDITAR PERFIL', () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TelaEdicaoPerfil(usuario: usuario)),
              );
            }),
            _buildBotao('PRIVACIDADE', () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TelaPrivacidade(usuario: usuario)),
              );
            }),
            _buildBotao('ÁUDIO', () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TelaAudio(usuario: usuario)),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildBotao(String texto, VoidCallback onPressed) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(texto),
      ),
    );
  }
}

