import 'package:first_provider/taskModel.dart';
import 'package:flutter/material.dart';

class ToDoModel extends ChangeNotifier {
  List<TaskModel> taskList = [];

  addNewTask(String title, String? description) {
    taskList.add(TaskModel(title, description ?? ''));
    print(taskList.toList());
    notifyListeners();
  }
}
