import 'package:flutter/material.dart';
import 'package:wavekeeper/views/profile.dart';
import 'package:wavekeeper/views/profile/usuario.dart';


class Audio extends StatefulWidget {

  const Audio({Key? key}) : super(key: key);

  @override
  _AudioState createState() => _AudioState();
}

class _AudioState extends State<Audio> {
  bool? switchListTileValue1 = true;
  bool? switchListTileValue2 = true;
  bool? switchListTileValue3 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 25.0,
          ),
          onPressed: () {
            Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfileView(),
                    ),
            );
          },
        ),
        title: Text(
          'Áudio',
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
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 10.0),
          Center(
            child: Container(
              width: 350,
              height: 600,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              'Esse campo será implementado futuramente.',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SwitchListTile.adaptive(
                      value: switchListTileValue1 ?? true,
                      onChanged: (newValue) {
                        setState(() {
                          switchListTileValue1 = newValue;
                        });
                      },
                      title: Text(
                        'Ajustar qualidade automaticamente',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        'A qualidade do áudio será ajustada quando a sua internet está lenta.',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.7),
                          fontSize: 14.0,
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
                      value: switchListTileValue2 ?? true,
                      onChanged: (newValue) {
                        setState(() {
                          switchListTileValue2 = newValue;
                        });
                      },
                      title: Text(
                        'Exibir os arquivos de áudio/beats deste dispositivo',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        'Adicione arquivos deste dispositivo no Seu Perfil',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.7),
                          fontSize: 14.0,
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
                      value: switchListTileValue3 ?? true,
                      onChanged: (newValue) {
                        setState(() {
                          switchListTileValue3 = newValue;
                        });
                      },
                      title: Text(
                        'Normalizar volume',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        'Define o mesmo nível de volume para todos os arquivos de áudio (Músicas e Beats).',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.7),
                          fontSize: 14.0,
                        ),
                      ),
                      tileColor: Colors.white,
                      activeColor: Colors.white,
                      activeTrackColor: Colors.purple[200],
                      dense: false,
                      controlAffinity: ListTileControlAffinity.trailing,
                      contentPadding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'Salvar Alterações',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(160.0, 50.0),
                          backgroundColor: Colors.purple[300],
                          elevation: 3.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
