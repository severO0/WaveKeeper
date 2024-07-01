import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wavekeeper/navigation/tabbar.dart';
import 'package:http/http.dart' as http;
import 'package:wavekeeper/views/register.dart';
import 'profile/usuario.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var isAuthenticated = false;

  Future<bool> loginWithGet(email, password) async {
    var dio = Dio();
    // Substitua 'http://10.0.2.2:8080/login' pelo endpoint da sua API de login
    var url = 'http://10.0.2.2:8080/usuario/login';

    try {
      // Enviando 'email' e 'password' como headers
      var response = await dio.get(url,
          options: Options(headers: {
            'email':
                email, // Assumindo que emailController é um TextEditingController
            'senha':
                password, // Assumindo que passwordController é um TextEditingController
          }));

      if (response.statusCode == 200) {
        // Processa a resposta

        print('Login bem-sucedido: ${response.data}');
        return true;
      } else {
        // Trata respostas de erro
        print('Erro de login: ${response.statusCode}');
        return false;
      }
    } on DioError catch (e) {
      // Trata erros de requisição
      print('Erro ao fazer login: ${e.message}');
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.topLeft,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.purple,
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
          Container(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  padding: EdgeInsets.all(1.0),
                  child: Image.asset(
                    'assets/wavekeeperlogo.jpg',
                    fit: BoxFit.cover,
                    width: 180,
                    height: 180,
                  ),
                ),
                const Text(
                  'Wave Keeper',
                  style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontFamily: '',
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
              ],
            ),
          ),
          const Text(
            'E-mail ou nome de usuário',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.only(left: 10, top: 1, right: 1),
            decoration: BoxDecoration(
              color: const Color.fromARGB(0, 37, 35, 35),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color.fromARGB(255, 85, 85, 85)),
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
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Digite seu e-mail',
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          SizedBox(height: 30),
          const Text(
            'Senha',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.only(left: 10, top: 1, right: 1),
            decoration: BoxDecoration(
              color: const Color.fromARGB(0, 37, 35, 35),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color.fromARGB(255, 85, 85, 85)),
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
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Digite sua senha',
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          const SizedBox(height: 50),
          Container(
            width: 250,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(174, 82, 200, 1.0),
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
            ),
            child: TextButton(
              child: const Text(
                'Entrar',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              onPressed: () async {
                /*
                // Lógica de autenticação e navegação
                String email = emailController.text;
                String password = passwordController.text;

                if (_formKey.currentState!= null && _formKey.currentState!.validate()) {
                  // RECUPERAR O USUARIO QUE ESTA LOGADO PELO TOKEN
                  var url = Uri.parse('https://dummyjson.com/auth/me');

                  var response = await http.get(url, headers: {
                    'Authorization': 'token que esta logado',
                  });

                  print(response
                      .body); // Exibe o corpo da resposta (resposta do servidor
                  print(response
                      .statusCode); // Exibe o código de status da resposta
                      
                  var usuario = Usuario(
                      id: 1,
                      nome: "FULANO DE TAL",
                      nomeArtistico: "FULANINHO",
                      email: email,
                      senha: password);
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Tabbar(usuario: usuario)));
                }
                if (email.isNotEmpty && password.isNotEmpty) {
                  var url = Uri.parse('https://dummyjson.com/auth/login');

                  var response = await http.post(url, body: {
                    'username': email,
                    'password': password,
                    'expiresInMins': '30'
                  });

                  print(response
                      .body); // Exibe o corpo da resposta (resposta do servidor
                  print(response
                      .statusCode); // Exibe o código de status da resposta



                  // Primeiro converte para um Map<k, v>
                  final Map parsed = jsonDecode(response.body);

                  // Adicione sua lógica de autenticação aqui
                  bool isAuthenticated =
                      true; // Simulando autenticação bem-sucedida
                  var usuario = Usuario(
                      id: parsed['id'],
                      nome: "FULANO DE TAL",
                      nomeArtistico: "FULANINHO",
                      email: email,
                      senha: password);

                  if () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Tabbar(usuario: usuario)));
                  }




                }

                */
                var email = emailController.text;
                var password = passwordController.text;
                var usuario = Usuario(
                    id: 1,
                    nome: "FULANO DE TAL",
                    nomeArtistico: "FULANINHO",
                    email: email,
                    senha: password);

                // Aguarda o resultado da função loginWithGet
                bool isAuthenticated = await loginWithGet(email, password);

                if (isAuthenticated) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Tabbar(usuario: usuario)));
                }
              },
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: 250,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: const BorderRadius.all(
                Radius.circular(30),
              ),
              border: Border.all(
                color: Colors.grey,
              ),
            ),
            child: TextButton(
              child: const Padding(
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
          SizedBox(height: 10),
          Container(
            width: 250,
            decoration: const BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
            ),
            child: TextButton(
                child: const Text(
                  'Inscreva-se',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      decoration: TextDecoration.underline),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegisterScreen()));
                }),
          ),
        ],
      ),
    ));
  }
}
