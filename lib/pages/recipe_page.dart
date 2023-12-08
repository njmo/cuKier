import 'package:cu_kier/components/ingredient_card.dart';
import 'package:cu_kier/database/database.dart';
import 'package:cu_kier/models/ingredient.dart';
import 'package:cu_kier/pages/add_ingredient_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecipePageWidget extends StatefulWidget {
  const RecipePageWidget({super.key});

  @override
  _RecipePageState createState() => _RecipePageState();
}

class _RecipePageState  extends State<RecipePageWidget> {
  List<Ingredient> ingredients = [];

  void ingredientPress(Ingredient ingredient) {
    setState(() {
      if (ingredients.contains(ingredient))
      {
        ingredients.remove(ingredient);;
      }
      else {
        ingredients.add(ingredient);
      }
    });
  }

  Icon isInList(Ingredient ingredient) {
    if (ingredients.contains(ingredient))
    {
      return const Icon(Icons.check_box_outlined);
    }
    return const Icon(Icons.check_box_outline_blank_rounded);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
      // Custom back button behavior
      // Perform actions or prevent navigation
      Navigator.pop<List<Ingredient>>(context, ingredients);
      return true; // Set to false to disable back button
    },
      child: FutureBuilder(
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
                          ingredient: Ingredient.fromMap(snapshot.data![index]),
                          onPressed_: ingredientPress,
                          isAdded_: isInList,
                      );
                    },
                    itemCount: snapshot.data?.length),
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                          return AddIngredientWidget();
                        })).then((value) => setState( () {} ));
                  },
                  child: Icon(Icons.add),
                ),
              );
            }
          }),
    );
  }
}