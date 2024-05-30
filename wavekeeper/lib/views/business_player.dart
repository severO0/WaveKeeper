import 'package:flutter/material.dart';
import 'package:wavekeeper/models/music.dart';
import 'package:wavekeeper/widgets/audio_video_progress_bar.dart'; // Certifique-se de importar a barra de progresso
import 'package:wavekeeper/widgets/lyrics_page.dart'; // Certifique-se de importar a página de letras
import 'package:audioplayers/audioplayers.dart';

class BusinessPlayer extends StatefulWidget {
  const BusinessPlayer({super.key});

  @override
  State<BusinessPlayer> createState() => _BusinessViewState();
}

class _BusinessViewState extends State<BusinessPlayer> {
  final Music music = Music(); // Instância de música para exemplo
  final AudioPlayer player = AudioPlayer(); // Instância de player para exemplo

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: music.songColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Column(
            children: [
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.close, color: Colors.transparent),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 6),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            backgroundImage: music.artistImage != null ? NetworkImage(music.artistImage!) : null,
                            radius: 10,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            music.artistName ?? '-',
                            style: textTheme.bodyLarge?.copyWith(color: Colors.white),
                          )
                        ],
                      )
                    ],
                  ),
                  const Icon(Icons.close, color: Colors.white),
                ],
              ),
              Expanded(
                flex: 2,
                child: Center(
                  child: ArtWorkImage(image: AssetImage("assets/album7.jpg")),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              music.songName ?? '',
                              style: textTheme.titleLarge?.copyWith(color: Colors.white),
                            ),
                            Text(
                              music.artistName ?? '-',
                              style: textTheme.titleMedium?.copyWith(color: Colors.white60),
                            ),
                          ],
                        ),
                        const Icon(Icons.favorite, color: Colors.white),
                      ],
                    ),
                    const SizedBox(height: 16),
                    StreamBuilder(
                      stream: player.onPositionChanged,
                      builder: (context, snapshot) {
                        return ProgressBar(
                          progress: snapshot.data ?? const Duration(seconds: 0),
                          total: music.duration ?? const Duration(minutes: 4),
                          bufferedBarColor: Colors.white38,
                          baseBarColor: Colors.white10,
                          thumbColor: Colors.white,
                          timeLabelTextStyle: const TextStyle(color: Colors.white),
                          progressBarColor: Colors.white,
                          onSeek: (duration) {
                            player.seek(duration);
                          },
                        );
                      },
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LyricsPage(music: music, player: player),
                              ),
                            );
                          },
                          icon: const Icon(Icons.lyrics_outlined, color: Colors.white),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.skip_previous, color: Colors.white, size: 36),
                        ),
                        IconButton(
                          onPressed: () async {
                            if (player.state == PlayerState.playing) {
                              await player.pause();
                            } else {
                              await player.resume();
                            }
                            setState(() {});
                          },
                          icon: Icon(
                            player.state == PlayerState.playing ? Icons.pause : Icons.play_circle,
                            color: Colors.white,
                            size: 60,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.skip_next, color: Colors.white, size: 36),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.loop, color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
class ArtWorkImage extends StatelessWidget { 
    final ImageProvider image;

  const ArtWorkImage({required this.image});
  
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
      ]
    );
  }

}