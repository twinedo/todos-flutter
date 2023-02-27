import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jsonplaceholder_todos/app/data/todo_model.dart';
import 'package:jsonplaceholder_todos/services/todos_service.dart';

class HomeController extends GetxController {
  final RxList<TodoModel> todos = <TodoModel>[].obs;
  final RxBool isLoading = true.obs;
  final TodosService _todosService = Get.put(TodosService());

  @override
  void onInit() {
    super.onInit();
    getTodos();
  }

  Future<void> getTodos() async {
    final response = await _todosService.getTodos();
    final data = response.body as List;
    if (response.statusCode == 200) {
      var dataUsers = data.map((e) => TodoModel.fromJson(e)).toList();

      todos.addAll(dataUsers);
      isLoading.value = false;
    } else {
      isLoading.value = false;
    }
  }

  Future<void> deleteTodoById(int id) async {
    final response = await _todosService.deleteTodoById(id);
    if (response.statusCode == 200) {
      todos.removeWhere((element) => element.id == id);
      Get.snackbar('Successfully', 'Delete Note Successfully',
          backgroundColor: Colors.green[400]);
    }
  }

  Future<void> updateTodoById(int id, TodoModel todo) async {
    final response = await _todosService.updateTodoById(id, todo);

    if (response.statusCode == 200) {
      final index = todos.indexWhere((t) => t.id == id);
      todos[index] = todo;

      Get.snackbar('Successfully', 'Update Note Successfully',
          backgroundColor: Colors.green[400]);
      Get.back();
    }
  }
}
