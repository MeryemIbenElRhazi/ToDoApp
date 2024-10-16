import 'package:flutter/material.dart';
import 'package:todolist_app/model/task.dart';


class TaskItem extends StatelessWidget {
  const TaskItem(this.task, {super.key});

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(task.title),
        subtitle: Text(task.description),
        trailing: Text(
          '${task.date.day}/${task.date.month}/${task.date.year}',
        ),
      ),
    );
  }
}
