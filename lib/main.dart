import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoe/models/task_data.dart';
import 'package:todoe/screens/TaskScreen.dart';

import 'db/TaskTile2.dart';
import 'db/databsehelper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var db = new DatabaseHelper();
  List tasks;

////  Add user
//  int saveduser = await db.saveTask(
//    new TaskTile2(title: "by milk61", category: "ds"),
//  );

//  print("user saved $saveduser");

  // count users

//  int count = await db.getCount();
//  print("Count: $count");
//
//  //Get all users;
  tasks = await db.getAllTasks();

  for (int i = 0; i < tasks.length; i++) {
    TaskTile2 task = TaskTile2.map(tasks[i]);

    print(
        "username : ${task.title}, User Id: ${task.category} , id : ${task.id}");
  }
//  List tasks2;
//  tasks2 = await db.getTaskCategory("global");
//  print("-----------------------");
//
//  for (int i = 0; i < tasks2.length; i++) {
//    TaskTile2 task = TaskTile2.map(tasks2[i]);
//
//    print(
//        "username : ${task.title}, User Id: ${task.category} , id : ${task.id}");
//  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
        theme: ThemeData(
          backgroundColor: Colors.lightBlueAccent,
          fontFamily: 'Poppins',
        ),
        home: Directionality(
            textDirection: TextDirection.rtl, child: TaskScreen()),
      ),
    );
  }
}
