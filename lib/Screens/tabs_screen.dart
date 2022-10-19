import 'package:flutter/material.dart';
import '../Wigdets/main_drawer.dart';
import '../Screens/categories_Screen.dart';
import '../Screens/favorites.dart';
import '../Models/meal.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key, required this.favs});
  final List<Meal> favs;
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _screenIndex = 0;
  List<Widget> _screens = [];

  @override
  void initState() {
    _screens = [
      const CategoriesScreen(),
      Favorites(
        favorites: widget.favs,
      )
    ];
    super.initState();
  }

  void _selectScreen(index) {
    setState(() {
      _screenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MealZawy')),
      drawer: const MainDrawer(),
      body: _screens[_screenIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 200,
        showSelectedLabels: true,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.amber,
        currentIndex: _screenIndex,
        type: BottomNavigationBarType.shifting,
        onTap: _selectScreen,
        backgroundColor: Theme.of(context).colorScheme.primary,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).colorScheme.primary,
              icon: const Icon(
                Icons.category,
              ),
              label: 'Categories'),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).colorScheme.error,
              icon: const Icon(
                Icons.favorite,
              ),
              label: 'Favorites'),
        ],
      ),
    );
  }
}
