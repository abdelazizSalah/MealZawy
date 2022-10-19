/// this file contains the blue print of each category item
import 'package:flutter/material.dart';

class Categories {
  // ignore: prefer_typing_uninitialized_variables
  final id;
  // ignore: prefer_typing_uninitialized_variables
  final title;
  // ignore: prefer_typing_uninitialized_variables
  final color;

  /// this const here is making these objects immutable which
  /// enhances the performance a little bit.
  const Categories(
      {this.color = Colors.orange, required this.id, required this.title});
}
