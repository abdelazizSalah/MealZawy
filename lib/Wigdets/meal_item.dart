import 'package:flutter/material.dart';
import '../Models/meal.dart';

class MealItem extends StatelessWidget {
  final String title;
  final String imgURL;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  const MealItem(
      {super.key,
      required this.affordability,
      required this.complexity,
      required this.duration,
      required this.imgURL,
      required this.title});

  void selectMeal() {}

  String get _affordablilityText {
    switch (affordability) {
      case Affordability.affordable:
        return 'Affordable';
      case Affordability.luxurious:
        return 'Luxurious';
      case Affordability.pricy:
        return 'Pricey';
      default:
        return 'UnKnown';
    }
  }

  String get _complexityText {
    switch (complexity) {
      case Complexity.challenging:
        return 'Challenging';
      case Complexity.hard:
        return 'Hard';
      case Complexity.simple:
        return 'Simple';
      default:
        return 'UnKnown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: selectMeal,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        margin: const EdgeInsets.all(10),
        elevation: 20,
        child: Column(
          children: [
            Stack(children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                child: Image.network(
                  imgURL,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 10,
                right: 10,
                child: Container(
                  width: 350,
                  color: Colors.black54,
                  child: Center(
                    child: Text(
                      title,
                      style: const TextStyle(fontSize: 26, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              )
            ]),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(Icons.timelapse_sharp),
                  Text('$duration mins'),
                  const Icon(Icons.takeout_dining),
                  Text(_complexityText),
                  const Icon(Icons.monetization_on),
                  Text(_affordablilityText)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
