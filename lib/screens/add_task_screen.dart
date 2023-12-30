import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();

    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.lightBlue[400],
              ),
            ),
            TextField(
              controller: textEditingController,
              autofocus: true,
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
              child: Text(
                'Add',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.lightBlue[400],
              ),
              onPressed: () {
                String newTaskTitle = textEditingController.text;
                if (newTaskTitle.isNotEmpty) {
                  Provider.of<TaskData>(context, listen: false).addTask(newTaskTitle);
                }
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
