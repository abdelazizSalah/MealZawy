/// This file contains the blue print for all the Meals objects
enum Complexity { simple, challenging, hard }

enum Affordability { affordable, pricy, luxurious }

class Meal {
  final String id;
  final List<String> categories;
  final List<String> ingredients;
  final List<String> steps;
  final String title;
  final String imgURL;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;
  const Meal({
    required this.id,
    required this.categories,
    required this.imgURL,
    required this.title,
    required this.complexity,
    required this.duration,
    required this.ingredients,
    required this.steps,
    required this.affordability,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian,
  });
}
