import 'dart:convert';

import 'package:mongo_dart/mongo_dart.dart';

class Treatments {
  final ObjectId? id;
  final int? glucose;
  final double? date;
  double? result;
  double? totalInsulin;
  double? carbs;

  Treatments({ this.id, this.glucose, this.date, this.result });

  Treatments.fromMap(Map<String, dynamic> map)
      : id = map['_id'],
        glucose = map['glucose'],
        date = map['date']
  {
    var bolusCalculatorResult = jsonDecode(map['bolusCalculatorResult']);

    result = bolusCalculatorResult['basalIOB'];
    totalInsulin = bolusCalculatorResult['totalInsulin'];
    carbs = bolusCalculatorResult['carbs'];
  }
}