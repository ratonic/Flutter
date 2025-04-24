import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controllers/task_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final TaskController taskController = Get.put(TaskController());
  final TextEditingController _taskTitleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List of Tasks'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: taskController.tasks.length,
                  itemBuilder: (context, index) {
                    final task = taskController.tasks[index]; // Obtener la tarea correcta
                    return ListTile(
                      title: Text(task.title), // Corregido
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          taskController.deleteTask(index);
                        },
                      ),
                    );
                  },
                ),
              ),
            ), // <- Se cerró correctamente
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _taskTitleController,
                decoration: InputDecoration(
                  labelText: 'New task',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      if (_taskTitleController.text.isNotEmpty) {
                        taskController.addTask(_taskTitleController.text);
                        _taskTitleController.clear();
                      }
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
