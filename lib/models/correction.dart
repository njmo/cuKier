import 'dart:convert';

import 'package:cu_kier/models/meal.dart';
import 'package:mongo_dart/mongo_dart.dart';

class Correction {
  final ObjectId? id;
  final ObjectId? mealId;
  final double? date;
  final String? type;
  final double? amount;
  final IngredientInMeal? ingredient;

  Correction({this.id, this.mealId, this.date, this.type, this.amount, this.ingredient});

  Map<String, dynamic> toMap() {
    return {
      '_id' : id,
      'meal_id' : mealId,
      'date' : date,
      'type' : type,
      'amount' : amount,
      'ingredient' : ingredient
    };
  }
}