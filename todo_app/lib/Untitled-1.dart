import 'package:flutter/material.dart';

void main() {
  runApp(NewTask());
}

class NewTask extends StatefulWidget {
  @override
  _NewTaskState createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  String taskName = '';
  String category = 'Personal';
  DateTime dueDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'What is to be done?',
              style: TextStyle(fontSize: 16),
            ),
            TextField(
              onChanged: (value) {
                setState(() {
                  taskName = value;
                });
              },
            ),
            SizedBox(height: 16),
            Text(
              'Due Date',
              style: TextStyle(fontSize: 16),
            ),
            Row(
              children: [
                Icon(Icons.calendar_today),
                SizedBox(width: 8),
                Text(
                  '${dueDate.day}/${dueDate.month}/${dueDate.year}',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(width: 8),
                Icon(Icons.access_time),
                SizedBox(width: 8),
                Text(
                  '${dueDate.hour}:${dueDate.minute}',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Category',
              style: TextStyle(fontSize: 16),
            ),
            DropdownButton<String>(
              value: category,
              onChanged: (value) {
                setState(() {
                  category : value;
                });
              },
              items: <String>['Personal', 'Work', 'Shopping', 'Others']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                onPressed: () {},
                child: Icon(Icons.check),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
