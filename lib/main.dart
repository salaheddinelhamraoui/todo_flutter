import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoe/models/task_data.dart';
import 'package:todoe/screens/TaskScreen.dart';

void main() => runApp(MyApp());

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
