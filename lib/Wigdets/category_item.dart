import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;

  // ignore: use_key_in_widget_constructors
  const CategoryItem({required this.color, required this.title});

  @override
  Widget build(BuildContext context) {
    final bodyMedium = Theme.of(context).textTheme.bodyMedium;
    print('this is' + bodyMedium.toString());
    return Container(
      /// lets design our own card
      decoration: BoxDecoration(

          /// bt5lelk el alwan ye7slaha tadarog keda
          gradient: LinearGradient(colors: [
            color.withOpacity(.6),
            color.withOpacity(.8),
            color,
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          title,
          style: TextStyle(
              fontSize: bodyMedium?.fontSize,
              fontWeight: bodyMedium?.fontWeight,
              fontFamily: bodyMedium?.fontFamily),
        ),
      ),
    );
  }
}
