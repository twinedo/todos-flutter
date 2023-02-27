import 'package:get/get.dart';
import 'package:jsonplaceholder_todos/app/data/todo_model.dart';

class TodosService extends GetConnect {
  Future<Response> getTodos() =>
      get('https://jsonplaceholder.typicode.com/todos');

  Future<Response> getTodoById(int id) =>
      get('https://jsonplaceholder.typicode.com/todos/$id');

  Future<Response> addTodo(TodoModel todo) =>
      post('https://jsonplaceholder.typicode.com/todos', todo.toJson());

  Future<Response> updateTodoById(int id, TodoModel todo) =>
      put('https://jsonplaceholder.typicode.com/todos/$id', todo.toJson());

  Future<Response> deleteTodoById(int id) =>
      delete('https://jsonplaceholder.typicode.com/todos/$id');
}
