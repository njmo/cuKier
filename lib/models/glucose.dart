import 'package:mongo_dart/mongo_dart.dart';

class Glucose {
  final ObjectId? id;
  final String? device;
  final double? date;
  final String? dateString;
  final int? sgv;
  final double? delta;
  final String? direction;
  final String? type;
  final double? filtered;
  final double? unfiltered;
  final int? rssi;
  final int? noise;
  final String? sysTime;
  final int? utcOffset;

  const Glucose({ this.id,  this.device, this.date, this.dateString , this.sgv,
                  this.delta, this.direction, this.type, this.filtered, this.unfiltered,
                  this.rssi, this.noise, this.sysTime, this.utcOffset});

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'device': device,
      'date': date,
      'dateString': dateString,
      'sgv': sgv,
      'delta' : delta,
      'direction' : direction,
      'type' : type,
      'filtered' : filtered,
      'unfiltered' : unfiltered,
      'rssi' : rssi,
      'noise' : noise,
      'sysTime' : sysTime,
      'utcOffset' : utcOffset
    };
  }

  Glucose.fromMap(Map<String, dynamic> map)
      : id = map['_id'],
        device = map['device'],
        date = map['date'],
        dateString = map['dateString'],
        sgv = map['sgv'],
        delta = map['delta'],
        direction = map['direction'],
        type = map['type'],
        filtered = map['filtered'],
        unfiltered= map['unfiltered'],
        rssi = map['rssi'],
        noise = map['noise'],
        sysTime = map['sysTime'],
        utcOffset = map['utcOffset'];
}