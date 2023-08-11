import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/page1.dart';
import 'package:flutter_application_1/screens/page2.dart';
import 'package:flutter_application_1/screens/page3.dart';

class homescreen extends StatefulWidget {
  String email;
  homescreen({super.key, required this.email});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  int currentindex = 0;
  List<Widget> pages = [
    page1(),
    page2(),
    page3(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      // body: Center(
      //   child: Text(widget.email),
      // ),
      body: pages[currentindex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentindex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "page1"),
          BottomNavigationBarItem(icon: Icon(Icons.security), label: "page2"),
          BottomNavigationBarItem(icon: Icon(Icons.more), label: "page3"),
        ],
        onTap: (value) {
          currentindex = value;
          setState(() {});

          print(value);
        },
      ),
    );
  }
}
