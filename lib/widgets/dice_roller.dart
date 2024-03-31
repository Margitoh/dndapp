import 'dart:math';
import 'package:flutter/material.dart';

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  _DiceRollerState createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  String diceRoll = 'Roll a dice';

  void rollDice(int diceSides) {
    final roll = Random().nextInt(diceSides) + 1;
    setState(() {
      diceRoll = 'Result: $roll (d$diceSides)';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(diceRoll, style: const TextStyle(fontSize: 24)),
          SizedBox(height: 20),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              ElevatedButton(
                  onPressed: () => rollDice(4), child: const Text('Roll d4')),
              ElevatedButton(
                  onPressed: () => rollDice(6), child: const Text('Roll d6')),
              ElevatedButton(
                  onPressed: () => rollDice(8), child: const Text('Roll d8')),
              ElevatedButton(
                  onPressed: () => rollDice(10), child: const Text('Roll d10')),
              ElevatedButton(
                  onPressed: () => rollDice(12), child: const Text('Roll d12')),
              ElevatedButton(
                  onPressed: () => rollDice(20), child: const Text('Roll d20')),
              ElevatedButton(
                  onPressed: () => rollDice(100),
                  child: const Text('Roll d100')),
            ],
          ),
        ],
      ),
    );
  }
}
