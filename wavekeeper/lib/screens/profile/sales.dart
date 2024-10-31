import 'package:flutter/material.dart';
import 'package:flutter_wavekeeper/screens/profile/profile.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

// Card de Venda Falso para testar, esqueci de qual projeto peguei, fazer um genérico para servir para todos
class VendaCard extends StatelessWidget {
  final String imagemUrl;
  final String comprador;
  final double preco;

  const VendaCard({
    Key? key,
    required this.imagemUrl,
    required this.comprador,
    required this.preco,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 5.0,
      child: InkWell(
        onTap: () {
          _showContrato(context);
        },
        child: ListTile(
          contentPadding: const EdgeInsets.all(16.0),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              imagemUrl,
              width: 60.0,
              height: 60.0,
              fit: BoxFit.cover,
            ),
          ),
          title: Text('Comprador: $comprador'),
          subtitle: Text('Preço: R\$${preco.toStringAsFixed(2)}'),
          trailing: Icon(Icons.picture_as_pdf),
        ),
      ),
    );
  }

  void _showContrato(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ContratoPage(),
      ),
    );
  }
}

// Página de Contrato###### Fazer um contrato genérico depois
class ContratoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Contrato de Venda'),
        centerTitle: true,
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
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _generatePdf();
          },
          child: const Text('Baixar Contrato'),
        ),
      ),
    );
  }

  Future<void> _generatePdf() async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Center(
          child: pw.Text(
            'Contrato de Venda\n\nVocê aceitou com sucesso a venda.',
            style: pw.TextStyle(fontSize: 24),
          ),
        ),
      ),
    );

    final pdfData = await pdf.save();

    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdfData,
    );
  }
}

class SalesPage extends StatelessWidget {
  const SalesPage({Key? key}) : super(key: key);

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
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProfileView(),
              ),
            );
          },
        ),
        title: const Text(
          'Minhas Vendas',
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
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _fetchVendas(), // Função que busca as vendas
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text(
                'Nenhuma venda efetuada.',
                style: TextStyle(color: Colors.white), // Cor do texto para aparecer em fundo preto
              ),
            );
          } else {
            final vendas = snapshot.data!;
            return Container(
              margin: const EdgeInsets.all(16.0),
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white, // Fundo branco
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: ListView.builder(
                itemCount: vendas.length,
                itemBuilder: (context, index) {
                  final venda = vendas[index];
                  return VendaCard(
                    imagemUrl: venda['imagemUrl']!,
                    comprador: venda['comprador']!,
                    preco: venda['preco']!,
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }

  Future<List<Map<String, dynamic>>> _fetchVendas() async {
    return [
      {
        'imagemUrl': 'https://via.placeholder.com/150',
        'comprador': 'João Silva',
        'preco': 19.90,
      },
      {
        'imagemUrl': 'https://via.placeholder.com/150',
        'comprador': 'Maria Oliveira',
        'preco': 29.90,
      },
    ];
  }
}
