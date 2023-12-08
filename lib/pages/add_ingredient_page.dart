import 'package:cu_kier/database/database.dart';
import 'package:cu_kier/models/ingredient.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddIngredientWidget extends StatefulWidget {
  const AddIngredientWidget({super.key});

  @override
  State<AddIngredientWidget> createState() => _AddIngredientWidgetState();
}

class _AddIngredientWidgetState extends State<AddIngredientWidget> {
  late Ingredient ingredient;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    ingredient = Ingredient();
    super.initState();
  }
  /*
    final ObjectId? id;
   int? ig;
   int? portion;
   */
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              keyboardType: TextInputType.name,
              onSaved: (String? value) {
                ingredient.name = value;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please fill this field';
                }
                return null;
              },
              decoration: const InputDecoration(
                labelText: "name",
              ),
            ),
            TextFormField(
              keyboardType: const TextInputType.numberWithOptions(signed: false),
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              onSaved: (String? value) {
                ingredient.carbs = int.parse(value!);
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please fill this field';
                }
                return null;
              },
              decoration: const InputDecoration(
                labelText: "carbs",
                hintText: "carbs"
              ),
            ),
            TextFormField(
              keyboardType: const TextInputType.numberWithOptions(signed: false),
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              onSaved: (String? value) {
                ingredient.fat = int.parse(value!);
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please fill this field';
                }
                return null;
              },
              decoration: const InputDecoration(
                  labelText: "fat",
                  hintText: "fat"
              ),
            ),
            TextFormField(
              keyboardType: const TextInputType.numberWithOptions(signed: false),
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              onSaved: (String? value) {
                ingredient.protein = int.parse(value!);
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please fill this field';
                }
                return null;
              },
              decoration: const InputDecoration(
                  labelText: "protein",
                  hintText: "protein"
              ),
            ),
            TextFormField(
              keyboardType: const TextInputType.numberWithOptions(signed: false),
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              onSaved: (String? value) {
                ingredient.fiber = int.parse(value!);
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please fill this field';
                }
                return null;
              },
              decoration: const InputDecoration(
                  labelText: "fiber",
                  hintText: "fiber"
              ),
            ),
            TextFormField(
              keyboardType: const TextInputType.numberWithOptions(signed: false),
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              onSaved: (String? value) {
                ingredient.ig = int.parse(value!);
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please fill this field';
                }
                return null;
              },
              decoration: const InputDecoration(
                  labelText: "IG",
                  hintText: "IG"
              ),
            ),
            TextFormField(
              keyboardType: const TextInputType.numberWithOptions(signed: false),
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              onSaved: (String? value) {
                ingredient.portion = int.parse(value!);
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please fill this field';
                }
                return null;
              },
              decoration: const InputDecoration(
                  labelText: "portion",
                  hintText: "portion"
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState!.validate()) {
                  // Process data.
                  _formKey.currentState!.save();
                  print(ingredient.toMap());
                  MongoDatabase.insertIngredient(ingredient);
                  Navigator.pop(context);
                }
              },
              child: const Text('Submit'),
              ),
          ],
        ));
  }
}
