import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'profile/usuario.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController =
      TextEditingController();
  final TextEditingController userController = TextEditingController();
  final TextEditingController cpfController = TextEditingController();

  final _formKey = GlobalKey<FormState>();


   registerUser() async {
  final dio = Dio();
  final url = "http://10.0.2.2:8080/usuario";
  final data = {
    "nome": userController.text,
    "cpf_cnpj": cpfController.text,
    "email": emailController.text,
    "senha": passwordController.text,
  };

  try {
    final response = await dio.post(url, data: data);
    if (response.statusCode == 200) {
      print('Usuário registrado com sucesso!');
    } else {
      print('Falha ao registrar usuário. Código de status: ${response.statusCode}');
    }
  } on DioError catch (e) {
    print('Erro ao fazer a requisição: ${e.message}');
    if (e.response != null) {
      print('Dados da resposta: ${e.response}');
      print('Código de status da resposta: ');
    }
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120.0),
        child: AppBar(
          backgroundColor: Colors.black,
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 25.0,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text(
            'Wave Keeper',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.purple, Colors.black],
                stops: [0.2, 1.0],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          centerTitle: false,
          elevation: 0.0,
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
              Colors.black,
              Colors.black,
              Colors.black,
              Colors.black,
              Colors.black,
              Colors.black,
              Colors.black,
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
                  hintText: 'Nome de Usuario',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
            ),
            SizedBox(height: 5),Text(
              'CPF',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, top: 1, right: 1),
              decoration: BoxDecoration(
                color: Color.fromARGB(0, 37, 35, 35),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Color.fromARGB(255, 85, 85, 85)),
              ),
              child: TextFormField(
                controller: cpfController,
                keyboardType: TextInputType.name,
                validator: (user) {
                  if (user == null || user.isEmpty) {
                    return 'Digite um CPF valido';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'CPF', // Texto de dica dentro do campo
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
                controller: confirmpasswordController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                validator: (password) {
                  if (password == null || password.isEmpty) {
                    return 'Digite uma senha válida';
                  } else if (password.length < 6) {
                    return 'A senha deve ter pelo menos 6 caracteres';
                  } else if (passwordController.text !=
                      confirmpasswordController.text) {
                    return 'As senhas não correspondem';
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
                onPressed: () async {
                await registerUser();
                },
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: 250,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
              child: TextButton(
                  child: Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        decoration: TextDecoration.underline),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
