import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_todo_controller.dart';

class AddTodoView extends GetView<AddTodoController> {
  AddTodoView({Key? key}) : super(key: key);

  final TextEditingController titleC = TextEditingController(text: '');
  final TextEditingController userIdC = TextEditingController(text: '');
  final AddTodoController _addTodoController = Get.put(AddTodoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddTodoView'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          const Center(
            child: Text(
              'AddTodoView is working',
              style: TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            autocorrect: false,
            controller: userIdC,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                label: const Text('User ID'),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
          ),
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
          ElevatedButton(
              onPressed: () {
                if (userIdC.text.isNotEmpty && titleC.text.isNotEmpty) {
                  _addTodoController.addTodo(
                      int.parse(userIdC.text), titleC.text);
                }
              },
              child: const Text('Submit'))
        ],
      ),
    );
  }
}
