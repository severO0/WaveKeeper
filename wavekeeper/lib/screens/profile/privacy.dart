import 'package:flutter/material.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 25.0,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          'Privacidade',
          style: TextStyle(
            fontFamily: 'Outfit',
            color: Colors.white,
            letterSpacing: 0.0,
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
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
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Padding(
            padding: EdgeInsets.all(16.0),
            child: PrivacidadeBody(),
          ),
        ),
      ),
    );
  }
}

class PrivacidadeBody extends StatefulWidget {
  const PrivacidadeBody({Key? key}) : super(key: key);

  @override
  _PrivacidadeBodyState createState() => _PrivacidadeBodyState();
}

class _PrivacidadeBodyState extends State<PrivacidadeBody> {
  bool isProfileVisible = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 12.0),
          child: Text(
            'Controle quem pode ver o seu perfil no aplicativo.',
            style: TextStyle(
              fontFamily: 'Readex Pro',
              color: Colors.black,
              fontSize: 16.0,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SwitchListTile.adaptive(
          value: isProfileVisible,
          onChanged: (newValue) {
            setState(() => isProfileVisible = newValue);
          },
          title: const Text(
            'Mostrar perfil para outros usuários',
            style: TextStyle(
              fontFamily: 'Readex Pro',
              color: Colors.black,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            'Permite que outros usuários encontrem seu perfil no aplicativo.',
            style: TextStyle(
              fontFamily: 'Readex Pro',
              color: Colors.black.withOpacity(0.7),
              fontSize: 14.0,
            ),
          ),
          tileColor: Colors.white,
          activeColor: Colors.white,
          activeTrackColor: Colors.purple[200],
          dense: false,
          controlAffinity: ListTileControlAffinity.trailing,
          contentPadding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        ),
        const SizedBox(height: 24.0),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          style: ElevatedButton.styleFrom(
            minimumSize: Size(170.0, 50.0),
            backgroundColor: Colors.purple,
            elevation: 3.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          child: const Text(
            'Salvar Alterações',
            style: TextStyle(
              fontFamily: 'Readex Pro',
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
