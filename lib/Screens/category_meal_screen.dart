import 'package:flutter/material.dart';
import '../Data/dummy_data.dart';
import '../Models/meal.dart';

class CategoryMealScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, String> Args =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final String catTitle = Args['title'] as String;
    final catID = Args['id'];

    /// we need to make a list filtered by the id
    /// that each category contains only the meals that has its id

    /// explaination: ana 3mlt list mn el meals
    /// 2- hya 3bara 3n subset mn el dummyMeals
    /// 3- m722a condition el hwa
    /// 4- en el categories bta3t el meal el hattl3 lazm tkon nfs
    /// el category bta3 el meal ena ana da5el 3leha
    final List<Meal> mealsList = dummyMeals.where((meal) {
      return meal.categories.contains(catID);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(catTitle),
      ),
      body: Center(
        child: Column(
          children: [
            ...mealsList.map((meal) {
              return Text(meal.title);
            }).toList()
          ],
        ),
      ),
    );
  }
}
