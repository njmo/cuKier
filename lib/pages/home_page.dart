import 'package:cu_kier/pages/recipe_page.dart';
import 'package:flutter/material.dart';
import 'package:cu_kier/database/database.dart';
import 'package:cu_kier/models/glucose.dart';
import 'package:cu_kier/components/user_card.dart';

import '../models/treatments.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //MongoDatabase.getTreatments();
    return FutureBuilder(
        future: MongoDatabase.getTreatments(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              color: Colors.white,
              child: const LinearProgressIndicator(
                backgroundColor: Colors.black,
              ),
            );
          } else {
            if (snapshot.hasError) {
              return Container(
                color: Colors.white,
                child: Center(
                  child: Text(
                    'Something went wrong, try again.',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
              );
            } else {
              return Scaffold(
                appBar: AppBar(
                  title: Text('MongoDB Flutter')
                ),
                drawer: Drawer(
                    child: ListView(
                      // Important: Remove any padding from the ListView.
                      padding: EdgeInsets.zero,
                      children: const [
                          DrawerHeader(
                            decoration: BoxDecoration(
                            color: Colors.blue,
                            ),
                          child: Text('Drawer Header'),
                          ),
                        ListTile(
                          title: Text("Cukry")
                        )
                      ]
                    ),
                ),
                body: ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: UserCard(
                        treatment: Treatments.fromMap(snapshot.data![index]),
                        onTapDelete: () async {
                        },
                        onTapEdit: () async {
                        },
                      ),
                    );
                  },
                  itemCount: snapshot.data?.length,
                ),
              );
            }
          }
        });
  }
}