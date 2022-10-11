import 'package:flutter/material.dart';

class Categories {
  final id;
  final title;
  final color;

  /// this const here is making these objects immutable which
  /// enhances the performance a little bit.
  const Categories(
      {this.color = Colors.orange, required this.id, required this.title});
}
