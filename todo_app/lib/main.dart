import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';

final _formKey = GlobalKey<FormState>();
void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fltter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
      routes: <String, WidgetBuilder>{
        '/SecondPage': (context) => SecondPage(),
        '/ThirdPage': (context) => ThirdPage()
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
      width: double.maxFinite,
      height: double.maxFinite,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0, 0),
          end: Alignment(0, 1),
          colors: [
            Color(0xFFC7CCF5),
            Color(0x00FFFFFF), // Transparent white
            Color(0xFFB8BDEA),
          ],
          stops: [0.7873, 1.0924, 1.0924],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Doingly',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 29.0,
                color: Color(0xFF394E76),
                fontWeight: FontWeight.w500),
          ),
          Image(
              height: 225,
              image: NetworkImage(
                  'https://cdn.iconscout.com/icon/premium/png-512-thumb/to-do-list-2282168-1903307.png?f=webp&w=256')),
          Container(
            padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
            child: Text(
              'Doingly will help you stay organized and perform your task much faster',
              style: TextStyle(
                fontSize: 16.0,
                color: Color(0xFF272121),
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          RoundButton(name: 'Get Started'),
        ],
      ),
    )));
  }
}

class RoundButton extends StatelessWidget {
  String name;
  RoundButton({required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 20.0, 0, 20.0),
      child: SizedBox(
          width: 200.0,
          height: 41.0,
          child: ElevatedButton(
              style: flatButtonStyle,
              onPressed: () => {Navigator.pushNamed(context, '/SecondPage')},
              child: Text(
                name,
                style: TextStyle(
                  fontSize: 20,
                ),
              ))),
    );
  }

  final ButtonStyle flatButtonStyle = ElevatedButton.styleFrom(
    primary: Color(0xFFB8BDEA),
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(15)),
    ),
  );
}

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  List _task = [];
  @override
  void initState() {
    super.initState();
    // Load JSON when the widget is initialized
    readJson();
  }

  Future<void> readJson() async {
    try {
      final String response = await rootBundle.loadString('/tasks.json');
      final data = await json.decode(response);
      setState(() {
        _task = data["task"];
        print('number of tasks ${_task.length}');
      });
    } catch (e) {
      // Handle error loading JSON (e.g., file not found, JSON format error)
      print('Error loading JSON: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0, 0),
            end: Alignment(0, 1),
            colors: [
              Color(0xFFC7CCF5),
              Color(0x00FFFFFF), // Transparent white
              Color(0xFFB8BDEA),
            ],
            stops: [0.7873, 1.0924, 1.0924],
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  Icons.menu_rounded,
                  color: Colors.black,
                  size: 50.0,
                ),
                Icon(
                  Icons.account_box_rounded,
                  color: Colors.black,
                  size: 50.0,
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.blueAccent),
                  color: Colors.blue),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      'Manage Your Time Well',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0, // Adjust the font size as needed
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Transform.rotate(
                    angle: 45 * 3.141592653589793 / 180,
                    child: Icon(
                      Icons.note_add_sharp,
                      size: 66.0,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              'Categories',
              style: TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.start,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 20.0, 0, 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 50.0,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: Icon(
                        Icons.work_history_rounded,
                        color: Colors.blue,
                        size: 50.0,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 50.0,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: Icon(
                        Icons.monitor_heart_rounded,
                        size: 50.0,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 50.0,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: Icon(
                        Icons.boy_rounded,
                        size: 50.0,
                        color: Colors.brown,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 50.0,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: Icon(
                        Icons.shopping_cart_checkout_rounded,
                        size: 50.0,
                        color: Colors.green,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Text(
              'Your Tasks for Today',
              style: TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            _task.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Card(
                          key: ValueKey(_task[index]["id"]),
                          child: Container(
                            margin: const EdgeInsets.all(15.0),
                            padding: const EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.blueAccent),
                                color: Colors.blue),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    IconButton(
                                        onPressed: () => {},
                                        icon: Icon(
                                          Icons.edit_note_rounded,
                                          size: 30.0,
                                        )),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          _task[index]["name"],
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Text(
                                          _task[index]["task"],
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 15.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      _task[index]["time"],
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    IconButton(
                                        onPressed: () => _deleteTask(index),
                                        icon: Icon(
                                          Icons.delete_forever_rounded,
                                          size: 30.0,
                                        ))
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: _task.length,
                    ),
                  )
                : Container(
                    child: Text('No Task Available'),
                  )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            icon: Icon(
              Icons.home_max_rounded,
            ),
            label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_month,
            ),
            label: 'Calender'),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.note_add_rounded,
            ),
            label: 'Note Add'),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
            ),
            label: 'Settings'),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle button press
          Navigator.pushNamed(context, '/ThirdPage');
        },
        tooltip: 'Your Button Tooltip',
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
  void _deleteTask(int index) {
  setState(() {
    // Remove the task at the specified index
    _task.removeAt(index);
  });
}
}


// class SecondPage extends StatelessWidget {
//   List _task = [];
//   Future<void> readJson() async {
//     final String response = await rootBundle.loadString('assets/tasks.json');
//     final data = await json.decode(response);
//     setstate(() {
//       _task = data["task"]
//     });
//   }

//   @override
//   Widget build(BuildContext context) {

//   }
// }

class ThirdPage extends StatefulWidget {
  @override
  _NewTaskState createState() => _NewTaskState();
  final _formKey = GlobalKey<FormState>();
}

class _NewTaskState extends State<ThirdPage> {
  TextEditingController _dateController = TextEditingController();
  TimeOfDay? selectedTime;
  String category = 'Personal';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Task'),
      ),
      body:Container(
        margin: EdgeInsets.fromLTRB(40.0, 20.0, 40.0, 20.0),
child:Column(
        
        children: [
          Text('What is to be done?'),
          Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         
          TextFormField(
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          SizedBox(
            height: 50.0,
          ),
           Text('Due Date And Time'),
           SizedBox(
            height: 20.0,
           ),
  TextField(
            controller: _dateController,
            decoration: InputDecoration(
              labelText: 'DATE',
              filled: true,
              prefixIcon: Icon(Icons.calendar_today),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue)),
            ),
            readOnly: true,
            onTap: () {
              _selectDate();
            },
          ),
          SizedBox(
            height: 30.0,
          ),

       

 ElevatedButton(
  
              onPressed: () {
                _selectTime(context);
              },
              child: Icon(Icons.date_range),
            ),
            SizedBox(height: 20),
            if (selectedTime != null)
              Text(
                'Selected Time: ${selectedTime!.format(context)}',
                style: TextStyle(fontSize: 18),
              ),
        
        Text('Category'),
SizedBox(height: 20.0,),   
 Row(
  children: [
    DropdownButton<String>(
              value: category,
              onChanged: (value) {
                setState(() {
                  category = value!;
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
            SizedBox(
              width: 20.0,
            ),
            Icon(Icons.list_alt_rounded)
  ],
 ),
            Align(
              alignment: Alignment.bottomRight,
              child:Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: FloatingActionButton(
              
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
                
              },
              child: const Icon(Icons.check),
              
            ),
          ),
            ),
          
         
        ],
      ),
    )
          ,
          // Display the selected date if available
        ],
      ),
      )
      
       
    );
  }

  Future<void> _selectDate() async {
    DateTime? _picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (_picked != null) {
      setState(() {
        _dateController.text = _picked.toString().split(' ')[0];
      });

    }

  }
 Future<void> _selectTime(BuildContext context) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
     if (pickedTime != null && pickedTime != selectedTime) {
      setState(() {
        selectedTime = pickedTime;
      });
    }
  }

}
