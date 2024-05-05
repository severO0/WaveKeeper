import 'package:flutter/material.dart';
import 'package:wavekeeper/navigation/tabbar.dart'; // Importe a classe Tabbar.dart aqui

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wave Keeper'),
        backgroundColor: Colors.grey[700],
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 20, top: 240, right: 20),
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.topLeft,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF616161),
              Color(0xFF212121),
              Color(0xFF212121),
              Color(0xFF212121),
              Color(0xFF212121),
              Color(0xFF212121),
              Color(0xFF212121),
            ],
          ),
        ),
        child: ListView(
  children: <Widget>[
    Text(
      'E-mail ou nome de usuário',
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 15,
      ),
    ),
    SizedBox(height: 10),
    
    Container(
      padding: EdgeInsets.only(left: 10, top: 1, right:1),
      decoration: BoxDecoration(
        color: Color.fromARGB(0, 37, 35, 35),
        borderRadius: BorderRadius.circular(10), // Borda arredondada
        border: Border.all(color: const Color.fromARGB(255, 85, 85, 85)), // Borda visível
      ),
      child: TextFormField(
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Digite seu e-mail', // Texto de dica dentro do campo
          hintStyle: TextStyle(color: Colors.grey), // Estilo do texto de dica
        ),
      ),
    ),
    SizedBox(height: 30), // Espaço entre os campos
    Text(
      'Senha',
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 15,
      ),
    ),
    SizedBox(height: 10),
    
    Container(
      padding: EdgeInsets.only(left: 10, top: 1, right:1),
      decoration: BoxDecoration(
        color: Color.fromARGB(0, 37, 35, 35),
        borderRadius: BorderRadius.circular(10), // Borda arredondada
        border: Border.all(color:Color.fromARGB(255, 85, 85, 85)), // Borda visível
      ),
      child: TextFormField(
        controller: passwordController,
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Digite sua senha', // Texto de dica dentro do campo
          hintStyle: TextStyle(color: Colors.grey), // Estilo do texto de dica
        ),
      ),
    ),
    SizedBox(height: 50),
    Container(
      width: 150,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      child: TextButton(
        child: Text(
          'Entrar',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        onPressed: () {
          // Lógica de autenticação e navegação
          String email = emailController.text;
          String password = passwordController.text;

          if (email.isNotEmpty && password.isNotEmpty) {
            // Adicione sua lógica de autenticação aqui
            bool isAuthenticated = true; // Simulando autenticação bem-sucedida

            if (isAuthenticated) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Tabbar()),
              );
            }
          }
        },
      ),
    ),
    SizedBox(height: 20),
    Container(
      width: 250,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
        border: Border.all(
          color: Colors.grey,
        ),
      ),
      child: TextButton(
        child: Padding(
          padding: EdgeInsets.all(1.0),
          child: Text(
            'Esqueceu a senha?',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
        onPressed: () {},
      ),
    ),
  ],
),


      ),
    );
  }
}