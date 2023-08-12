import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/model/todo_model.dart';
import 'package:flutter_application_1/service/todo_service.dart';

class page2 extends StatefulWidget {
  const page2({super.key});

  @override
  State<page2> createState() => _page2State();
}

class _page2State extends State<page2> {
  List<Todomodel> todos = [];
  getmytodo() async {
    todos = await todoservice().getusers();
    setState(() {});
  }

  void initState() {
    super.initState();
    getmytodo();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, int index) {
        return ListTile(
          title: Text(todos[index].title ?? "--"),
          trailing: Icon(Icons.title),
          leading: Text("${index + 1}"),
        );
      },
    );
  }
}
