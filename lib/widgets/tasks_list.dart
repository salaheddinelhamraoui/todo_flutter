import 'package:flutter/material.dart';
import 'package:todoe/widgets/tasks_tile.dart';
import 'package:provider/provider.dart';
import 'package:todoe/models/task_data.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return Padding(
          padding: const EdgeInsets.all(25.0),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return TaskTile(
                  taskTitle: taskData.tasks[index].title,
                  isChecked: taskData.tasks[index].isDone,
                  longPressCallback: () {
                    taskData.deleteTask(taskData.tasks[index]);
                  },
                  checkBoxCallback: (checkboxState) {
                    print(checkboxState);
                    taskData.updateTask(taskData.tasks[index]);
                  });
            },
            itemCount: taskData.tasks.length,
          ),
        );
      },
    );
  }
}
