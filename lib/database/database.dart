import 'dart:async';

import 'package:mongo_dart/mongo_dart.dart';
import 'package:cu_kier/models/glucose.dart';

import '../../utils/constants.dart';

class MongoDatabase {
  static var db, glucoseCollection;

  static connect() async {
    db = await Db.create(MONGO_CONN_URL);
    await db.open();
    glucoseCollection = db.collection(USER_COLLECTION);
  }

  static Future<List<Map<String, dynamic>>> getDocuments() async {
    try {
      final glucose = await glucoseCollection.find(where.sortBy('date', descending: true).limit(25)).toList();
      print(glucose[0]);
      return glucose;
    } catch (e) {
      print(e);
      return Future.value(e as FutureOr<List<Map<String, dynamic>>>?);
    }
  }
}