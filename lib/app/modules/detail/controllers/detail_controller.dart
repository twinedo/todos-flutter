import 'dart:convert';

import 'package:get/get.dart';
import 'package:jsonplaceholder_todos/app/data/todo_model.dart';
import 'package:jsonplaceholder_todos/services/todos_service.dart';

class DetailController extends GetxController {
  final detailTodo =
      TodoModel(id: 0, userId: 0, title: '', completed: false).obs;
  final RxBool isLoading = true.obs;
  final TodosService _todosService = Get.put(TodosService());
  final selectedId = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> getTodobyId(int id) async {
    final response = await _todosService.getTodoById(id);
    final data = response.body;
    if (response.statusCode == 200) {
      detailTodo.value = TodoModel.fromJson(data);
      isLoading.value = false;
    } else {
      isLoading.value = false;
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void setSelectedId(id) => selectedId(id);
}
