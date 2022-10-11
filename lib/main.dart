/**
 * 
 * @date 8/10/2022
 * @author Abdelaziz Salah
 */

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'Data/dummy_data.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(

          /// styling the text
          textTheme: const TextTheme(

              /// styling the body in the large formate
              bodyLarge: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          )),

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
                  shadows: [
                    const Shadow(
                        blurRadius: 100,
                        color: Colors.amber,
                        offset: Offset(20, 10))
                  ])

              /// end of the appBarTheme
              )),
      debugShowCheckedModeBanner: false,
      home: const MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.food_bank_rounded),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
        title: Text("MealZawy"),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 30),

        /// children of any list should be the last elements in the widget
        children: [
          ...dummyCategories.map((item) {
            return Text(item.title,
                style: TextStyle(
                    fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                    fontWeight:
                        Theme.of(context).textTheme.bodyLarge?.fontWeight,
                    color: item.color));
          }).toList()
        ],
      ),
    );
  }
}
