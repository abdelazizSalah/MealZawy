/// this file contains the screen of the categories and how I want to show them
import 'package:flutter/material.dart';
import '../Wigdets/category_item.dart';
import '../Data/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      color: theme.colorScheme.background,
      child: GridView(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 15),

        /// children of any list should be the last elements in the widget
        children: dummyCategories.map((catItem) {
          return CategoryItem(
            color: catItem.color,
            title: catItem.title,
            id: catItem.id,
          );
        }).toList(),
      ),
    );
  }
}
