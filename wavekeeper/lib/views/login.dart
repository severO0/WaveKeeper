import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wavekeeper/navigation/tabbar.dart'; // Importe a classe Tabbar.dart aqui
import 'package:http/http.dart' as http;

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Form(
        key:_formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centraliza os widgets verticalmente
          crossAxisAlignment: CrossAxisAlignment.center, // Centraliza os widgets horizontalmente
          children: [
            Container(
              padding: EdgeInsets.all(1.0),
              child: Image.asset(
                'assets/wavekeeperlogo.jpg',
                fit: BoxFit.cover,
                width: 40, // Ajuste o tamanho conforme necessário
                height: 40, // Ajuste o tamanho conforme necessário
              ),
            ),
            Text(
              'Wave Keeper',
              style: TextStyle(fontSize: 16), // Ajuste o tamanho do texto conforme necessário
            ),
          ],
        ),
      ),
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
        validator: (email) {
            if (email == null || email.isEmpty) {
              return 'Digite um e-mail válido';
            }
            return null;
          },
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
        validator: (password) {
            if (password == null || password.isEmpty) {
              return 'Digite uma senha válida';
            }else if (password.length < 6) {
            return 'A senha deve ter pelo menos 6 caracteres';
            }
            return null;
          },
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

        onPressed:  () async {
          // Lógica de autenticação e navegação
          String email = emailController.text;
          String password = passwordController.text;
          if (_formKey.currentState!.validate()) {
            // Processar os dados
          }
          if (email.isNotEmpty && password.isNotEmpty) {
            var url = Uri.parse('https://emanuelseverino.com.br/login');
            var response = await http.post(
              url,
              body: {
                'username': email,
                'password': password,
              }
            );
            print(response.body); // Exibe o corpo da resposta (resposta do servidor
            print(response.statusCode); // Exibe o código de status da resposta
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