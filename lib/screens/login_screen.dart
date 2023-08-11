import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/screens/home_screen.dart';
import 'package:flutter_application_1/widgets/custom_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class loginscreen extends StatefulWidget {
  const loginscreen({super.key});

  @override
  State<loginscreen> createState() => _loginscreenState();
}

class _loginscreenState extends State<loginscreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              width: 100,
              height: 100,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset("assets/logo.png"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: emailcontroller,
                decoration: InputDecoration(labelText: "Email"),
                validator: (value) {
                  if (value == null || value.contains("@") == false) {
                    return "Enter valid email";
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(labelText: "Password"),
                validator: (value) {
                  if (value == null || value.length < 8) {
                    return "Enter valid password";
                  }
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () async {
                if (_formKey.currentState!.validate()) {

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => homescreen(
                              email: emailcontroller.text,
                            )),
                  );
                  final SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    await prefs.setString('email', emailcontroller.text);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("success"),
                    ),
                  );
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 250,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                      child: Text(
                    "log in",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  )),
                ),
              ),
            ),
            // mycustombutton(
            //     buttonlable1: "login",
            //     ontap: () async {
            //       if (_formKey.currentState!.validate()) {
            //         final SharedPreferences prefs = await SharedPreferences.getInstance();
            //          await prefs.setString('email',  emailcontroller.text);  
            //         Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //               builder: (context) => homescreen(
            //                     email: emailcontroller.text,
            //                   )),
            //         );
            //         ScaffoldMessenger.of(context).showSnackBar(
            //           SnackBar(
            //             content: Text("success"),
            //           ),
            //         );
            //       }
            //     })
          ],
        ),
      ),
    );
  }
}
