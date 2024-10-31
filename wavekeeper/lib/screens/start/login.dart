import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wavekeeper/entity/user.dart';
import 'package:flutter_wavekeeper/navigation/tabbar.dart';
import 'package:flutter_wavekeeper/screens/start/register.dart';


class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<bool> loginWithGet(String email, String password) async {
    var dio = Dio();
    var url = 'http://10.0.2.2:8080/usuario/login';

    try {
      // enviando email e senha como headers
      var response = await dio.get(url, options: Options(headers: {
        'email': email,// Assumindo que emailController é um TextEditingController
        'senha': password, // Assumindo que passwordController é um TextEditingController
      }));

      if (response.statusCode == 200) {
        print('Login bem-sucedido: ${response.data}');
        return true;
      } else {
        print('Erro de login: ${response.statusCode}');
        return false;
      }
    } on DioError catch (e) {
      print('Erro ao fazer login: ${e.message}');
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.purple,
              Colors.black,
              Colors.black,
              Colors.black,
            ],
          ),
        ),
        child: ListView(
          children: <Widget>[
            Column(
              children: [
                const SizedBox(height: 20),
                Image.asset(
                  'assets/logoWave.png',
                  fit: BoxFit.cover,
                  width: 180,
                  height: 180,
                ),
                const Text(
                  'Wave Keeper',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'E-mail',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 10),
                  _buildTextField(emailController, 'Digite seu e-mail', false),
                  const SizedBox(height: 30),
                  const Text(
                    'Senha',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 10),
                  _buildTextField(passwordController, 'Digite sua senha', true),
                  const SizedBox(height: 50),
                  _buildLoginButton(context),
                  const SizedBox(height: 20),
                  _buildForgotPasswordButton(),
                  const SizedBox(height: 10),
                  _buildRegisterButton(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
      TextEditingController controller, String hintText, bool isPassword) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: isPassword
            ? TextInputType.visiblePassword
            : TextInputType.emailAddress,
        obscureText: isPassword,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Este campo não pode estar vazio';
          }
          if (isPassword && value.length < 6) {
            return 'A senha deve ter pelo menos 6 caracteres';
          }
          return null;
        },
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey),
        ),
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(174, 82, 200, 1.0),
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: TextButton(
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            String email = emailController.text;
            String password = passwordController.text;

            bool isAuthenticated = await loginWithGet(email, password);

            if (isAuthenticated) {
              var user = User(
                  id: 1,
                  nome: "FULANO DE TAL",
                  nomeArtistico: "FULANINHO",
                  email: email,
                  senha: password);

              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Tabbar(user: user)));
            }
          }
        },
        child: const Text(
          'Entrar',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }

  Widget _buildForgotPasswordButton() {
    return Container(
      width: double.infinity,
      child: TextButton(
        onPressed: () {},
        child: const Text(
          'Esqueceu a senha?',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }

  Widget _buildRegisterButton(BuildContext context) {
    return Container(
      width: double.infinity,
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RegisterScreen()),
          );
        },
        child: const Text(
          'Inscreva-se',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}
