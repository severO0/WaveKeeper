import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wavekeeper/navigation/tabbar.dart';
import 'package:wavekeeper/views/business_player.dart';
import 'package:wavekeeper/widgets/song_card.dart';
import 'package:wavekeeper/views/login.dart';
import 'package:wavekeeper/widgets/album_card.dart';
import 'package:wavekeeper/views/album_view.dart';
import 'package:wavekeeper/views/home.dart';

class BusinessView extends StatefulWidget {
  const BusinessView({super.key});

  @override
  State<BusinessView> createState() => _BusinessViewState();
}

class _BusinessViewState extends State<BusinessView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 20, top: 40, right: 20),
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
            Text(
              "Business Works",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20), // Espaço entre o texto e as imagens
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SongCard(
                      image: AssetImage("assets/album2.jpg"),
                      songName: "Song Name 1",
                      artistName: "Artist 1",
                      price: "R\$ 0.00",
                    ),
                    SizedBox(height: 16),
                    SongCard(
                      image: AssetImage("assets/album6.jpg"),
                      songName: "Song Name 2",
                      artistName: "Artist 2",
                      price: "R\$ 0.00",
                    ),
                    SizedBox(height: 16),
                    SongCard(
                      image: AssetImage("assets/album9.jpg"),
                      songName: "Song Name 3",
                      artistName: "Artist 3",
                      price: "R\$ 0.00",
                    ),
                    SizedBox(height: 16),
                    SongCard(
                      image: AssetImage("assets/album4.jpg"),
                      songName: "Song Name 4",
                      artistName: "Artist 4",
                      price: "R\$ 0.00",
                    ),
                    SizedBox(height: 16),
                    SongCard(
                      image: AssetImage("assets/album5.jpg"),
                      songName: "Song Name 5",
                      artistName: "Artist 5",
                      price: "R\$ 0.00",
                    ),
                    SizedBox(height: 16),
                    SongCard(
                      image: AssetImage("assets/album1.jpg"),
                      songName: "Song Name 6",
                      artistName: "Artist 6",
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
                      builder: (context) => Business_view(),
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