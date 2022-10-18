import 'package:flutter/material.dart';
import '../Screens/categories_Screen.dart';
import '../Screens/favorites.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _screenIndex = 0;
  final List<Widget> _screens = [const CategoriesScreen(), const Favorites()];

  void _selectScreen(index) {
    setState(() {
      _screenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MealZawy')),
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
