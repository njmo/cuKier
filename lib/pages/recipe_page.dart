import 'package:cu_kier/components/ingredient_card.dart';
import 'package:cu_kier/database/database.dart';
import 'package:cu_kier/models/ingredient.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecipePageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: MongoDatabase.getIngredients(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
          color: Colors.white,
          child: const LinearProgressIndicator(
          backgroundColor: Colors.black,
          ),
          );
          } else {
            return Scaffold(
              appBar: AppBar(
                  title: Text('MongoDB Flutter')
              ),
              body: ListView.builder(
                  itemBuilder: (context, index) {
                    return IngredientCard(
                        ingredient: Ingredient.fromMap(snapshot.data![index]));
                  },
                  itemCount: snapshot.data?.length),
            );
          }
        });
  }
}