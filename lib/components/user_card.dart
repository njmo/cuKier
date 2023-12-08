import 'package:cu_kier/database/database.dart';
import 'package:cu_kier/models/ingredient.dart';
import 'package:cu_kier/models/treatments.dart';
import 'package:cu_kier/pages/add_ingredient_page.dart';
import 'package:cu_kier/pages/recipe_page.dart';
import 'package:flutter/material.dart';
import 'package:cu_kier/models/glucose.dart';
import 'package:mongo_dart/mongo_dart.dart' as M;

import '../models/dose.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key, required this.treatment, required this.onTapDelete, required this.onTapEdit});
//  final Glucose glucose;
  final Treatments treatment;
  final void Function()? onTapEdit, onTapDelete;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListTile(
          shape: const StadiumBorder(
            side: BorderSide(color: Colors.blue, width: 1),
          ),
          leading: Column(
            children: [
              const Icon(Icons.vaccines, size: 30,),
              Text('${treatment.totalInsulin}'),
          ],
          ),
          subtitle: Column (
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            Text.rich( TextSpan(
              children: <InlineSpan>[
              const WidgetSpan(child: Icon(Icons.opacity)),
                TextSpan(text: '${treatment.glucose}'),
              ],
          )),
            Text.rich( TextSpan(
            children: <InlineSpan>[
            const WidgetSpan(child: Icon(Icons.local_dining)),
            TextSpan(text: '${treatment.carbs}'),
            ],
            )),
          ]),
          //subtitle: Text('${DateTime.fromMillisecondsSinceEpoch(treatment.date!.toInt())}'),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
            child: Container(
                width: 50,
                height: 50,
                child: Icon(Icons.help_center_outlined,size: 30,),

              ),
                onDoubleTap: () {
                    print("doubletab");
                },
                onTap: () async {
                  final result = await Navigator.push<List<Ingredient>>(context, MaterialPageRoute(builder: (BuildContext context) {
                      return RecipePageWidget();
                  }));
                  print(result.toString());
                },
              )],
          ),
          ),
    );
  }
}