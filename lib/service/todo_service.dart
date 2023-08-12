import 'package:dio/dio.dart';

import 'package:flutter_application_1/model/todo_model.dart';

class todoservice {
  String url = "https://jsonplaceholder.typicode.com/todos";
 Future<List<Todomodel>> getusers() async {
    List<Todomodel> todolist = [];
    final response = await Dio().get(url);
    var data = response.data;
    data.forEach((element) {
      Todomodel todos = Todomodel.fromJson(element);
      todolist.add(todos);
    });
    return todolist;
  }
}
