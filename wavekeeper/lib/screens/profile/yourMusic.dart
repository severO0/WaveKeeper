import 'package:flutter/material.dart';
import 'package:flutter_wavekeeper/screens/profile/uploadSong.dart';

// Card de Música Favorita (exemplo)
class FavoritaCard extends StatefulWidget {
  final String imagemUrl;
  final String nome;

  const FavoritaCard({
    Key? key,
    required this.imagemUrl,
    required this.nome,
  }) : super(key: key);

  @override
  _FavoritaCardState createState() => _FavoritaCardState();
}

class _FavoritaCardState extends State<FavoritaCard> {
  bool isFavorite = true; 

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 5.0,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple, Colors.black],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              blurRadius: 10.0,
              color: Colors.purple.withOpacity(0.5),
              offset: Offset(
                0.0,
                2.0,
              ),
            ),
          ],
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.all(16.0),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              widget.imagemUrl,
              width: 60.0,
              height: 60.0,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(
            widget.nome,
            style: const TextStyle(color: Colors.white),
          ),
          trailing: IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border, // Ícone baseado no estado
              color: Colors.red,
            ),
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite; 
              });
            },
          ),
        ),
      ),
    );
  }
}

// Card de Música à Venda (exemplo)
class VendaMusicaCard extends StatelessWidget {
  final String imagemUrl;
  final String nome;
  final double preco;

  const VendaMusicaCard({
    Key? key,
    required this.imagemUrl,
    required this.nome,
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
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Colors.purple, Colors.black],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              blurRadius: 10.0,
              color: Colors.purple.withOpacity(0.5),
              offset: Offset(
                0.0,
                2.0,
              ),
            ),
          ],
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UploadSongPage(), 
              ),
            );
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
            title: Text(
              nome,
              style: const TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              'Preço: R\$${preco.toStringAsFixed(2)}',
              style: const TextStyle(color: Colors.white70),
            ),
            trailing: Icon(Icons.edit, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

// Tela YourMusic
class YourMusicPage extends StatelessWidget {
  const YourMusicPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Your Music'),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple, Colors.black],
              stops: [0.3, 1.0],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(16.0),
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              // Seção de Músicas Favoritas
              const Text(
                'Músicas Favoritas',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              // Lista de exemplos de músicas favoritas
              FavoritaCard(
                imagemUrl: 'https://via.placeholder.com/150',
                nome: 'Música Favorita 1',
              ),
              FavoritaCard(
                imagemUrl: 'https://via.placeholder.com/150',
                nome: 'Música Favorita 2',
              ),
              const SizedBox(height: 20),
              // Seção de Músicas à Venda
              const Text(
                'Músicas à Venda',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              // Lista de exemplos de músicas à venda
              VendaMusicaCard(
                imagemUrl: 'https://via.placeholder.com/150',
                nome: 'Música à Venda 1',
                preco: 19.90,
              ),
              VendaMusicaCard(
                imagemUrl: 'https://via.placeholder.com/150',
                nome: 'Música à Venda 2',
                preco: 29.90,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
