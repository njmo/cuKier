import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/ingredient.dart';

class IngredientCard extends StatelessWidget {
  final Ingredient ingredient;
  final Function onPressed_;
  final Function isAdded_;

  const IngredientCard({super.key, required this.ingredient, required this.onPressed_, required this.isAdded_});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Material(
        child: ListTile(
          shape: const StadiumBorder(
            side: BorderSide(color: Colors.blue, width: 1),
          ),
          leading: Row(
            children: [
              Text('Name : ${ingredient.name}'),
              Text('Carbs : ${ingredient.carbs}'),
              Text('Fat : ${ingredient.fat}'),
            ],
          ),
          trailing: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    icon: isAdded_(ingredient),
                    onPressed: () {
                      onPressed_(ingredient);
                    }),
          ]),
        ),
        ),
      );
  }

}