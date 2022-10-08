/**
 * 
 * @date 8/10/2022
 * @author Abdelaziz Salah
 */

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.deepPurple[900],
              centerTitle: true,
              elevation: 10,
              titleTextStyle: TextStyle(
                  color: Colors.orange[300],
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                        blurRadius: 100,
                        color: Colors.amber,
                        offset: Offset(20, 10))
                  ]))),
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.food_bank_rounded),
          onPressed: () => Scaffold.of(ctx).openDrawer(),
        ),
        title: Text("MealZawy"),
      ),
      body: Container(
        child: Text('Hello World!'),
      ),
    );
  }
}
