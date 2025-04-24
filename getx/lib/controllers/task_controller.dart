import 'package:get/get.dart';
import 'package:getx/models/task.dart';

class TaskController extends GetxController {
  var tasks = <Task>[].obs;
  
  void addTask(String taskName){
    tasks.add(Task(title: taskName, completed: false));
  }
  void deleteTask(int index){
    tasks.removeAt(index);
  }
  void toggleTask(int index){
    tasks[index].completed = !tasks[index].completed;
  }
}