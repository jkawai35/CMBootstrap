import 'package:flutter/material.dart';
import 'DinnerID.dart';
import 'ToDoID.dart';

class Stats extends StatefulWidget {
  const Stats({super.key, required this.title});

  final String title;

  @override
  State<Stats> createState() => StatsState();
}

class StatsState extends State<Stats> {
  final dinnerLength = DinnerID.dinnerList().length;
  final todoLength = ToDoID.todoList().length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          Container(
            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            child: Column(
              children: [
                Expanded(
                    child: ListView(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            top: 50,
                            bottom: 20,
                          ),
                          child: Text('Groceries Needed ' + todoLength.toString(),style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w500
                          ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            top: 50,
                            bottom: 20,
                          ),
                          child: Text('Meals Planned ' + dinnerLength.toString(),style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w500
                          ),
                          ),
                        ),
                      ],
                    )
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
