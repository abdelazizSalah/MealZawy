import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Wigdets/category_item.dart';
import '../Data/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 248, 244, 222),
      child: GridView(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 15),

        /// children of any list should be the last elements in the widget
        children: dummyCategories.map((catItem) {
          return CategoryItem(color: catItem.color, title: catItem.title);
        }).toList(),
      ),
    );
  }
}