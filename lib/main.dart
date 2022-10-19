/**
 * 
 * @date 8/10/2022
 * @author Abdelaziz Salah
 */
import 'package:project/Data/dummy_data.dart';

import './Screens/filters_screen.dart';
import './Screens/tabs_screen.dart';
import './Screens/meal_details_screen.dart';
import './Screens/category_meal_screen.dart';
import './Screens/categories_Screen.dart';
import 'Models/meal.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  static String routeName = '/category_route';

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> myMeals = dummyMeals;

  Map<String, bool> filter = {
    'Vegiterian': false,
    'Vegan': false,
    'Gluten': false,
    'Lactose': false,
  };

  void saveFilters(Map<String, bool> newFilters) {
    setState(() {
      filter = newFilters;

      // exclute the meals
      myMeals = dummyMeals.where((meal) {
        if (!meal.isGlutenFree && filter['Gluten'] as bool) return false;
        if (!meal.isLactoseFree && filter['Lactose'] as bool) return false;
        if (!meal.isVegetarian && filter['Vegiterian'] as bool) return false;
        if (!meal.isVegan && filter['Vegan'] as bool) return false;
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            // color scheme bt5lek t2dr enk t3ml alwan mokhtalefa kter gedan
            colorScheme: const ColorScheme(
                brightness: Brightness.light,
                primary: Color.fromARGB(255, 51, 29, 150),
                onPrimary: Color.fromARGB(255, 255, 183, 77),
                secondary: Colors.amber,
                onSecondary: Colors.orange,
                error: Color.fromARGB(255, 7, 50, 145),
                onError: Colors.orange,
                background: Color.fromARGB(255, 249, 243, 236),
                onBackground: Colors.orange,
                surface: Color.fromARGB(50, 169, 144, 239),
                onSurface: Color.fromARGB(255, 41, 97, 182)),
            fontFamily: 'Raleway',

            /// styling the text
            textTheme: const TextTheme(
              /// styling the body in the large formate
              bodyLarge: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              bodyMedium: TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold),
              bodySmall: TextStyle(
                fontSize: 20,
                shadows: [
                  Shadow(
                    blurRadius: 100,
                    color: Colors.black87,
                  )
                ],
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
                color: Colors.amber,
              ),
              displaySmall: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Raleway',
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
              displayMedium: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
                color: Colors.amber,
              ),
              displayLarge: TextStyle(
                fontSize: 16,
                fontFamily: 'Raleway',
                // fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),

            /// styling the appBar
            appBarTheme: const AppBarTheme(

                ///Text Themeing
                toolbarTextStyle: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),

                /// centerlizing the title
                centerTitle: true,

                /// applying some elevations
                elevation: 10,

                /// Styling the title text
                titleTextStyle: TextStyle(
                    color: Color.fromARGB(255, 255, 183, 77),
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                          blurRadius: 100,
                          color: Colors.amber,
                          offset: Offset(10, 10))
                    ])

                /// end of the appBarTheme
                )),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (ctx) => const TabsScreen(),
          MyApp.routeName: (ctx) => CategoryMealScreen(meals: myMeals),
          MealDetails.routeName: (ctx) => const MealDetails(),
          FiltersScreen.routeName: (ctx) => FiltersScreen(
                filters: filter,
                saveFilters: saveFilters,
              ),
        },
        // onGenerateRoute: (settings) => MaterialPageRoute(builder: )),
        onUnknownRoute: (settings) {
          return MaterialPageRoute(builder: (ctx) => const CategoriesScreen());
        });
  }
}
