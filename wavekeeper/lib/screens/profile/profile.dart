import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  // uma funçao que qnd chamo ela eu consigo navegar, tem que passar o contexto e a rota
  void _navigateToPage(BuildContext context, String route) {
    Navigator.pushNamed(context, route);
  }

  @override
  Widget build(BuildContext context) {
    // youtube em vez de usar botão usou isso, não lembro o vídeo, tem que olhar o histórico
    Widget buildProfileRow(
        IconData icon, String text, TextStyle textStyle, String route) {
      return GestureDetector(
        onTap: () => _navigateToPage(context, route),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
          child: Row(
            children: [
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 16.0, 8.0),
                child: Icon(
                  icon,
                  color: Colors.purple,
                  size: 24.0,
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                  child: Text(
                    text,
                    textAlign: TextAlign.start,
                    style: textStyle,
                  ),
                ),
              ),
              const Icon(
                Icons.chevron_right_rounded,
                color: Colors.purple,
                size: 24.0,
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(135.0),
        child: AppBar(
          backgroundColor: Colors.black,
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.purple, Colors.black],
                stops: [0.0, 0.9],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 150.0,
                    height: 150.0,
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      'assets/logoWave.png',
                      fit: BoxFit.contain,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
                Align(
                  alignment: const Alignment(-1.0, -0.7),
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 25.0,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          centerTitle: true,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Nome Usuário',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Inter Tight',
                      color: Colors.white,
                      fontSize: 20.0,
                      letterSpacing: 0.0,
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  ShaderMask(
                    shaderCallback: (bounds) => const LinearGradient(
                      colors: [Colors.purple, Colors.white],
                    ).createShader(bounds),
                    child: Text(
                      'Nome Artístico',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    'Descrição do usuário, verificar como vai ficar isso se for muito grande ela',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      color: Colors.white,
                      fontSize: 16.0,
                      letterSpacing: 0.0,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.65,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 10.0,
                      color: Colors.purple,
                      offset: Offset(
                        0.0,
                        2.0,
                      ),
                    )
                  ],
                  borderRadius: BorderRadius.circular(14.0),
                  border: Border.all(
                    color: Colors.purple,
                    width: 1.0,
                  ),
                ),
                child: Align(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        16.0, 16.0, 16.0, 0.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 12.0),
                          child: Text(
                            'Perfil',
                            style: TextStyle(
                              fontFamily: 'Inter Tight',
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),

                        Container(
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.purple, width: 1.0),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: buildProfileRow(
                            Icons.library_music,
                            'Suas músicas',
                            const TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              letterSpacing: 0.0,
                            ),
                            '/your_music',
                          ),
                        ),

                        const SizedBox(height: 10.0),

                        Container(
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.purple, width: 1.0),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: buildProfileRow(
                            Icons.monetization_on,
                            'Vendas',
                            const TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              letterSpacing: 0.0,
                            ),
                            '/sales',
                          ),
                        ),

                        const SizedBox(height: 10.0),

                        Container(
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.purple, width: 1.0),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: buildProfileRow(
                            Icons.account_circle,
                            'Conta',
                            const TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              letterSpacing: 0.0,
                            ),
                            '/account',
                          ),
                        ),

                        const SizedBox(height: 10.0),

                        Container(
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.purple, width: 1.0),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: buildProfileRow(
                            Icons.comment_sharp,
                            'Principais dúvidas',
                            const TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              letterSpacing: 0.0,
                            ),
                            '/frequently_asked_questions',
                          ),
                        ),

                        const SizedBox(height: 10.0),

                        Container(
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.purple, width: 1.0),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: buildProfileRow(
                            Icons.privacy_tip,
                            'Privacidade',
                            const TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              letterSpacing: 0.0,
                            ),
                            '/privacy',
                          ),
                        ),

                        const SizedBox(height: 10.0),

                        Container(
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.purple, width: 1.0),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: buildProfileRow(
                            Icons.more_sharp,
                            'Sobre o App',
                            const TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              letterSpacing: 0.0,
                            ),
                            '/about_the_app',
                          ),
                        ),

                        const SizedBox(height: 10.0),

                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: ElevatedButton.icon(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.logout_sharp,
                              size: 15.0,
                            ),
                            label: const Text('Sair'),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              minimumSize: const Size(double.infinity, 40.0),
                              backgroundColor: Colors.purple,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
