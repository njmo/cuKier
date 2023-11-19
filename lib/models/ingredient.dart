import 'package:mongo_dart/mongo_dart.dart';

class Ingredient {
   ObjectId? id;
   String? name;
   int? carbs;
   int? fat;
   int? protein;
   int? fiber;
   int? ig;
   int? portion;

   Ingredient() : id = ObjectId();

  Ingredient.fromMap(Map<String, dynamic> map)
      : id = map['_id'],
        name = map['name'],
        carbs = map['carbs'],
        fat = map['fat'],
        protein = map['protein'],
        fiber = map['fiber'],
        ig = map['ig'],
        portion = map['portion'];

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'name': name,
      'carbs': carbs,
      'fat': fat,
      'protein': protein,
      'fiber': fiber,
      'ig' : ig,
      'portion': portion
    };
  }
}