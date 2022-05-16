import 'package:flutter/material.dart';
import 'package:cred_management/models/academic_program.dart';

class StudentDetails extends StatefulWidget {
  final String appBarTitle;
  StudentDetails({Key? key, required this.appBarTitle}) : super(key: key);

  @override
  State<StudentDetails> createState() =>
      _StudentDetailsState(appBarTitle: appBarTitle);
}

class _StudentDetailsState extends State<StudentDetails> {
  final String appBarTitle;
  String? selectedDepartment = AcademicProgram.department.first;
  List<String> course = AcademicProgram.ASCourse;
  String? selectedCourse;

  _StudentDetailsState({required this.appBarTitle});

  @override
  Widget build(BuildContext context) {
    final studentIDController = TextEditingController();
    final firstNameController = TextEditingController();
    final lastNameController = TextEditingController();
    final middleNameController = TextEditingController();
    final admissionYearController = TextEditingController();

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
                switch (value) {
                  case 'Arts and Science':
                    course = AcademicProgram.ASCourse;
                    break;
                  case 'Business and Accountancy':
                    course = AcademicProgram.BACourse;
                    break;
                  case 'Computer Studies':
                    course = AcademicProgram.CSCourse;
                    break;
                  case 'Criminal Justice Education':
                    course = AcademicProgram.CJECourse;
                    break;
                  case 'Education':
                    course = AcademicProgram.educCourse;
                    break;
                  case 'Engineering and Architecture':
                    course = AcademicProgram.EACourse;
                    break;
                  case 'Nursing':
                    course = AcademicProgram.nursCourse;
                    break;
                }
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
          ],
        ),
      ),
    );
  }
}
