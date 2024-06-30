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
          'Sobre o Wave Keeper',
          style: TextStyle(
            fontFamily: 'Outfit',
            color: Colors.white,
            fontSize: 20.0,
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20.0),
            Center(
              child: Container(
                margin: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 8.0, bottom: 12.0),
                        child: Text(
                          'O mercado da música é uma parte significativa da economia mundial, movimentando cerca de 7,1 bilhões de dólares em 2022, com um grande crescimento impulsionado pelos serviços de streaming. No entanto, pequenos e médios produtores de música frequentemente enfrentam desafios para registrar suas obras e proteger seus direitos autorais. Este trabalho tem como objetivo desenvolver um aplicativo que permita a esses produtores subir suas músicas e beats, registrando-os de maneira mais fácil e protegendo-os contra plágios. Além disso, o aplicativo funcionará como um mercado online para a compra e venda de músicas e beats, auxiliando produtores a criarem ou aumentarem sua renda extra. O comércio poderá também ser utilizado por YouTubers em busca de trilhas sonoras para seus vídeos. O desenvolvimento do aplicativo foi realizado utilizando o framework Flutter, devido à sua versatilidade e capacidade de desenvolver aplicações multiplataforma. O Firebase foi utilizado como backend para gerenciamento de banco de dados e autenticação dos usuários. Os resultados esperados incluem um aumento na visibilidade e proteção dos pequenos produtores, proporcionando-lhes uma plataforma para comercializar suas obras e colaborar com outros artistas. A conclusão do trabalho destaca a importância de tecnologias acessíveis e eficazes para o crescimento do mercado musical e a proteção dos direitos autorais na era digital.',
                          style: TextStyle(
                            fontSize: 18.0,
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
      ),
    );
  }
}
