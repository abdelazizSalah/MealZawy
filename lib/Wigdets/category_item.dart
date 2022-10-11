import 'package:flutter/material.dart';
import '../Screens/category_meal_screen.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final String id;
  final Color color;

  // ignore: use_key_in_widget_constructors
  const CategoryItem(
      {required this.color, required this.title, required this.id});

  void SelectCategory(BuildContext ctx) {
    Navigator.of(ctx)
        .pushNamed('/category_route', arguments: {'title': title, 'id': id});
  }

  @override
  Widget build(BuildContext context) {
    final bodyMedium = Theme.of(context).textTheme.bodyMedium;
    return InkWell(
      /// this radius should be equal to the radius of the child
      borderRadius: BorderRadius.circular(15),
      onTap: () => SelectCategory(context),
      splashColor: Theme.of(context).accentColor,
      child: Container(
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
      ),
    );
  }
}
