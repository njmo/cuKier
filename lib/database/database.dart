import 'dart:async';

import 'package:cu_kier/models/ingredient.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:cu_kier/models/glucose.dart';

import '../../utils/constants.dart';
import '../models/dose.dart';

class MongoDatabase {
  static var db, glucoseCollection, treatmentsCollection, recipesCollection, ingredientsCollection, doseCollection;

  static connect() async {
    db = await Db.create(MONGO_CONN_URL);
    await db.open();
    glucoseCollection = db.collection(USER_COLLECTION);
    treatmentsCollection = db.collection(TREATMENTS_COLLECTION);
    recipesCollection = db.collection(RECIPE_COLLECTION);
    ingredientsCollection = db.collection(INGREDIENT_COLLECTION);
    doseCollection = db.collection(DOSE_COLLECTION);
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

  static Future<List<Map<String, dynamic>>> getTreatments() async {
    try {
      final treatments = await treatmentsCollection.find(where.sortBy('created_at', descending: true).exists('bolusCalculatorResult').limit(25)).toList();
      print(treatments[0]);
      return treatments;
    } catch (e) {
      print(e);
      return Future.value(e as FutureOr<List<Map<String, dynamic>>>?);
    }
  }

  static Future<List<Map<String, dynamic>>> getIngredients() async {
    try {
      final ingredients = await ingredientsCollection.find().toList();
      return ingredients;
    } catch (e) {
      print(e);
      return Future.value(e as FutureOr<List<Map<String, dynamic>>>?);
    }
  }

  static insertIngredient(Ingredient ingredient) async{
    await ingredientsCollection.insertAll([ingredient.toMap()]);
  }
  static insertDose(Dose dose) async{
    await doseCollection.insertAll([dose.toMap()]);
  }
}