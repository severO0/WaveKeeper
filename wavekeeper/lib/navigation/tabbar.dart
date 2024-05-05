import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:wavekeeper/views/home.dart';
import 'package:wavekeeper/views/profile.dart';
import 'package:wavekeeper/views/business.dart';
import 'package:wavekeeper/views/login.dart';

class Tabbar extends StatefulWidget {
  const Tabbar({super.key});

  @override
  State<Tabbar> createState() => _TabbarState();
}

class _TabbarState extends State<Tabbar> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
            2, 
            BusinessView(),
            ),
          renderView(
            3,
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