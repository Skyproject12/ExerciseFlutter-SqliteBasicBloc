import 'package:sqlite_flutter/dao/todo_dao.dart';
import 'package:sqlite_flutter/model/todo.dart';

class TodoRepository { 
  final todoDao  = TodoDao(); 
  Future getAllTodods({String query}) => todoDao.getTodos(query: query); 
  Future insertTodo(Todo todo) => todoDao.createTodo(todo); 
  Future updateTodod(Todo todo) => todoDao.updateTodo(todo); 
  Future deleteTodoById(int id) => todoDao.deleteTodo(id); 
  Future deleteAllTodods() => todoDao.deleteAllTodos();
}