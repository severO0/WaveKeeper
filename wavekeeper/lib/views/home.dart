import 'package:flutter/material.dart';
import 'package:wavekeeper/views/album_view.dart';
import 'package:wavekeeper/widgets/album_card.dart';
import 'package:wavekeeper/widgets/song_card.dart';
import 'package:wavekeeper/views/login.dart';
import 'package:wavekeeper/navigation/tabbar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'profile/usuario.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Future<bool> verificarLogin() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString('token');
      if(token != null && token.isNotEmpty) {
        return false;
      }else{
        return true;  
        }
      }
      String saudacao = "";
   @override
  void initState() {
    super.initState();

    verificarLogin().then((token) {
      /*
      if(token) {
        // Busca o usuario logado no banco de dados, ele vai retornar o usuario
        var usuario = Usuario(id: 1, nome: "FULANO DE TAL",  nomeArtistico: "FULANINHO", email: 'email', senha: '1234');
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Tabbar(usuario: usuario)),
        );
      } else {*/
      if( !token) {
        // ADICIONA UMA MENSAGEM FALANDO QUE A SESSAO EXPIROU !!!!
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen()
          ),
        );
      }
    }
    //}
    );
    atualizarSaudacao();
  }
  void atualizarSaudacao() {
    var horaAtual = DateTime.now().hour;
    setState(() {
      if (horaAtual >= 5 && horaAtual < 12) {
        saudacao = "Bom dia";
      } else if (horaAtual >= 12 && horaAtual < 18) {
        saudacao = "Boa tarde";
      } else if (horaAtual >= 18 && horaAtual < 22) {
        saudacao = "Boa noite";
      } else {
        saudacao = "Boa madrugada";
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topLeft,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .6,
            decoration: BoxDecoration(
              color: Colors.purple,
            ),
          ), 
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
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
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 40),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Tocadas Recentemente",
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          Row(
                            children: [
                              Icon(Icons.history),
                              SizedBox(width: 16),
                              Icon(Icons.settings),
                            ],
                          )
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.all(16),
                      child: Row(
                        children: [
                          AlbumCard(
                            label: "Best Mode",
                            image: AssetImage("assets/album7.jpg"),
                          ),
                          SizedBox(width: 16),
                          AlbumCard(
                            label: "Motivation Mix",
                            image: AssetImage("assets/album2.jpg"),
                          ),
                          SizedBox(width: 16),
                          AlbumCard(
                            label: "Top 50-Global",
                            image: AssetImage("assets/top50.jpg"),
                          ),
                          SizedBox(width: 16),
                          AlbumCard(
                            label: "Power Gaming",
                            image: AssetImage("assets/album1.jpg"),
                          ),
                          SizedBox(width: 16),
                          AlbumCard(
                            label: "Top songs - Global",
                            image: AssetImage("assets/album9.jpg"),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 32),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            saudacao,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          SizedBox(height: 16),
                          Row(
                            children: [
                              RowAlbumCard(
                                label: "Musicas ",
                                image: AssetImage("assets/Musicas.jpeg"),
                              ),
                              SizedBox(width: 16),
                              RowAlbumCard(
                                label: "Favoritas",
                                image: AssetImage("assets/nova.jpg"),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          Row(
                            children: [
                              RowAlbumCard(
                                label: "Beats",
                                image: AssetImage("assets/Beats.jpeg"),
                              ),
                              SizedBox(width: 16),
                              RowAlbumCard(
                                label: "Gratuitas",
                                image: AssetImage("assets/nova.jpg"),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          Row(
                            children: [
                              RowAlbumCard(
                                label: "Letras",
                                image: AssetImage("assets/Letras.jpeg"),
                              ),
                              SizedBox(width: 16),
                              RowAlbumCard(
                                label: "Premium",
                                image: AssetImage("assets/nova.jpg"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            "Baseado no que você ouviu recente",
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: Row(
                            children: [
                              SongCard(
                                image: AssetImage("assets/album2.jpg"),
                              ),
                              SizedBox(width: 16),
                              SongCard(
                                image: AssetImage("assets/album6.jpg"),
                              ),
                              SizedBox(width: 16),
                              SongCard(
                                image: AssetImage("assets/album9.jpg"),
                              ),
                              SizedBox(width: 16),
                              SongCard(
                                image: AssetImage("assets/album4.jpg"),
                              ),
                              SizedBox(width: 16),
                              SongCard(
                                image: AssetImage("assets/album5.jpg"),
                              ),
                              SizedBox(width: 16),
                              SongCard(
                                image: AssetImage("assets/album1.jpg"),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            "Recomendados",
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: Row(
                            children: [
                              SongCard(
                                image: AssetImage("assets/album8.jpg"),
                              ),
                              SizedBox(width: 16),
                              SongCard(
                                image: AssetImage("assets/album5.jpg"),
                              ),
                              SizedBox(width: 16),
                              SongCard(
                                image: AssetImage("assets/album6.jpg"),
                              ),
                              SizedBox(width: 16),
                              SongCard(
                                image: AssetImage("assets/album1.jpg"),
                              ),
                              SizedBox(width: 16),
                              SongCard(
                                image: AssetImage("assets/album3.jpg"),
                              ),
                              SizedBox(width: 16),
                              SongCard(
                                image: AssetImage("assets/album10.jpg"),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class RowAlbumCard extends StatefulWidget {
  final AssetImage image;
  final String label;
   RowAlbumCard({
    Key? key,
    required this.image,
    required this.label,
  }) : super(key: key) {
    
  }

  @override
  State<RowAlbumCard> createState() => _RowAlbumCardState();
}

class _RowAlbumCardState extends State<RowAlbumCard> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.circular(4),
        ),
        clipBehavior: Clip.antiAlias,
        child: Row(
          children: [
            Image(
              image: widget.image,
              height: 48,
              width: 48,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 8),
            Text(widget.label)
          ],
        ),
      ),
    );
  }
     
}
