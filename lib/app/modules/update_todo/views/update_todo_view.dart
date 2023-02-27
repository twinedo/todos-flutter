import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jsonplaceholder_todos/app/data/todo_model.dart';
import 'package:jsonplaceholder_todos/app/modules/home/controllers/home_controller.dart';

import '../controllers/update_todo_controller.dart';

class UpdateTodoView extends GetView<UpdateTodoController> {
  UpdateTodoView({Key? key}) : super(key: key);
  final todo = Get.arguments as TodoModel;

  final TextEditingController titleC = TextEditingController();
  final UpdateTodoController _updateTodoController =
      Get.put(UpdateTodoController());
  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    titleC.text = todo.title;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Todo'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          const SizedBox(height: 20),
          TextField(
            autocorrect: false,
            controller: titleC,
            decoration: InputDecoration(
                label: const Text('Title'),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Status'),
              Obx(
                () => Switch(
                  // This bool value toggles the switch.
                  value: _updateTodoController.isCompleted.value,
                  activeColor: Colors.red,
                  onChanged: (bool value) {
                    // This is called when the user toggles the switch.
                    _updateTodoController.setIsCompleted(value);
                  },
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                if (titleC.text.isNotEmpty) {
                  _homeController.updateTodoById(
                      int.parse(todo.id.toString()), todo);
                }
              },
              child: const Text('Submit'))
        ],
      ),
    );
  }
}
