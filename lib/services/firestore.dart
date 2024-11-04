import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/task.dart';

class FirestoreService {
  final CollectionReference tasks = FirebaseFirestore.instance.collection('tasks');

  // Add Task to Firestore
  Future<void> addTask(Task task) {
    return tasks.add(task.toFirestore());
  }

  // Get Tasks from Firestore
  Stream<QuerySnapshot> getTasks() {
    return tasks.snapshots();
  }

  // Update Task Status
  Future<void> updateTaskStatus(String taskId, bool isCompleted) {
    return tasks.doc(taskId).update({'status': isCompleted});
  }

  // Delete Task
  Future<void> deleteTask(String taskId) {
    return tasks.doc(taskId).delete();
  }
}
