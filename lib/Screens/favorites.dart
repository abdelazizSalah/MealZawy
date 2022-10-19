import 'package:flutter/material.dart';
import '../Models/meal.dart';
import '../Wigdets/meal_item.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key, required this.favorites});

  final List<Meal> favorites;
  @override
  Widget build(BuildContext context) {
    return favorites.isEmpty
        ? Container(
            color: Theme.of(context).colorScheme.background,
            padding: const EdgeInsets.symmetric(vertical: 30),
            width: double.infinity,
            child: Column(
              children: [
                const Center(
                  child: Text("You have no favorites yet - Start Add some!"),
                ),
                const SizedBox(
                  height: 20,
                ),
                Image.asset(
                  'assets/imgs/waiting.png',
                  height: 500,
                  fit: BoxFit.contain,
                )
              ],
            ),
          )
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return MealItem(
                  deleteMeal: () {},
                  id: favorites[index].id,
                  affordability: favorites[index].affordability,
                  complexity: favorites[index].complexity,
                  duration: favorites[index].duration,
                  imgURL: favorites[index].imgURL,
                  title: favorites[index].title);
            },
            itemCount: favorites.length,
          );
  }
}
