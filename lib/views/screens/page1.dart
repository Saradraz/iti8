
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class page1 extends StatefulWidget {
  const page1({super.key});

  @override
  State<page1> createState() => _page1State();
}

class _page1State extends State<page1> {
  String email = "";
  getcachedEmail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    email = await prefs.getString('email') ?? '--';
    setState(() {});
  }

  void initState() {
    super.initState();
    getcachedEmail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Profile \n $email"),
      ),
    );
  }
}
