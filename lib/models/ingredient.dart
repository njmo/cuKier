import 'package:mongo_dart/mongo_dart.dart';

class Ingredient {
  final ObjectId? id;
  final String? name;
  final int? carbs;
  final int? fat;
  final int? protein;
  final int? fiber;

  const Ingredient(this.name, this.carbs, this.fat, this.protein, this.fiber, this.id);

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'date': date,
      '_id_wizard': wizardId
    };
  }
  Meal.fromMap(Map<String, dynamic> map)
      : id = map['_id'],
        date = map['date'],
        wizardId = map['wizard_id'];
}