import 'package:flutter/material.dart';
import 'package:todolist_app/model/task.dart';

class TaskItem extends StatelessWidget {
  const TaskItem(this.task, {super.key});

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(
          task.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(task.description),
        trailing: Text(
          '${task.date.day}/${task.date.month}/${task.date.year}',
          style: const TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
