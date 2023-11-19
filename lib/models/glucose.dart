import 'package:mongo_dart/mongo_dart.dart';

class Glucose {
  final ObjectId? id;
  final double? date;
  final int? sgv;
  final double? delta;
  final String? direction;

  const Glucose({ this.id, this.date, this.sgv,
                  this.delta, this.direction});

  Glucose.fromMap(Map<String, dynamic> map)
      : id = map['_id'],
        date = map['date'],
        sgv = map['sgv'],
        delta = map['delta'],
        direction = map['direction'];
}