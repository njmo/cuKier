import 'dart:convert';

import 'package:mongo_dart/mongo_dart.dart';

class Recipe {
  final ObjectId? id;
  final Map<String, dynamic>? ingredientPortion;
  final int carbs;
  final int fat;
  final int protein;
  final int fiber;
  final int ig;

  Recipe(this.carbs, this.fat, this.protein, this.fiber, this.ig, { this.id, this.ingredientPortion });

  Recipe.fromMap(Map<String, dynamic> map)
      : id = map['_id'],
        ingredientPortion = jsonDecode(map['ingredient_portion']),
        carbs = map['carbs'],
        fat = map['fat'],
        protein = map['protein'],
        fiber = map['fiber'],
        ig = map['ig'];

  Map<String, dynamic> toMap() {
    return {
      '_id' : id,
      'ingredientPortion' : jsonEncode(ingredientPortion),
      'carbs' : carbs,
      'fat' : fat,
      'protein' : protein,
      'fiber' : fiber,
      'ig' : ig,
    };
  }
}