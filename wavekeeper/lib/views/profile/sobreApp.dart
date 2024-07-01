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
            const SizedBox(height: 20.0),
            Container(
              margin: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: ExpansionTile(
                title: const Text(
                  'Perguntas frequentes',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'Readex Pro',
                    color: Colors.black,
                  ),
                ),
                children: [
                  ListTile(
                    title: const Text(
                      'Como eu utilizo dos direitos autorais de minhas obras?',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontFamily: 'Readex Pro',
                        color: Colors.black,
                      ),
                    ),
                    subtitle: const Text(
                      'Fundação Biblioteca Nacional – Lei de Direitos Autorais Brasileira indica:\n\n'
                      'Dentro do gov.br:\n\n'
                      'Registre preferencialmente as músicas em partituras – caso não saiba é indicado procurar profissionais da área mas um exemplo de como fazer:\n'
                      '1. Escolha um Software de Notação Musical: Programas como MuseScore, Finale, ou Sibelius são populares e oferecem ferramentas para criar partituras.\n'
                      '2. Defina a Estrutura da Música: Determine o compasso, a tonalidade, e a estrutura (introdução, verso, refrão, etc.).\n'
                      '3. Insira as Notas: Utilize o software para inserir as notas musicais nas linhas e espaços do pentagrama. Você pode usar um teclado MIDI ou inserir manualmente.\n'
                      '4. Adicione Marcas de Expressão e Dinâmica: Inclua indicações de dinâmica (piano, forte, etc.) e outras marcas de expressão (legato, staccato, etc.) conforme necessário.\n'
                      '5. Revise e Edite: Ouça a reprodução da partitura no software e faça ajustes conforme necessário.\n'
                      '6. Salve e Imprima: Quando estiver satisfeito, salve o arquivo e imprima a partitura.\n\n'
                      'Digite a letra da música.\n\n'
                      'A biblioteca exige que esteja tudo em um único arquivo pdf e sem páginas em branco e enumerar as páginas.\n\n'
                      'Entre no google e pesquise por biblioteca nacional e entre no link que seja do gov.br.\n'
                      'Entre na sua conta do gov.br.\n'
                      'Clique no menu, selecione serviços, direitos autorais, solicitações via Portal Gov Br.\n'
                      'Clique em página exclusiva do EDA.\n'
                      'Iniciar.\n'
                      'Clique em tipo de solicitação - registro de obra ou averbação.\n'
                      'Requerimento para registro – digite o título da sua música – escolha o gênero (música, letra e batida) – selecione inédita – quantas páginas tem o pdf – coloque os seus dados e das pessoas que participaram da produção.\n'
                      'Anexe a sua obra em pdf máx 50mb.\n'
                      'Em serviço solicitado escolha registro simples e realize o pagamento.\n'
                      'Clique em concluir – confirme os seus dados e envie a solicitação.\n\n'
                      'O escritório de direitos autorais irá analisar e toda vez que o pedido mudar o seu status eles enviarão um e-mail.',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontFamily: 'Readex Pro',
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


