import 'package:flutter/material.dart';
import 'package:wavekeeper/views/profile/models/cardBeats.dart';
import 'package:wavekeeper/views/profile/models/cardLetras.dart';
import 'package:wavekeeper/views/profile/models/cardMusicas.dart';
import 'package:wavekeeper/views/profile/usuario.dart';

import '../profile.dart';


class MinhasCompras extends StatelessWidget {
  
  const MinhasCompras({Key? key}) : super(key: key);

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
          'Minhas Compras',
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 10), 
          Center(
            child: Container(
              width: 350,
              height: 650,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: DefaultTabController(
                length: 3,
                child: Column(
                  children: [
                    const TabBar(
                      labelStyle: TextStyle(
                        fontFamily: 'Readex Pro',
                        letterSpacing: 0.0,
                      ),
                      unselectedLabelStyle: TextStyle(),
                      labelColor: Colors.purple,
                      unselectedLabelColor: Colors.grey,
                      indicatorColor: Colors.purple,
                      tabs: [
                        Tab(text: 'Músicas'),
                        Tab(text: 'Beats'),
                        Tab(text: 'Letras'),
                      ],
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: SizedBox(
                          height: 600,
                          child: TabBarView(
                            children: [
                              ListView(
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.vertical,
                                children: [
                                  CardMusica(),
                                  CardMusica(),
                                  CardMusica(),
                                  CardMusica(),
                                  CardLetras(),
                                ],
                              ),
                              ListView(
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.vertical,
                                children: [
                                  CardBeats(),
                                  CardBeats(),
                                  CardBeats(),
                                ],
                              ),
                              ListView(
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.vertical,
                                children: [
                                  CardLetras(),
                                  CardLetras(),
                                  CardLetras(),
                                  CardLetras(),
                                  CardLetras(),
                                ],
                              ),
                            ],
                          ),
                        ),
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
