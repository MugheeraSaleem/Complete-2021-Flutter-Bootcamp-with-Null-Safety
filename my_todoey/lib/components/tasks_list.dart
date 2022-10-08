import 'package:flutter/material.dart';
import 'task_tile.dart';
import 'package:provider/provider.dart';
import 'package:my_todoey/models/task_data.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, taskData, widget) {
      return ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 30.0),
        itemBuilder: (context, index) {
          final task = taskData.tasks[index];
          return Dismissible(
            key: Key(UniqueKey().toString()),
            child: TaskTile(
              title: task.title,
              isDone: task.isDone,
              onCheckboxChanged: (newValue) {
                taskData.updateTask(task);
              },
            ),
            onDismissed: (direction) {
              taskData.deleteTask(index);
            },
          );
        },
        itemCount: taskData.taskCount,
      );
    });
  }
}
