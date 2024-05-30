import 'package:flutter/material.dart';

class SobreApp extends StatelessWidget {
  const SobreApp({Key? key}) : super(key: key);

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
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Sobre o Wave Keeper',
          style: TextStyle(
            fontFamily: 'Outfit',
            color: Colors.white,
            fontSize: 20.0,
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 10.0),
          Center(
            child: Container(
              width: 330,
              height: 630,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 8.0, bottom: 12.0),
                      child: Text(
                        'Este trabalho tem como objetivo explicar o desenvolvimento de um aplicativo de música destinado a pequenos e médios produtores, onde eles poderão subir a suas obras no aplicativo e ele irá registrar o seu trabalho, para assim esses criadores possam ter as suas músicas e beats registrados em seu nome de uma maneira mais fácil e consequentemente se protegendo de eventuais plágios. Além disso, o aplicativo funcionará como um mercado online só que voltado a compra e venda de músicas e beats, isso irá auxiliar essas pessoas a aumentaram ou criarem uma renda extra ou ajudará a eles criarem músicas novas, o comércio poderá também ser utilizado por youtubers que estão à procura de trilhas para os seus vídeos.',
                        style: TextStyle(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0.0,
                          color: Colors.black,
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
