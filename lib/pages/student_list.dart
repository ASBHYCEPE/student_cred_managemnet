import 'package:cred_management/pages/student_details.dart';
import 'package:flutter/material.dart';

class StudentList extends StatefulWidget {
  StudentList({Key? key}) : super(key: key);

  @override
  State<StudentList> createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        title: const Text('Credential Management'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            color: Colors.red,
            height: 3.0,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      StudentDetails(appBarTitle: 'Add New Student')));
          setState(() {});
        },
        child: const Icon(Icons.person_add),
      ),
      body: Container(),
    );
  }
}
