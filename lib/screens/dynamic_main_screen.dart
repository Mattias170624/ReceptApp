//ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:grupp_project/services/firebase/firebase_database.dart';
import 'package:grupp_project/widgets/category_cards.dart';
import 'package:grupp_project/widgets/create_recipe.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter/material.dart';

class DynamicMainScreen extends StatefulWidget {
  @override
  State<DynamicMainScreen> createState() => _DynamicMainScreenState();
}

class _DynamicMainScreenState extends State<DynamicMainScreen> {
  int _pageIndex = 1;

  @override
  void initState() {
    FirebaseDatabase().fetchAllFoods();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GNav(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        color: Colors.white,
        activeColor: Colors.black,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        padding: EdgeInsets.symmetric(vertical: 20.0),
        selectedIndex: 1,
        gap: 10.0,
        onTabChange: (index) => _setNewPage(index),
        tabs: const [
          GButton(icon: Icons.favorite, text: 'Favorites'),
          GButton(icon: Icons.fastfood, text: 'Categories'),
          GButton(icon: Icons.post_add, text: 'New Recepie'),
        ],
      ),
      body: _chooseWhatPage(),
    );
  }

  Widget _chooseWhatPage() {
    switch (_pageIndex) {
      case 0:
        return Center(
          child: Text('Favorite screen'),
        );
      case 1:
        return CategoryCards();
      case 2:
        return AddRecipe();

      default:
        return Center(
          child: Text('Error'),
        );
    }
  }

  void _setNewPage(int newPageIndex) {
    setState(() {
      _pageIndex = newPageIndex;
    });
  }
}
