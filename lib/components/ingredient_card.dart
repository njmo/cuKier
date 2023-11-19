import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/ingredient.dart';

class IngredientCard extends StatelessWidget {
  final Ingredient ingredient;

  const IngredientCard({super.key, required this.ingredient});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: 2,
      child: ListTile(
        leading: Text('${ingredient.name}'),
      ),
    );
  }

}