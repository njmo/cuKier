import 'package:mongo_dart/mongo_dart.dart';

class IngredientInMeal {
  late final ObjectId? id;
  late final double? grams;
}

class Meal {
  final ObjectId? id;
  final double? date;
  final List<IngredientInMeal>? ingredients;
  final double? wbt;
  final double? ww;
  final int? ig;


  const Meal({ this.id, this.date, this.wbt, this.ww, this.ingredients, this.ig});

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'date': date,
      'ingredients' : ingredients,
      'wbt' : wbt,
      'ww' : ww,
      'ig' : ig
    };
  }
  Meal.fromMap(Map<String, dynamic> map)
      : id = map['_id'],
        date = map['date'],
        wbt = map['wbt'],
        ww = map['ww'],
        ingredients = map['ingredients'],
        ig = map['ig'];
}