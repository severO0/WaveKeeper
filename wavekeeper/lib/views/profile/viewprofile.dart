import 'package:flutter/material.dart';
import 'package:wavekeeper/views/profile/models/cardMusicas.dart';
import 'package:wavekeeper/views/profile/models/cardLetras.dart';

import '../profile.dart';

class ViewProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120.0),
        child: AppBar(
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
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.purple, Colors.black],
                stops: [0.2, 1.0],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // colocar uma lógica aqui para puxar o nome do usuário
                      Text(
                        'Samuel Duarte Gomes',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0.0,
                              color: Colors.white,
                            ),
                      ),
                      // puxar o nome artístico
                      SizedBox(height: 4.0),
                      Text(
                        'Samueldg_23',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0.0,
                              color: Colors.white,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 16.0),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.black,
                        width: 2.0,
                      ),
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        // puxar a foto do usuário
                        'assets/wavekeeperlogo.jpg',
                        width: 100.0,
                        height: 100.0,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          centerTitle: false,
          elevation: 0.0,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //puxar a descrição, poderá ser usada futuramente pra pesquisar usuários 
            Text(
              'Descrição do usuário vai aqui. Biografia ou descrição pessoal.',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),
            ),
            const SizedBox(height: 20.0),
            Text(
              'Obras',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),
            ),
            Expanded(
              child: ListView(
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
            ),
          ],
        ),
      ),
    );
  }
}
