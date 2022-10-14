import 'package:flutter/material.dart';

class CategoryMealScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, String> Args =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final String catTitle = Args['title'] as String;
    final catID = Args['id'];
    return Scaffold(
      appBar: AppBar(
        title: Text(catTitle),
      ),
      body: const Center(child: Text('The Recipes For the Categories')),
    );
  }
}
