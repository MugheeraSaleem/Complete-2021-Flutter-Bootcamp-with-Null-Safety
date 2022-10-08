import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String title;
  final bool isDone;
  final Function(bool?) onCheckboxChanged;

  TaskTile(
      {required this.title,
      required this.isDone,
      required this.onCheckboxChanged});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 20.0,
          decoration: isDone ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isDone,
        onChanged: onCheckboxChanged,
      ),
    );
  }
}
