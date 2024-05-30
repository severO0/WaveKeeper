import 'package:flutter/material.dart';

import 'profile/usuario.dart';

class ProfileView extends StatelessWidget {

 // final Usuario usuario;required this.usuario

  const ProfileView({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(88.0),
        child: AppBar(
          backgroundColor: Colors.black,
          automaticallyImplyLeading: false,
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.purple, Colors.black],
                  stops: [0.2, 1.0],
                  begin: AlignmentDirectional(0.0, -1.0),
                  end: AlignmentDirectional(0, 1.0),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                        width: 90.0,
                        height: 90.0,
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
                            'assets/wavekeeperlogo.jpg',
                            width: 150.0,
                            height: 150.0,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),


                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [ 
                          // Colocar a lógica para puxar os dados do usuário, puxar a foto, nome e nome artístico
                          Text(
                            'Samuel Duarte Gomes',
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0.0,
                                  color: Colors.white
                                ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                            child: Text(
                              'Samueldg_23',
                              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                    color: Colors.white
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          centerTitle: true,
          elevation: 10.0,
        ),
      ),
      body: Container(
        color: Colors.black,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            Text(
              'Conta',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontFamily: 'Readex Pro',
                    letterSpacing: 0.0,
                    color: Colors.white,
                  ),
            ),
            SizedBox(height: 12.0),
            buildButton(context, icon: Icons.monetization_on_rounded, text: 'Minhas Vendas', routeName: '/minhasvendas'),
            buildButton(context, icon: Icons.shopping_cart_rounded, text: 'Minhas Compras', routeName: '/minhascompras'),
            buildButton(context, icon: Icons.privacy_tip_rounded, text: 'Privacidade', routeName: '/privacidade'),
            buildButton(context, icon: Icons.account_circle, text: 'Editar Conta', routeName: '/edicaoperfil'),
            SizedBox(height: 16.0),
            Text(
              'Geral',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontFamily: 'Readex Pro',
                    letterSpacing: 0.0,
                    color: Colors.white,
                  ),
            ),
            SizedBox(height: 12.0),
            buildButton(context, icon: Icons.error_outlined, text: 'Áudio', routeName: '/audio'),
            buildButton(context, icon: Icons.announcement_sharp, text: 'Sobre o APP', routeName: '/sobreApp'),
            SizedBox(height: 32.0),
            Align(
              alignment: AlignmentDirectional.center,
              child: ElevatedButton(
                onPressed: () {
                  print('Saindo ...');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple[500],
                  padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                  textStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontFamily: 'Readex Pro',
                        letterSpacing: 0.0,
                      ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.0),
                  ),
                ),
                child: Text(
                  'Sair',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildButton(BuildContext context, {required IconData icon, required String text, required String routeName}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white, backgroundColor: Colors.purple[500],
          minimumSize: Size(double.infinity, 60),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        onPressed: () {
          Navigator.pushNamed(context, routeName);
        },
        child: Row(
          children: [
            Icon(icon, size: 24),
            SizedBox(width: 12),
            Expanded(
              child: Text(
                text,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontFamily: 'Readex Pro',
                      letterSpacing: 0.0,
                      color: Colors.white,
                    ),
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 18),
          ],
        ),
      ),
    );
  }
}
