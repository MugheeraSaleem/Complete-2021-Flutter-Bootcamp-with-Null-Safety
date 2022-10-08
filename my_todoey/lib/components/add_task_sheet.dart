import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_todoey/models/task_data.dart';

class AddTaskSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    late String newTask;

    return Container(
      padding: EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            'Add Task',
            style: TextStyle(
              color: Colors.lightBlueAccent,
              fontSize: 30.0,
            ),
            textAlign: TextAlign.center,
          ),
          TextField(
            cursorColor: Colors.lightBlueAccent,
            style: TextStyle(
              fontSize: 20.0,
            ),
            onChanged: (value) {
              newTask = value;
            },
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.lightBlueAccent,
                  width: 5.0,
                ),
              ),
            ),
            autofocus: true,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                Colors.lightBlueAccent,
              )),
              child: Text(
                'Add',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                Provider.of<TaskData>(context, listen: false).addTask(newTask);
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
