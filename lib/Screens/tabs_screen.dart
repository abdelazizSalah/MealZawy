import 'package:flutter/material.dart';
import '../Screens/categories_Screen.dart';
import '../Screens/favorites.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  bool _iconColor1 = false;
  bool _iconColor2 = true;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: const Text('MealZawy'),
            bottom: TabBar(
                onTap: (value) {
                  setState(() {
                    _iconColor1 = !_iconColor1;
                    _iconColor2 = !_iconColor2;
                  });
                },
                indicatorColor: Theme.of(context).colorScheme.secondary,
                tabs: [
                  Tab(
                    icon: Icon(
                      color: _iconColor2 == true ? Colors.amber : Colors.white,
                      Icons.category,
                    ),
                    text: 'Categories',
                    iconMargin: const EdgeInsets.all(4),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.favorite,
                      color: _iconColor1 == true ? Colors.amber : Colors.white,
                    ),
                    text: 'Favorites',
                    iconMargin: const EdgeInsets.all(4),
                  ),
                ]),
          ),
          body: const TabBarView(
            children: [CategoriesScreen(), Favorites()],
          )),
    );
  }
}
