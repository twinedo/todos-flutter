import 'package:get/get.dart';

class UpdateTodoController extends GetxController {
  final RxBool isLoading = true.obs;
  final RxBool isCompleted = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void setIsCompleted(value) => isCompleted.value = value;
}
