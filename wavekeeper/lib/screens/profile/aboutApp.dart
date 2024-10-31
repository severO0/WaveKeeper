import 'package:flutter/material.dart';

class AboutAppPage extends StatelessWidget {
  const AboutAppPage({Key? key}) : super(key: key);

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
        centerTitle: true,
        elevation: 0.0,
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20.0),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'O mercado da música é uma parte significativa da economia mundial, movimentando cerca de 7,1 bilhões de dólares em 2022, com um grande crescimento impulsionado pelos serviços de streaming. No entanto, pequenos e médios produtores de música frequentemente enfrentam desafios para registrar suas obras e proteger seus direitos autorais. Este trabalho tem como objetivo desenvolver um aplicativo que permita a esses produtores subir suas músicas e beats, registrando-os de maneira mais fácil e protegendo-os contra plágios. Além disso, o aplicativo funcionará como um mercado online para a compra e venda de músicas e beats, auxiliando produtores a criarem ou aumentarem sua renda extra. O comércio poderá também ser utilizado por YouTubers em busca de trilhas sonoras para seus vídeos. O desenvolvimento do aplicativo foi realizado utilizando o framework Flutter, devido à sua versatilidade e capacidade de desenvolver aplicações multiplataforma. O Firebase foi utilizado como backend para gerenciamento de banco de dados e autenticação dos usuários. Os resultados esperados incluem um aumento na visibilidade e proteção dos pequenos produtores, proporcionando-lhes uma plataforma para comercializar suas obras e colaborar com outros artistas. A conclusão do trabalho destaca a importância de tecnologias acessíveis e eficazes para o crescimento do mercado musical e a proteção dos direitos autorais na era digital.',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'Readex Pro',
                    letterSpacing: 0.0,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ExpansionTile(
                title: const Text(
                  'Perguntas Frequentes',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'Readex Pro',
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                children: [
                  ListTile(
                    title: const Text(
                      'Como eu utilizo os direitos autorais de minhas obras?',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontFamily: 'Readex Pro',
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: const Text(
                      'A Fundação Biblioteca Nacional – Lei de Direitos Autorais Brasileira indica:\n\n'
                      '1. Registre preferencialmente as músicas em partituras. Procure profissionais da área se necessário. Exemplo de como fazer:\n'
                      '   - Escolha um Software de Notação Musical: MuseScore, Finale, Sibelius.\n'
                      '   - Defina a Estrutura da Música: Compasso, tonalidade, estrutura.\n'
                      '   - Insira as Notas: Utilize o software para inserir as notas.\n'
                      '   - Adicione Marcas de Expressão e Dinâmica: Inclua indicações de dinâmica e marcas de expressão.\n'
                      '   - Revise e Edite: Ouça a reprodução da partitura e faça ajustes.\n'
                      '   - Salve e Imprima: Salve o arquivo e imprima a partitura.\n\n'
                      '2. Digite a letra da música. A biblioteca exige que esteja tudo em um único arquivo PDF, sem páginas em branco e enumerar as páginas.\n\n'
                      '3. Entre no site da biblioteca nacional (gov.br), faça login, selecione serviços, direitos autorais, e siga as instruções para registrar sua obra.\n\n'
                      '4. Em serviço solicitado, escolha registro simples e realize o pagamento. Confirme os dados e envie a solicitação.\n\n'
                      'O escritório de direitos autorais analisará seu pedido e enviará um e-mail sempre que o status mudar.',
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
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
