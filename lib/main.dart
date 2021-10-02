// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables
// --https://www.youtube.com/watch?v=ZHRhSFXqHJY&list=WL&index=10-- Link to the Video

import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Declration of the value variable
  double value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //App Background
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.blue[400]!,
                  (Colors.blue[800]!),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),

          // Navigation Menu
          SafeArea(
            child: Container(
              width: 200.0,
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  DrawerHeader(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 50.0,
                          backgroundImage: NetworkImage(
                              "https://avatars.githubusercontent.com/u/30352069?v=4"),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Erick Mwita",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        ListTile(
                          onTap: () {},
                          leading: Icon(Icons.home, color: Colors.white),
                          title: Text(
                            "Home",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        ListTile(
                          onTap: () {},
                          leading: Icon(Icons.person, color: Colors.white),
                          title: Text(
                            "Profile",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        ListTile(
                          onTap: () {},
                          leading: Icon(Icons.settings, color: Colors.white),
                          title: Text(
                            "Settings",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        ListTile(
                          onTap: () {},
                          leading: Icon(Icons.logout, color: Colors.white),
                          title: Text(
                            "Logout",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Main screen wrapped in a tween animation builder

          TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: value),
              duration: Duration(milliseconds: 500),
              curve: Curves.easeIn,
              builder: (_, double val, __) {
                return (
                    //Lets create a transform widget
                    Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..setEntry(0, 3, 200 * val)
                    ..rotateY((pi / 6) * val),
                  child: Scaffold(
                    appBar: AppBar(
                      title: Text("3D Drawer Menu"),
                    ),
                    body: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Swipe right to open menu 👉"),
                          ElevatedButton(
                              onPressed: () {}, child: Text("Press Me"))
                        ],
                      ),
                    ),
                  ),
                ));
              }),

          //Gesture detector that will allow us to open the drawer
          GestureDetector(onHorizontalDragUpdate: (e) {
            if (e.delta.dx > 0) {
              setState(() {
                value = 1;
              });
            } else {
              setState(() {
                value = 0;
              });
            }
          }

              // On tap can be implemented below but is not that appealing visually
              /*/ onTap: () {
              setState(() {
                value == 0
                    ? value = 1
                    : value =
                        0; //if the value = 0 then when we tap it becomes 1 else it will become 0
              });
            },*/
              )
        ],
      ),
    );
  }
}
