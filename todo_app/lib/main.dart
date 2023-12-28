import 'package:flutter/material.dart';

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

class SecondPage extends StatelessWidget {
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
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
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
            ]),
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
                  SizedBox(
                      width: 10.0), // Add some spacing between text and icon
                  Transform.rotate(
                    angle: 45 *
                        3.141592653589793 /
                        180, // Rotate 45 degrees in radians
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
}

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'New Task',
          textAlign: TextAlign.center,
        ),
      ),
      body: Center(
        child:Container(
          padding: EdgeInsets.fromLTRB(0.0, 80.0, 0.0, 0.0),
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
            Container(
              
              width: 300.0,
            child:  Form(
              key: _formKey,
              child: Column(children: [
                Text('What is to be done?',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                ),),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter Something';
                    }
                    return null;
                  },
                ),
                 Text('Due Date',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                ),),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter Something';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter Something';
                    }
                    return null;
                  },
                ),
                FloatingActionButton(onPressed: (){},
                child: Text('Add'),)
              ]),
            
            )

            )
           
          ],
        ),
        )
       
      ),
    );
  }
}