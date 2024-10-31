import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController = TextEditingController();
  final TextEditingController userController = TextEditingController();
  final TextEditingController cpfController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  // Função de registrar o usuário
  registerUser() async {
    final dio = Dio();
    final url = "http://10.0.2.2:8080/usuario";  // Certifique-se de ajustar o URL para o servidor real
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
        print('Código de status da resposta: ${e.response?.statusCode}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded, color: Colors.white, size: 25.0),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Wave Keeper',
          style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple, Colors.black],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.black, Colors.black],
          ),
        ),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 50),
            _buildTextField('E-mail', emailController, TextInputType.emailAddress, 'Digite um e-mail válido'),
            SizedBox(height: 10),
            _buildTextField('Nome de Usuario', userController, TextInputType.name, 'Digite um nome de usuário válido'),
            SizedBox(height: 10),
            _buildTextField('CPF', cpfController, TextInputType.number, 'Digite um CPF válido'),
            SizedBox(height: 10),
            _buildPasswordField('Senha', passwordController),
            SizedBox(height: 10),
            _buildPasswordField('Confirmar Senha', confirmpasswordController, validator: (value) {
              if (value != passwordController.text) {
                return 'As senhas não correspondem';
              }
              return null;
            }),
            SizedBox(height: 50),
            _buildRegisterButton(),
            SizedBox(height: 10),
            _buildLoginButton(context),
          ],
        ),
      ),
    );
  }

  // Função para criar campo de texto
  Widget _buildTextField(String label, TextEditingController controller, TextInputType type, String validationMessage) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
        SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Color.fromARGB(255, 85, 85, 85)),
          ),
          child: TextFormField(
            controller: controller,
            keyboardType: type,
            validator: (value) => value == null || value.isEmpty ? validationMessage : null,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: label,
              hintStyle: TextStyle(color: Colors.grey),
            ),
          ),
        ),
      ],
    );
  }

  // Função para criar campo de senha
  Widget _buildPasswordField(String label, TextEditingController controller, {String? Function(String?)? validator}) {
    return _buildTextField(label, controller, TextInputType.visiblePassword, 'Digite uma senha válida');
  }

  // Botão de Registrar-se
  Widget _buildRegisterButton() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color.fromRGBO(174, 82, 200, 1.0),
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextButton(
        child: Text('Registrar-se', style: TextStyle(color: Colors.white, fontSize: 18)),
        onPressed: () async {
          await registerUser();
        },
      ),
    );
  }

  // Botão de Login
  Widget _buildLoginButton(BuildContext context) {
    return Container(
      width: double.infinity,
      child: TextButton(
        child: Text(
          'Login',
          style: TextStyle(color: Colors.white, fontSize: 18, decoration: TextDecoration.underline),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
