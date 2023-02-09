import 'package:first_provider/taskModel.dart';
import 'package:flutter/material.dart';

class ToDoModel extends ChangeNotifier {
  List<TaskModel> taskList = [];

  addNewTask(TaskModel newTask) {
    taskList.add(newTask);
    notifyListeners();
  }
}
