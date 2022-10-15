import 'package:flutter/material.dart';
import 'package:flutter_koko/components/habit_tile.dart';

import '../components/my_fab.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: const Text('Habit Tracker'),
      ),
      backgroundColor: Colors.grey[300],
      floatingActionButton: MyFloatingActionButton(
        onPressed: () {},
      ),
      body: Column(
        children: [
          HabitTile(
            habitName: 'Exercise',
          ),
          HabitTile(
            habitName: 'Read',
          ),
          HabitTile(
            habitName: 'Meditate',
          ),
          HabitTile(
            habitName: 'Code',
          ),
        ],
      ),
    );
  }
}
