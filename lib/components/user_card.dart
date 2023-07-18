import 'package:flutter/material.dart';
import 'package:cu_kier/models/glucose.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key, required this.glucose, required this.onTapDelete, required this.onTapEdit});
  final Glucose glucose;
  final void Function()? onTapEdit, onTapDelete;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2.0,
      color: Colors.white,
      child: ListTile(
        leading: Text(
          '${glucose.sgv}',
          style: Theme.of(context).textTheme.headline6,
        ),
        title: Text(glucose.direction!),
        subtitle: Text('${DateTime.fromMillisecondsSinceEpoch(glucose.date!.toInt())}'),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              child: Icon(Icons.edit),
              onTap: onTapEdit,
            ),
            GestureDetector(
              child: Icon(Icons.delete),
              onTap: onTapDelete,
            ),
          ],
        ),
      ),
    );
  }
}