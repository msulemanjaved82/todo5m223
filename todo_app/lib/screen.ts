import 'package:flutter/material.dart';

class NewTaskScreen extends StatelessWidget {
  const NewTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFFB39DDB),
          Color(0xFF5E35B1),
        ],
      ),
      appBar: AppBar(
        backgroundColor: const Color(0xFF512DA8),
        title: const Text('New Task'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16.0),
            const Text(
              'What is to be done?',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 8.0),
            TextField(
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                hintText: 'Pay Bill',
                hintStyle: TextStyle(color: Colors.white),
              ),
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Due Date',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 8.0),
            Row(
              children: [
                const Icon(
                  Icons.calendar_today,
                  color: Colors.white,
                ),
                const SizedBox(width: 8.0),
                const Text(
                  'Mon, Nov 28, 2023',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.white,
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Category',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 8.0),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: DropdownButton<String>(
                value: 'Personal',
                icon: const Icon(Icons.arrow_drop_down),
                iconSize: 24,
                elevation: 16,
                style: const TextStyle(color: Colors.white),
                underline: Container(
                  height: 2,
                  color: Colors.transparent,
                ),
                onChanged: (String? newValue) {},
                items: <String>[
                  'Personal',
                  'Work',
                  'Shopping',
                  'Others',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                backgroundColor: Colors.blue,
                onPressed: () {},
                child: const Icon(Icons.check),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
