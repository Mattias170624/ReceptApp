// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  int _pageIndex = 1;

  void _setCurrentPage(int index) {
    setState(() {
      _pageIndex = index;
    });
  }

  Widget _chooseWhatPage() {
    switch (_pageIndex) {
      case 0:
        return HomeScreen();

      default:
        return Center(
          child: Text("VAva"),
        );
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GNav(
        backgroundColor: Colors.black,
        color: Colors.white,
        activeColor: Colors.white,
        gap: 8,
        onTabChange: (index) {},
        tabs: const [
          GButton(icon: Icons.home, text: "Home"),
          GButton(icon: Icons.favorite, text: "Favorite Recipes"),
          GButton(icon: Icons.person, text: "Profile"),
        ],
      ),
    );
  }
}
