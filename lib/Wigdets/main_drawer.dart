import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Widget buildListTile(IconData icon, String title) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
        child: ListTile(
          leading: Icon(icon),
          title: Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
        ),
      );
    }

    return Drawer(
      width: 270,
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            color: theme.colorScheme.primary,
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Cooking Up!',
                style: TextStyle(
                  color: theme.colorScheme.onSecondary,
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
          buildListTile(Icons.restaurant, 'Meals'),
          buildListTile(Icons.settings, 'Filters'),
        ],
      ),
    );
  }
}
