import 'package:flutter/material.dart';
import 'package:wavekeeper/views/business_player.dart';

class BusinessView extends StatefulWidget {
  const BusinessView({super.key});

  @override
  State<BusinessView> createState() => _BusinessViewState();
}

class _BusinessViewState extends State<BusinessView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
    preferredSize: Size.fromHeight(80.0),
    child: AppBar(
      backgroundColor: Colors.black,
      automaticallyImplyLeading: false,
      title: const Text(
        'Tela de Negócios',
        style: TextStyle(
          color: Colors.white,
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple, Colors.black],
            stops: [0.1, 1.0],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),
      centerTitle: false,
      elevation: 0.0,
    ),
  ),
      body: Container(
        padding: EdgeInsets.only(left: 20, top: 10, right: 20),
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.topLeft,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black.withOpacity(0),
              Colors.black.withOpacity(.9),
              Colors.black.withOpacity(1),
              Colors.black.withOpacity(1),
              Colors.black.withOpacity(1),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20), // Espaço entre o texto e as imagens
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SongCard(
                      image: AssetImage("assets/album2.jpg"),
                      songName: "Nome da música",
                      artistName: "Nome do Artista",
                      price: "R\$ 0.00",
                    ),
                    SizedBox(height: 16),
                    SongCard(
                      image: AssetImage("assets/album6.jpg"),
                      songName: "Nome da música",
                      artistName: "Nome do Artista",
                      price: "R\$ 0.00",
                    ),
                    SizedBox(height: 16),
                    SongCard(
                      image: AssetImage("assets/album9.jpg"),
                      songName: "Nome da música",
                      artistName: "Nome do Artista",
                      price: "R\$ 0.00",
                    ),
                    SizedBox(height: 16),
                    SongCard(
                      image: AssetImage("assets/album4.jpg"),
                      songName: "Nome da música",
                      artistName: "Nome do Artista",
                      price: "R\$ 0.00",
                    ),
                    SizedBox(height: 16),
                    SongCard(
                      image: AssetImage("assets/album5.jpg"),
                      songName: "Nome da música",
                      artistName: "Nome do Artista",
                      price: "R\$ 0.00",
                    ),
                    SizedBox(height: 16),
                    SongCard(
                      image: AssetImage("assets/album1.jpg"),
                      songName: "Nome da música",
                      artistName: "Nome do Artista",
                      price: "R\$ 0.00",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SongCard extends StatelessWidget {
  final ImageProvider image;
  final String songName;
  final String artistName;
  final String price;

  const SongCard({
    required this.image,
    required this.songName,
    required this.artistName,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 100, // Ajuste a largura conforme necessário
          height: 100, // Ajuste a altura conforme necessário
          decoration: BoxDecoration(
            image: DecorationImage(
              image: image,
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        SizedBox(width: 16), // Espaço entre a imagem e o texto
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                songName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                artistName,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ),
              Text(
                price,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BusinessPlayer(),
                    ),
                  );
                  
                },
                child: Text("Negociar Direitos"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}