import 'package:flutter/material.dart';

void main() {
  runApp(Reorderable());
}

class Reorderable extends StatefulWidget {
  Reorderable({Key? key}) : super(key: key);

  @override
  State<Reorderable> createState() => _ReorderableState();
}

class _ReorderableState extends State<Reorderable> {
  final items = [
    '11 : Bumrah',
    '9  : shami',
    '4 : kohli',
    '1 : Rohit',
    '2 : Dhawan',
    ' 3 : Rahul',
    ' 10 : siraj',
    '8 : Ashwin',
    '5 : samson',
    '6 : pant',
    '7 : jadeja',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
            child: Theme(
          data:
              ThemeData(canvasColor: Colors.red, primarySwatch: Colors.yellow),
          child: ReorderableListView(
              children: [
                for (final item in items)
                  Card(
                    color: Colors.blueGrey,
                    key: ValueKey(item),
                    elevation: 2,
                    child: ListTile(
                      title: Text(item),
                    ),
                  )
              ],
              onReorder: (oldIndex, newIndex) {
                setState(() {
                  if (newIndex > oldIndex) newIndex--;
                  //At the time of dragging items move upwards or downwards according to the condition

                  final item = items.removeAt(oldIndex);
                  items.insert(newIndex, item);
                });
              }),
        )),
      ),
    );
  }
}
