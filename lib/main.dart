/**
 * 
 * @date 8/10/2022
 * @author Abdelaziz Salah
 */
import 'package:project/Screens/tabs_screen.dart';

import './Screens/meal_details_screen.dart';
import './Screens/category_meal_screen.dart';
import 'Screens/categories_Screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static String routeName = '/category_route';

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
                onSurface: Colors.orange),
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
                    fontWeight: FontWeight.bold)),

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
                        blurRadius: 250,
                        color: Colors.amber,
                      )
                    ])

                /// end of the appBarTheme
                )),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          MyApp.routeName: (ctx) => const CategoryMealScreen(),
          '/': (ctx) => const TabsScreen(),
          MealDetails.routeName: (ctx) => const MealDetails(),
        },
        // onGenerateRoute: (settings) => MaterialPageRoute(builder: )),
        onUnknownRoute: (settings) {
          return MaterialPageRoute(builder: (ctx) => const CategoriesScreen());
        });
  }
}
