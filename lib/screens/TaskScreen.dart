import 'package:flutter/material.dart';
import 'package:todoe/db/databsehelper.dart';
import 'package:todoe/screens/menu.dart';
import 'package:todoe/widgets/tasks_tile.dart';
import 'package:todoe/widgets/tasks_list.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'add_task_screen.dart';
import 'package:todoe/models/Task.dart';
import 'package:provider/provider.dart';
import 'package:todoe/models/task_data.dart';

class TaskScreen extends StatefulWidget {
  static String id = "taskscreen";

  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(
          FontAwesomeIcons.plus,
          size: 23.0,
        ),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return AddTaskScreen();
              });
        },
      ),
      backgroundColor: Colors.lightBlueAccent,
      drawer: Drawer(
        child: drawerList(context),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff0abde3), Color(0xff2e86de)],
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    left: 20.0, bottom: 30.0, top: 10.0, right: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    GestureDetector(
                      child: CircleAvatar(
                        radius: 27.0,
                        backgroundColor: Colors.white,
                        child: Icon(
                          FontAwesomeIcons.list,
                          size: 20.0,
                          color: Colors.lightBlueAccent,
                        ),
                      ),
                      onTap: () {
                        _scaffoldKey.currentState.openDrawer();
                      },
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      'مهماتي',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Janna",
                          fontSize: 50.0,
                          fontWeight: FontWeight.w800,
                          textBaseline: null),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      '${Provider.of<TaskData>(context).taskCount} مهمات',
                      style: TextStyle(
                          fontFamily: "Janna",
                          fontSize: 18.0,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0)),
                  ),
                  child: TaskList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
