import 'package:flutter/material.dart';
import 'package:flutter_wavekeeper/entity/user.dart';
import 'package:flutter_wavekeeper/screens/business/business.dart';
import 'package:flutter_wavekeeper/screens/home/home.dart';
import 'package:flutter_wavekeeper/screens/profile/profile.dart';


class Tabbar extends StatefulWidget {
  final User user;
  const Tabbar({Key? key, required this.user}) : super(key: key);

  @override
  State<Tabbar> createState() => _TabbarState(this.user);
}

class _TabbarState extends State<Tabbar> {
  int _selectedTab = 0;
  final User user;

  _TabbarState(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
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
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.contacts),
              title: Text('Contacts'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        backgroundColor: Colors.black, // Fundo preto
        selectedItemColor: Colors.white, // Cor do ícone e texto selecionado
        unselectedItemColor: Colors.grey, // Cor do ícone e texto não selecionado
        onTap: (index) {
          setState(() {
            _selectedTab = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Início",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money_rounded),
            label: "Negócios",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Perfil",
          ),
        ],
      ),
      body: IndexedStack(
        index: _selectedTab,
        children: [
          HomeView(),
          BusinessView(),
          ProfileView(),
        ],
      ),
    );
  }
}
