import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoe/models/Task.dart';
import 'dart:collection';
import 'package:todoe/db/databsehelper.dart';
import 'package:todoe/db/TaskTile2.dart';

class TaskData extends ChangeNotifier {
  TaskData() {
    loadData();
  }

  List<Task> _tasks = [
    Task(title: 'Buy milk', category: 'global'),
  ];

  var db = new DatabaseHelper();
  List tasks;

  Future loadData() async {
    tasks = await db.getAllTasks();

    for (int i = 0; i < tasks.length; i++) {
      TaskTile2 task = TaskTile2.map(tasks[i]);
      _tasks
          .add(Task(title: task.title, category: task.category, isDone: false));
      notifyListeners();
    }
  }

  int get taskCount {
    return _tasks.length;
  }

  void addTask(String newTaskTitle) {
    final task = Task(title: newTaskTitle);
    _tasks.add(task);
    notifyListeners();
  }

  List<Task> get getTasks {
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
