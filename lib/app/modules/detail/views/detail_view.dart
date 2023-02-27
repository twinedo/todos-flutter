import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_controller.dart';

class DetailView extends GetView<DetailController> {
  DetailView({Key? key}) : super(key: key);
  final int id = Get.arguments;
  @override
  Widget build(BuildContext context) {
    controller.getTodobyId(id);
    return Scaffold(
        appBar: AppBar(
          title: const Text('DetailView'),
          centerTitle: true,
        ),
        body: Obx(() {
          if (controller.isLoading.isTrue) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            final item = controller.detailTodo.value;
            return Center(
              child: Text(
                'DetailView is working ${item.title}',
                style: const TextStyle(fontSize: 20),
              ),
            );
          }
        }));
  }
}
