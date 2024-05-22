import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'profile/usuario.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController userController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  get http => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 99, 99, 99),
        title: Center(
          child: Text(
            'Wave Keeper',
            style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1),
                fontWeight: FontWeight.bold,
                fontSize: 25), // Ajuste o tamanho do texto conforme necessário
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 10, right: 10),
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
            SizedBox(height: 50),
            Text(
              'E-mail',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 5),
            Container(
              padding: EdgeInsets.only(left: 10, top: 1, right: 1),
              decoration: BoxDecoration(
                color: Color.fromARGB(0, 37, 35, 35),
                borderRadius: BorderRadius.circular(10), // Borda arredondada
                border: Border.all(
                    color:
                        const Color.fromARGB(255, 85, 85, 85)), // Borda visível
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
                  hintText:
                      'Digite seu e-mail', // Texto de dica dentro do campo
                  hintStyle:
                      TextStyle(color: Colors.grey), // Estilo do texto de dica
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Nome de Usuario',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 5),
            Container(
              padding: EdgeInsets.only(left: 10, top: 1, right: 1),
              decoration: BoxDecoration(
                color: Color.fromARGB(0, 37, 35, 35),
                borderRadius: BorderRadius.circular(10), // Borda arredondada
                border: Border.all(
                    color: Color.fromARGB(255, 85, 85, 85)), // Borda visível
              ),
              child: TextFormField(
                controller: userController,
                keyboardType: TextInputType.name,
                validator: (user) {
                  if (user == null || user.isEmpty) {
                    return 'Digite um nome de usuario válido';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Nome de Usuario', // Texto de dica dentro do campo
                  hintStyle:
                      TextStyle(color: Colors.grey), // Estilo do texto de dica
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Senha',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.only(left: 10, top: 1, right: 1),
              decoration: BoxDecoration(
                color: Color.fromARGB(0, 37, 35, 35),
                borderRadius: BorderRadius.circular(10), // Borda arredondada
                border: Border.all(
                    color: Color.fromARGB(255, 85, 85, 85)), // Borda visível
              ),
              child: TextFormField(
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                validator: (password) {
                  if (password == null || password.isEmpty) {
                    return 'Digite uma senha válida';
                  } else if (password.length < 6) {
                    return 'A senha deve ter pelo menos 6 caracteres';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Digite sua senha', // Texto de dica dentro do campo
                  hintStyle:
                      TextStyle(color: Colors.grey), // Estilo do texto de dica
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Confirmar Senha',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.only(left: 10, top: 1, right: 1),
              decoration: BoxDecoration(
                color: Color.fromARGB(0, 37, 35, 35),
                borderRadius: BorderRadius.circular(10), // Borda arredondada
                border: Border.all(
                    color: Color.fromARGB(255, 85, 85, 85)), // Borda visível
              ),
              child: TextFormField(
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                validator: (password) {
                  if (password == null || password.isEmpty) {
                    return 'Digite uma senha válida';
                  } else if (password.length < 6) {
                    return 'A senha deve ter pelo menos 6 caracteres';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText:
                      'Confirme sua senha', // Texto de dica dentro do campo
                  hintStyle:
                      TextStyle(color: Colors.grey), // Estilo do texto de dica
                ),
              ),
            ),
            SizedBox(height: 50),
            Container(
              width: 250,
              decoration: BoxDecoration(
                color: Color.fromRGBO(174, 82, 200, 1.0),
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
              child: TextButton(
                child: Text(
                  'Registrar-se',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                onPressed: () async {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
