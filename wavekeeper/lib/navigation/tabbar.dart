import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:wavekeeper/views/home.dart';
import 'package:wavekeeper/views/profile.dart';
import 'package:wavekeeper/views/business.dart';
import 'package:wavekeeper/views/login.dart';
import 'package:wavekeeper/views/profile/usuario.dart';

class Tabbar extends StatefulWidget {
  final Usuario usuario;
  const Tabbar({Key? key, required this.usuario}) : super(key: key);

  @override
  State<Tabbar> createState() => _TabbarState(this.usuario);
}

class _TabbarState extends State<Tabbar> {
  int _selectedTab = 0;
  final Usuario usuario;

  _TabbarState(this.usuario);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      drawer:Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
                // Navegue para outra tela, se necessário
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                // Navegue para outra tela, se necessário
              },
            ),
            ListTile(
              leading: Icon(Icons.contacts),
              title: Text('Contacts'),
              onTap: () {
                Navigator.pop(context);
                // Navegue para outra tela, se necessário
              },
            ),
          ],
        ),
      ),
     bottomNavigationBar: BottomNavigationBar(
      currentIndex: _selectedTab ,
      onTap: (index){
        setState(() {
          this._selectedTab = index;
        });
      },

      items: [
        //NOME DOS BOTOES DA GRID PRINCIPAL
        BottomNavigationBarItem(
          icon: Icon(Icons.home), 
          label: "Home",
          ),
        BottomNavigationBarItem(
          icon: Icon(Icons.attach_money_rounded), 
          label: "Business",
          ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person), 
          label: "Profile",
          ),
        
      ],
    ),
      body: Stack(
        children: [
          renderView(
            0,
             HomeView(),
             ),  
          renderView(
            1, 
            BusinessView(),
            ),
          renderView(
            2,
             ProfileView(),
             ),
        ],
      ),
    );
  }
  Widget renderView(int tabIndex, Widget view) {
    
    return IgnorePointer(
          ignoring: _selectedTab !=tabIndex,
          child:Opacity(
            opacity: _selectedTab == tabIndex? 1 : 0, 
            child:view,
            ),
         );
        
  }
}