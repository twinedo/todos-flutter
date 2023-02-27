import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jsonplaceholder_todos/app/data/todo_model.dart';
import 'package:jsonplaceholder_todos/app/modules/add_todo/views/add_todo_view.dart';
import 'package:jsonplaceholder_todos/app/modules/detail/controllers/detail_controller.dart';
import 'package:jsonplaceholder_todos/app/modules/detail/views/detail_view.dart';
import 'package:intl/intl.dart';
import 'package:jsonplaceholder_todos/app/modules/update_todo/views/update_todo_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  final DetailController _detailController = Get.put(DetailController());

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.now();
    String formattedDate = DateFormat.yMMMMd().format(date);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App'),
        // centerTitle: true,
      ),
      body: Obx(() => controller.isLoading.isTrue
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: controller.todos.length,
              itemBuilder: (_, index) {
                final item = controller.todos[index];
                return Container(
                  padding: const EdgeInsets.all(8.0),
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    color:
                        item.completed ? Colors.green[200] : Colors.pink[100],
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Notes',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic,
                                    fontSize: 20),
                              ),
                              Text(
                                formattedDate,
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            item.title,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 20),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    Get.to(
                                      () => UpdateTodoView(),
                                      arguments: TodoModel(
                                          id: item.id,
                                          userId: item.id,
                                          title: item.title,
                                          completed: item.completed),
                                    );
                                  },
                                  child: const Text('Update')),
                              const SizedBox(width: 10),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red),
                                  onPressed: () {
                                    controller.deleteTodoById(item.id);
                                  },
                                  child: const Text('Delete'))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => AddTodoView());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
