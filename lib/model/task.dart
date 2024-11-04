import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category { personal, work, shopping, others }

class Task {
  Task({
    String? id,
    required this.title,
    required this.description,
    required this.date,
    required this.category,
    this.status = false,
  }) : id = id ?? uuid.v4();

  final String id;
  final String title;
  final String description;
  final DateTime date;
  final Category category;
  bool status; // Track completion status

  // Factory constructor to create a Task from Firestore data
  factory Task.fromFirestore(Map<String, dynamic> data, String id) {
    return Task(
      id: id,
      title: data['taskTitle'],
      description: data['taskDesc'],
      date: DateTime.parse(data['taskDate']),
      category: Category.values
          .firstWhere((e) => e.toString() == data['taskCategory']),
      status: data['status'] ?? false, // Default to false if not set
    );
  }

  // Convert Task to Map for Firestore
  Map<String, dynamic> toFirestore() {
    return {
      'taskTitle': title,
      'taskDesc': description,
      'taskDate': date.toIso8601String(),
      'taskCategory': category.toString(),
      'status': status,
    };
  }
}
