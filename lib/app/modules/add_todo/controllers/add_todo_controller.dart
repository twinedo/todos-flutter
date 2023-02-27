import 'package:get/get.dart';
import 'package:jsonplaceholder_todos/app/data/todo_model.dart';
import 'package:jsonplaceholder_todos/app/modules/home/controllers/home_controller.dart';
import 'package:jsonplaceholder_todos/services/todos_service.dart';

class AddTodoController extends GetxController {
  final TodosService _todosService = Get.put(TodosService());
  final HomeController _homeController = Get.put(HomeController());

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> addTodo(int userId, title) async {
    final newTodo =
        TodoModel(id: 1, userId: userId, title: title, completed: false);

    final response = await _todosService.addTodo(newTodo);

    if (response.statusCode == 201) {
      Get.back();
      _homeController.getTodos();
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
}
