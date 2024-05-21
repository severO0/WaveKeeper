import 'package:flutter/material.dart';
import 'package:wavekeeper/widgets/song_card.dart';
import 'package:wavekeeper/views/login.dart';
import 'package:wavekeeper/views/album_view.dart';
import 'package:wavekeeper/widgets/album_card.dart';

class BusinessView extends StatefulWidget {
  const BusinessView({super.key});

  @override
  State<BusinessView> createState() => _BusinessViewState();
}

class _BusinessViewState extends State<BusinessView> {
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
              color: Color(0xFF1C7A74),
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
                            "Recently Played",
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
                    SizedBox(height: 20), // Add some spacing
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.symmetric(horizontal: 20),
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
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
