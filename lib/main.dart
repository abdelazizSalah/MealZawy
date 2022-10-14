/**
 * 
 * @date 8/10/2022
 * @author Abdelaziz Salah
 */
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
            accentColor: Colors.orange[300],
            primaryColor: Colors.deepPurple[900],
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
                    fontWeight: FontWeight.bold)),

            /// styling the appBar
            appBarTheme: AppBarTheme(

                ///Text Themeing
                toolbarTextStyle: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),

                ///defining the background color
                backgroundColor: Colors.deepPurple[900],

                /// centerlizing the title
                centerTitle: true,

                /// applying some elevations
                elevation: 10,

                /// Styling the title text
                titleTextStyle: TextStyle(
                    color: Colors.orange[300],
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    shadows: const [
                      Shadow(
                          blurRadius: 100,
                          color: Colors.amber,
                          offset: Offset(20, 10))
                    ])

                /// end of the appBarTheme
                )),
        debugShowCheckedModeBanner: false,
        initialRoute: '/ ',
        routes: {
          MyApp.routeName: (ctx) => CategoryMealScreen(),
          '/': (ctx) => const CategoriesScreen()
        });
  }
}
