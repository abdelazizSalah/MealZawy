/// this file contains the screen of each meal details and how
/// we can prepare each meal

import 'package:flutter/material.dart';
import '../Data/dummy_data.dart';

class MealDetails extends StatelessWidget {
  const MealDetails(
      {super.key, required this.toggleFav, required this.isItFav});
  static const routeName = '/meals-route';
  // ignore: prefer_typing_uninitialized_variables
  final toggleFav;
  // ignore: prefer_typing_uninitialized_variables
  final isItFav;

  /// utility method to avoid duplication of code
  /// responsiple for displaying the container and list widget in side it
  /// @param theme which is the Theme of the widget
  /// @param widChild which is the child to be displayed as the container child
  Widget buildContainer(theme, Widget widChild) {
    return Container(
        height: 200,
        width: 300,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: theme.colorScheme.onSurface)),
        child: widChild);
  }

  /// utility method to avoid duplication of code
  /// responsiple for displaying the section title
  /// @params title which is the title to be shown
  Widget buildSectionTitle(title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(title),
    );
  }

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)?.settings.arguments as String;
    final selectedMeal = dummyMeals.firstWhere(
      (meal) => meal.id == id,
    );

    final theme = Theme.of(context);
    return Scaffold(
      /// deleting Floating button
      floatingActionButton: FloatingActionButton(
        tooltip:
            'if you dislike it then you can remove it temporarily from the meals List',
        backgroundColor: theme.colorScheme.onSurface,
        child: Icon(
          color: theme.colorScheme.onPrimary,
          Icons.delete,
        ),
        onPressed: () {
          /// we can send with the pop any thing we want to be
          /// sent back to the calling widget which helps us to
          /// transfere the data back and forth
          Navigator.of(context).pop(id);
        },
      ),
      appBar: AppBar(
        actions: [
          IconButton(
              tooltip: isItFav(id)
                  ? 'Remove it from favorites!'
                  : 'Add it to favorites!',
              onPressed: () => toggleFav(id),
              icon: Icon(isItFav(id) ? Icons.star : Icons.star_border))
        ],
        title: Text(selectedMeal.title),
      ),
      body: Container(
        color: theme.colorScheme.surface,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Image.network(selectedMeal.imgURL),
              ),
              buildSectionTitle('Ingredients:'),
              buildContainer(
                theme,
                ListView.builder(
                  itemCount: selectedMeal.ingredients.length,
                  itemBuilder: ((context, index) {
                    return Card(
                      color: theme.colorScheme.primary,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            selectedMeal.ingredients[index],
                            style: theme.textTheme.bodySmall,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              buildSectionTitle('Steps:'),
              buildContainer(
                  theme,
                  ListView.builder(
                    itemCount: selectedMeal.steps.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                                child: Text(
                              '# ${index + 1}',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            )),
                            title: Text(
                              selectedMeal.steps[index],
                              style: theme.textTheme.displaySmall,
                            ),
                          ),
                          const Divider(
                            thickness: 2,
                          )
                        ],
                      );
                    },
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
