import 'package:get/get.dart';
import 'package:sqflite_getx/model/studentModel.dart';
import 'package:sqflite_getx/repositories/student_repository.dart';

class StudentViewModel extends GetxController {
  var allStudent = <StudentModel>[].obs;
  StudentRepository studentRepository = StudentRepository();

  @override
  void onInit() {
    fetchAllStudents() async {
      var student = await studentRepository.getStudent();
      allStudent.value = student;
    }

    super.onInit();
  }

  fetchAllStudents() async {
    var student = await studentRepository.getStudent();
    allStudent.value = student;
  }

  addStudent(StudentModel studentModel) {
    studentRepository.add(studentModel);
    fetchAllStudents();
  }

  updateStudent(StudentModel studentModel) {
    studentRepository.update(studentModel);
    fetchAllStudents();
  }

  deleteStudent(int id) {
    studentRepository.delete(id);
    fetchAllStudents();
  }
}
