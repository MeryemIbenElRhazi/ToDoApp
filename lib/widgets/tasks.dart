import 'package:flutter/material.dart';
import 'package:todolist_app/model/task.dart';
import 'package:todolist_app/services/firestore.dart';
import 'package:todolist_app/widgets/new_task.dart';
import 'package:todolist_app/widgets/tasks_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Tasks extends StatefulWidget {
  const Tasks({super.key});

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  final FirestoreService firestoreService = FirestoreService();

  void _openAddTaskOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => NewTask(onAddTask: _addTask),
    );
  }

  Future<void> _addTask(Task task) async {
    await firestoreService.addTask(task);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ToDoList-App'),
        backgroundColor: const Color.fromARGB(255, 228, 206, 218),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 228, 155, 187),
              Colors.lightBlue.shade50,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your Tasks',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 154, 45, 109),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: firestoreService.getTasks(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }

                  final taskDocs = snapshot.data!.docs;
                  List<Task> tasks = taskDocs.map((doc) {
                    final data = doc.data() as Map<String, dynamic>;
                    return Task(
                      id: doc.id,
                      title: data['taskTitle'],
                      description: data['taskDesc'],
                      date: DateTime.parse(data['taskDate']),
                      category: Category.values.firstWhere(
                          (e) => e.toString() == data['taskCategory']),
                      status: data['status'] ?? false,
                    );
                  }).toList();

                  return TasksList(tasks: tasks);
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openAddTaskOverlay,
        tooltip: 'Add Task',
        child: const Icon(Icons.add),
        backgroundColor: const Color.fromARGB(255, 245, 161, 202),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
