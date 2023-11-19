import 'dart:convert';

import 'package:mongo_dart/mongo_dart.dart';

class Dose {
  final ObjectId? doseId;
  final ObjectId? mealId;

  Dose({this.doseId, this.mealId});

  Map<String, dynamic> toMap() {
    return {
      'dose_id' : doseId,
      'meal_id' : mealId,
    };
  }
}