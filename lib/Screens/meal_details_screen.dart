import 'package:flutter/material.dart';

class MealDetails extends StatelessWidget {
  const MealDetails({super.key});
  static const routeName = '/meals-route';
  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(),
      body: Text("This is $id"),
    );
  }
}
