import 'package:get/get.dart';
import 'package:getx/models/attendee.dart';

class AttendanceController extends GetxController {
  var attendees = <Attendee>[].obs;

  void addAttendee(String name, String id) {
    attendees.add(Attendee(name: name, id: id));
  }

  void deleteAttendee(int index) {
    attendees.removeAt(index);
  }

  void toggleAttendance(int index) {
    attendees[index].attended = !attendees[index].attended;
    attendees.refresh(); // Refresca la UI para ver los cambios
  }
}
