import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/todo_model.dart';
import 'package:flutter_application_1/service/todo_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'todos_state.dart';

class TodosCubit extends Cubit<TodosState> {
  TodosCubit() : super(TodosInitial()) {
    getmytodo();
  }
  List<Todomodel> todos = [];
  getmytodo() async {
    try {
      emit(TodosLoading());

      todos = await todoservice().getusers();
      emit(TodosSuccess());
    } catch (e) {
      emit(TodosError());
    }
  }
}
