import 'package:flutter/material.dart';
import '../Models/meal.dart';
import '../Wigdets/meal_item.dart';

class CategoryMealScreen extends StatefulWidget {
  final List<Meal> meals;
  const CategoryMealScreen({super.key, required this.meals});

  @override
  State<CategoryMealScreen> createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  /// defining utility variables
  String catID = '';
  String catTitle = '';
  List<Meal> mealsList = [];
  bool initiated = false;

  @override
  void didChangeDependencies() {
    if (!initiated) {
      final Map<String, String> args =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      catTitle = args['title'] as String;
      catID = args['id'] as String;

      /// we need to make a list filtered by the id
      /// that each category contains only the meals that has its id

      /// explaination: ana 3mlt list mn el meals
      /// 2- hya 3bara 3n subset mn el dummyMeals
      /// 3- m722a condition el hwa
      /// 4- en el categories bta3t el meal el hattl3 lazm tkon nfs
      /// el category bta3 el meal ena ana da5el 3leha
      mealsList = widget.meals.where((meal) {
        return meal.categories.contains(catID);
      }).toList();
      initiated = true;
    }
    super.didChangeDependencies();
  }

  /// utility method to help the user to delete items if he didn't liked it
  void deleteMeal(mealID) {
    setState(() {
      mealsList.removeWhere((meal) => mealID == meal.id);
    });
  }

  /// return empty img and text if there is no more items in the mealsList
  Widget buildEmpty() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          const Text('No More Meals Found'),
          const SizedBox(
            height: 40,
          ),
          Image.asset(
            'assets/imgs/waiting.png',
            fit: BoxFit.contain,
            height: 500,
          )
        ],
      ),
    );
  }

  /// return a list if there are items in the mealsList
  Widget buildNotEmpty() {
    return ListView.builder(
      itemBuilder: (ctx, index) {
        return MealItem(
            deleteMeal: deleteMeal,
            id: mealsList[index].id,
            affordability: mealsList[index].affordability,
            complexity: mealsList[index].complexity,
            duration: mealsList[index].duration,
            imgURL: mealsList[index].imgURL,
            title: mealsList[index].title);
      },
      itemCount: mealsList.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(catTitle),
        ),
        body: Container(
            color: Theme.of(context).colorScheme.background,
            child: mealsList.isEmpty == true ? buildEmpty() : buildNotEmpty()));
  }
}
