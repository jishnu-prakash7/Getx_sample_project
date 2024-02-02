// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite_getx/model/studentModel.dart';
import 'package:sqflite_getx/view_model/student_view_model.dart';

class StudentPage extends StatefulWidget {
  const StudentPage({super.key});

  @override
  State<StudentPage> createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  final studentViewModel = Get.put(StudentViewModel());
  final nameController = TextEditingController();
  int? studentId;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => Container(
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'Enter Name',
                    focusedBorder: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (nameController.text != '') {
                          studentViewModel.addStudent(
                            StudentModel(id: null, name: nameController.text),
                          );
                        }
                        nameController.text = '';
                      },
                      child: Text('Add'),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (nameController.text != '') {
                          studentViewModel.updateStudent(
                            StudentModel(
                                id: studentId, name: nameController.text),
                          );
                        }
                        nameController.text = '';
                      },
                      child: Text('Update'),
                    ),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: studentViewModel.allStudent.length,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        studentId = studentViewModel.allStudent[index].id;
                        nameController.text =
                            studentViewModel.allStudent[index].name!;
                      },
                      child: Card(
                        child: Container(
                          padding: EdgeInsetsDirectional.all(30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(studentViewModel.allStudent[index].name!),
                              IconButton(
                                  onPressed: () {
                                    studentViewModel.deleteStudent(
                                        studentViewModel.allStudent[index].id!);
                                  },
                                  icon: Icon(Icons.delete))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
