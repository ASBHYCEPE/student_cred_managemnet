import 'package:cred_management/models/student.dart';
import 'package:cred_management/services/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:cred_management/models/academic_program.dart';

class StudentDetails extends StatefulWidget {
  final String appBarTitle;
  final Student? student;
  StudentDetails({Key? key, required this.appBarTitle, this.student})
      : super(key: key);

  @override
  State<StudentDetails> createState() =>
      _StudentDetailsState(appBarTitle: appBarTitle, student: student);
}

class _StudentDetailsState extends State<StudentDetails> {
  final String appBarTitle;
  final Student? student;
  final studentIDController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final middleNameController = TextEditingController();
  final admissionYearController = TextEditingController();
  String? selectedDepartment;
  String? selectedCourse;
  List<String> course = [];

  _StudentDetailsState({required this.appBarTitle, this.student});

  @override
  Widget build(BuildContext context) {
    if (student != null) {
      studentIDController.text = student!.studentID;
      firstNameController.text = student!.firstName;
      lastNameController.text = student!.lastName;
      middleNameController.text = student!.middleName;
      admissionYearController.text = student!.admissionYear;
      course = getCourse(student!.department);
      selectedCourse = student!.course;
      selectedDepartment = student!.department;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        title: Text(appBarTitle),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            color: Colors.red,
            height: 3.0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Center(
              child: Text(
                'Student Information',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            TextFormField(
              controller: studentIDController,
              decoration: const InputDecoration(labelText: 'Student ID'),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(children: <Widget>[
              Expanded(
                child: TextFormField(
                  controller: firstNameController,
                  decoration: const InputDecoration(labelText: 'First Name'),
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: TextFormField(
                  controller: lastNameController,
                  decoration: const InputDecoration(labelText: 'Last Name'),
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: TextFormField(
                  controller: middleNameController,
                  decoration: const InputDecoration(labelText: 'Middle Name'),
                ),
              ),
            ]),
            const SizedBox(
              height: 10.0,
            ),
            TextFormField(
              controller: admissionYearController,
              decoration: const InputDecoration(labelText: 'Admission Year'),
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Text('Department', style: TextStyle(fontSize: 18)),
            DropdownButton(
              isExpanded: true,
              underline: Container(height: 1, color: Colors.grey[500]),
              items: AcademicProgram.department.map((e) {
                return DropdownMenuItem<String>(
                  value: e,
                  child: Text(e),
                  enabled: true,
                );
              }).toList(),
              value: selectedDepartment,
              onChanged: (String? value) {
                selectedCourse = null;
                course = getCourse(value!);
                setState(() {
                  selectedDepartment = value;
                });
              },
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Text('Course', style: TextStyle(fontSize: 18)),
            DropdownButton(
              isExpanded: true,
              underline: Container(height: 1, color: Colors.grey[500]),
              items: course.map((e) {
                return DropdownMenuItem<String>(
                  value: e,
                  child: Text(e),
                  enabled: true,
                );
              }).toList(),
              value: selectedCourse,
              onChanged: (String? value) {
                setState(() {
                  selectedCourse = value;
                });
              },
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () async {
                      final studentID = studentIDController.text;
                      final firstName = firstNameController.text;
                      final lastName = lastNameController.text;
                      final middleName = middleNameController.text;
                      final admissionYear = admissionYearController.text;
                      final department = selectedDepartment;
                      final course = selectedCourse;

                      if (studentID.isEmpty ||
                          firstName.isEmpty ||
                          middleName.isEmpty ||
                          lastName.isEmpty ||
                          admissionYear.isEmpty ||
                          department == null ||
                          course == null) {
                        return;
                      }

                      final Student model = Student(
                          studentID: studentID,
                          firstName: firstName,
                          lastName: lastName,
                          middleName: middleName,
                          admissionYear: admissionYear,
                          department: department,
                          course: course);

                      if (student == null) {
                        DatabaseHelper.instance.addStudent(model);
                      } else {
                        DatabaseHelper.instance.updateStudent(model);
                      }

                      Navigator.pop(context);
                    },
                    child: const Text(
                      'SAVE STUDENT',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    style:
                        TextButton.styleFrom(backgroundColor: Colors.lightBlue),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  List<String> getCourse(String department) {
    switch (department) {
      case 'Arts and Science':
        return AcademicProgram.ASCourse;
      case 'Business and Accountancy':
        return AcademicProgram.BACourse;
      case 'Computer Studies':
        return AcademicProgram.CSCourse;
      case 'Criminal Justice Education':
        return AcademicProgram.CJECourse;
      case 'Education':
        return AcademicProgram.educCourse;
      case 'Engineering and Architecture':
        return AcademicProgram.EACourse;
      default:
        return AcademicProgram.nursCourse;
    }
  }
}
