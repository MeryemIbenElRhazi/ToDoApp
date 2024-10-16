import 'package:flutter/material.dart';

class NewTask extends StatefulWidget {
  const NewTask({super.key}); // constructor, on passe à la classe mère notre id 
  @override // redéfinir la methode create state 
  State<NewTask> createState() {
    return _NewTaskState();
  }
}

class _NewTaskState extends State<NewTask> {
  @override
  Widget build(BuildContext context) { // construire l'etat 
    return const Text('Hello');
  }
}
