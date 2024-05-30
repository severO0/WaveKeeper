import 'package:flutter/material.dart';
import 'package:wavekeeper/views/profile/usuario.dart';

class Privacidade extends StatelessWidget {
  const Privacidade({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
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
          'Privacidade',
          style: TextStyle(
            fontFamily: 'Outfit',
            color: Colors.white,
            letterSpacing: 0.0,
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
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          width: 320,
          height: 550,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(0.0),
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
  bool switchListTileValue1 = true;
  bool switchListTileValue2 = true;
  bool switchListTileValue3 = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Text(
                '   Esse campo será implementado futuramente.',
                style: TextStyle(
                  fontFamily: 'Readex Pro',
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12.0),
        SwitchListTile.adaptive(
          value: switchListTileValue1,
          onChanged: (newValue) {
            setState(() => switchListTileValue1 = newValue);
          },
          title: Text(
            'Conteúdo explícito',
            style: TextStyle(
              fontFamily: 'Readex Pro',
              color: Colors.black,
              fontSize: 18.0,
              fontWeight:  FontWeight.bold
            ),
          ),
          subtitle: Text(
            'Habilita para que conteúdo explícito seja recomendado.',
            style: TextStyle(
              fontFamily: 'Readex Pro',
              color: Colors.black.withOpacity(0.7),
              fontSize: 14.0
            ),
          ),
          tileColor: Colors.white,
          activeColor: Colors.white,
          activeTrackColor: Colors.purple[200],
          dense: false,
          controlAffinity: ListTileControlAffinity.trailing,
          contentPadding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        ),
        SwitchListTile.adaptive(
          value: switchListTileValue2,
          onChanged: (newValue) {
            setState(() => switchListTileValue2 = newValue);
          },
          title: Text(
            'Envio de mensagens',
            style: TextStyle(
              fontFamily: 'Readex Pro',
              color: Colors.black,
              fontSize: 18.0,
              fontWeight:  FontWeight.bold
            ),
          ),
          subtitle: Text(
            'Habilita o recebimento de mensagens de qualquer pessoa',
            style: TextStyle(
              fontFamily: 'Readex Pro',
              color: Colors.black.withOpacity(0.7),
              fontSize: 14.0
            ),
          ),
          tileColor: Colors.white,
          activeColor: Colors.white,
          activeTrackColor: Colors.purple[200],
          dense: false,
          controlAffinity: ListTileControlAffinity.trailing,
          contentPadding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        ),
        SwitchListTile.adaptive(
          value: switchListTileValue3,
          onChanged: (newValue) {
            setState(() => switchListTileValue3 = newValue);
          },
          title: Text(
            'Serviço de Localização',
            style: TextStyle(
              fontFamily: 'Readex Pro',
              color: Colors.black,
              fontSize: 18.0,
              fontWeight:  FontWeight.bold
            ),
          ),
          subtitle: Text(
            'Permite que vejamos a sua localização, isso ajuda a manter o controle dos gastos e mantém você seguro.',
            style: TextStyle(
              fontFamily: 'Readex Pro',
              color: Colors.black.withOpacity(0.7),
              fontSize: 14.0
            ),
          ),
          tileColor: Colors.white,
          activeColor: Colors.white,
          activeTrackColor: Colors.purple[200],
          dense: false,
          controlAffinity: ListTileControlAffinity.trailing,
          contentPadding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        ),
        const SizedBox(height: 24.0),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'Salvar Alterações',
            style: TextStyle(
              fontFamily: 'Readex Pro',
              color: Colors.white,
            ),
          ),
          style: ElevatedButton.styleFrom(
            minimumSize: Size(170.0, 50.0),
            backgroundColor: Colors.purple,
            elevation: 3.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
        ),
      ],
    );
  }
}
