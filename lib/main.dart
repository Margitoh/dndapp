import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'models/character.dart';
import 'widgets/dice_roller.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Character> characters = [
    Character(name: "Eldrin", race: "Elf", characterClass: "Ranger", level: 5),
    Character(name: "Dorn", race: "Human", characterClass: "Paladin", level: 7),
  ];

  void _showAddCharacterDialog() async {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController raceController = TextEditingController();
    final TextEditingController classController = TextEditingController();
    final TextEditingController levelController = TextEditingController();

    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add New Character'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(hintText: "Name"),
                ),
                TextField(
                  controller: raceController,
                  decoration: InputDecoration(hintText: "Race"),
                ),
                TextField(
                  controller: classController,
                  decoration: InputDecoration(hintText: "Class"),
                ),
                TextField(
                  controller: levelController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: "Level"),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Add'),
              onPressed: () {
                setState(() {
                  characters.add(Character(
                    name: nameController.text,
                    race: raceController.text,
                    characterClass: classController.text,
                    level: int.tryParse(levelController.text) ?? 1,
                  ));
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("D&D Companion")),
      body: ListView.builder(
        itemCount: characters.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(characters[index].name),
            subtitle: Text(
                "${characters[index].race} ${characters[index].characterClass} - Level ${characters[index].level}"),
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: _showAddCharacterDialog,
            heroTag: null,
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            child: const Icon(Icons.casino),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return const DiceRoller();
                },
              );
            },
            heroTag: null,
          ),
        ],
      ),
    );
  }
}
