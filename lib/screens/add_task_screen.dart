import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoe/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String newTaskTitle;
    return Container(
      color: Color(0xff757575),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'أضف مهمة',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Janna",
                  fontSize: 25.0,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: "Janna"),
                decoration: InputDecoration(
                  hintText: 'أدخل تفاصيل المهمة',
                  hintStyle: TextStyle(fontFamily: "Janna"),
                ),
                onChanged: (newText) {
                  newTaskTitle = newText;
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              FlatButton(
                color: Colors.lightBlue,
                child: Text(
                  'إضافة',
                  style: TextStyle(
                      fontFamily: "Janna", fontSize: 25.0, color: Colors.white),
                ),
                onPressed: () {
//                  Provider.of<TaskData>(context, listen: false)
//                      .addTask(newTaskTitle);
                  print(newTaskTitle);
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
