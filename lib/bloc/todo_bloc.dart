import 'dart:async';

import 'package:sqlite_flutter/model/todo.dart';
import 'package:sqlite_flutter/repository/todo_repository.dart';

class TodoBloc{ 
  final _todoRepository = TodoRepository(); 
  final _todoController = StreamController<List<Todo>>.broadcast(); 
  get todos => _todoController.stream; 
  TodoBloc(){ 
    getTodos();
  } 
  getTodos({String query}) async { 
    _todoController.sink.add( await _todoRepository.getAllTodods(query: query));
  } 
  addTodo(Todo todo) async{ 
    await _todoRepository.insertTodo(todo); 
    getTodos();
  } 
  updateTodo(Todo todo) async { 
    await _todoRepository.updateTodod(todo); 
    getTodos();
  } 
  deleteTodoById(int id) async  { 
    _todoRepository.deleteTodoById(id); 
    getTodos();
  } 
  dispose(){ 
    _todoController.close();
  }
}