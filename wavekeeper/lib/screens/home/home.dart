import 'package:flutter/material.dart';
import 'package:flutter_wavekeeper/screens/profile/uploadSong.dart';
import 'package:flutter_wavekeeper/screens/profile/yourMusic.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(135.0),
        child: AppBar(
          backgroundColor: Colors.black,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.purple, Colors.black],
                stops: [0.0, 0.9],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      CircleAvatar(
                        radius: 30.0,
                        backgroundImage: AssetImage('assets/logoWave.png'),
                      ),
                      SizedBox(width: 10.0),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Olá, ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            '+ Nome',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                    icon:
                        const Icon(Icons.add, color: Colors.white, size: 30.0),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UploadSongPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          centerTitle: true,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  children: [
                    _buildCategoryItem(
                        context, 'assets/favoritas.jpg', 'Favoritas'),
                    _buildCategoryItem(
                        context, 'assets/Musicas.png', 'Músicas'),
                    _buildCategoryItem(context, 'assets/Beats.png', 'Beats'),
                    _buildCategoryItem(
                        context, 'assets/Assinatura.png', 'Assinatura'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            _buildMusicSection(context, "Pop"),
            _buildMusicSection(context, "Funk"),
            _buildMusicSection(context, "Rap"),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryItem(
      BuildContext context, String imagePath, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => YourMusicPage(),
                ),
              );
            },
            child: Container(
              width: 85.0,
              height: 85.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMusicSection(BuildContext context, String genre) {
    final List<Map<String, String>> freeSongs = [
      {
        "title": "Música 1",
        "author": "Autor 1",
        "image": "assets/logoWave.png"
      },
      {
        "title": "Música 2",
        "author": "Autor 2",
        "image": "assets/logoWave.png"
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            genre,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Row(
            children: freeSongs.map((song) {
              return Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: SongCard(
                  image: AssetImage(song["image"]!),
                  title: song["title"]!,
                  author: song["author"]!,
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

class SongCard extends StatelessWidget {
  final AssetImage image;
  final String title;
  final String author;

  const SongCard({
    required this.image,
    required this.title,
    required this.author,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                image: image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            author,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
