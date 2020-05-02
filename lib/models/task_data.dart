import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoe/models/Task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(title: 'Buy milk'),
    Task(title: 'Buy eggs'),
    Task(title: 'Buy bread'),
  ];

  int get taskCount {
    return _tasks.length;
  }

  void addTask(String newTaskTitle) {
    final task = Task(title: newTaskTitle);
    _tasks.add(task);
    notifyListeners();
  }

  List<Task> get tasks {
    return _tasks;
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
