import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/model/todo_model.dart';
import 'package:flutter_application_1/service/todo_service.dart';
import 'package:flutter_application_1/views/cubit/todos_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class page2 extends StatefulWidget {
  const page2({super.key});

  @override
  State<page2> createState() => _page2State();
}

class _page2State extends State<page2> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodosCubit(),
      child: BlocConsumer<TodosCubit, TodosState>(
        builder: (context, state) {
          if (state is TodosLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is TodosError) {
            return Center(
              child: Text("Error"),
            );
          }
          return ListView.builder(
            itemCount: context.watch<TodosCubit>().todos.length,
            itemBuilder: (context, int index) {
              return ListTile(
                title: Text(
                    context.watch<TodosCubit>().todos[index].title ?? "--"),
                trailing: Icon(Icons.title),
                leading: Text("${index + 1}"),
              );
            },
          );
        },
        listener: (context, State) {},
      ),
    );
  }
}
