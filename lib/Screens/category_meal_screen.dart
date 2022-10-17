import 'package:flutter/material.dart';
import '../Data/dummy_data.dart';
import '../Models/meal.dart';
import '../Wigdets/meal_item.dart';

class CategoryMealScreen extends StatelessWidget {
  const CategoryMealScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, String> args =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final String catTitle = args['title'] as String;
    final catID = args['id'];

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
        body: Container(
          color: Theme.of(context).colorScheme.background,
          child: ListView.builder(
            itemBuilder: (ctx, index) {
              return MealItem(
                  id: mealsList[index].id,
                  affordability: mealsList[index].affordability,
                  complexity: mealsList[index].complexity,
                  duration: mealsList[index].duration,
                  imgURL: mealsList[index].imgURL,
                  title: mealsList[index].title);
            },
            itemCount: mealsList.length,
          ),
        ));
  }
}
