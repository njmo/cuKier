import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/ingredient.dart';

class IngredientCard extends StatefulWidget {
  const IngredientCard({Key? key,required this.ingredient, required this.onPressed_}) : super(key: key);

  final Ingredient ingredient;
  final Function onPressed_;
  @override
  State<IngredientCard> createState() => _IngredientWidgetState();
}

class _IngredientWidgetState extends State<IngredientCard> {
  final TextEditingController portionController = TextEditingController();
  bool isPressed = false;
  String state = "Portion";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Material(
        child: ListTile(
          shape: const StadiumBorder(
            side: BorderSide(color: Colors.blue, width: 1),
          ),
          leading: Row(
            children: [
              Text('Name : ${widget.ingredient.name}}'),
              Text('Carbs : ${widget.ingredient.carbs}}'),
              Text('Fat : ${widget.ingredient.fat}}'),
              DropdownButton(
                value: state,
                items: const [
                  DropdownMenuItem(value: 'portion',child: Text("Portion"),),
                  DropdownMenuItem(value: 'grams',child: Text("Grams"),),
                ],
                onChanged: (String? value) {
                  print(value);
                  setState(() {
                    if (value != null) {
                      state = value;
                    }
                  });
                },
              ),
              SizedBox(
                width: 100,
                  height: 15,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: portionController,
                  decoration: const InputDecoration(labelText: 'Amount'),
                ),
              ),
                ],
              ),
          trailing: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    icon: isPressed ? const Icon(Icons.check_box_outlined) : const Icon(Icons.check_box_outline_blank_rounded),
                    onPressed: () {
                      widget.onPressed_(widget.ingredient);
                      setState(() {
                        isPressed = !isPressed;
                      });
                    }),
          ]),
        ),
        ),
      );
  }

}