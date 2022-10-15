
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_koko/components/habit_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // overall habit summary
  List<dynamic> habitList = [
    // [ habitName, habitStarted, timeSpent(sec), timeGoal(min) ]
    ['Exercise', false, 0, 1],
    ['Read', false, 0, 5],
    ['Meditate', false, 0, 10],
    ['Code', false, 0, 20],
  ];

  void habitStarted(int index) {
    // note what the start time is
    var startTime = DateTime.now();

    // include the time already elapsed
    int elapsedTime = habitList[index][2];

    // habit started or stopped
    setState(() {
      habitList[index][1] = !habitList[index][1];
    });

    if (habitList[index][1]) {
      // keep the time going!
      Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          // check when the user has stopped the timer
          if (!habitList[index][1]) {
            timer.cancel();
          }

          // calculate the time elapsed by comparing current time and state time
          var currentTime = DateTime.now();
          habitList[index][2] = elapsedTime + currentTime.second -
              startTime.second +
              60 * (currentTime.minute - startTime.minute) +
              60 * 60 * (currentTime.hour - startTime.hour);
        });
      });
    }

  }

  void settingsOpend(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Setting for" + habitList[index][0]),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: const Text('Habit Tracker'),
      ),
      body: ListView.builder(
        itemCount: habitList.length,
        itemBuilder: (context, index) {
          return HabitTile(
            habitName: habitList[index][0],
            onTimeTap: () {
              habitStarted(index);
            },
            settingsTapped: () {
              settingsOpend(index);
            },
            habitStarted: habitList[index][1],
            timeSpent: habitList[index][2],
            timeGoal: habitList[index][3],
          );
        },
      ),
      backgroundColor: Colors.grey[300],
      // floatingActionButton: MyFloatingActionButton(
      //   onPressed: () {},
      // ),
    );
  }
}
