import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controllers/attendance_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final AttendanceController attendanceController = Get.put(AttendanceController());
  final TextEditingController nameController = TextEditingController();
  final TextEditingController idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista de Asistencia')),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Obx(() => ListView.builder(
                    itemCount: attendanceController.attendees.length,
                    itemBuilder: (context, index) {
                      final attendee = attendanceController.attendees[index];
                      return ListTile(
                        title: Text('${attendee.name} - ${attendee.id}'),
                        subtitle: Text(attendee.attended ? 'Asistió' : 'No asistió'),
                        leading: Checkbox(
                          value: attendee.attended,
                          onChanged: (_) => attendanceController.toggleAttendance(index),
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => attendanceController.deleteAttendee(index),
                        ),
                      );
                    },
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(labelText: 'Nombre'),
                  ),
                  TextField(
                    controller: idController,
                    decoration: const InputDecoration(labelText: 'Identificación'),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      if (nameController.text.isNotEmpty && idController.text.isNotEmpty) {
                        attendanceController.addAttendee(nameController.text, idController.text);
                        nameController.clear();
                        idController.clear();
                      }
                    },
                    child: const Text('Agregar'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
