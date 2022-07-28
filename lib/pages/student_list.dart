import 'package:cred_management/models/student.dart';
import 'package:cred_management/pages/student_details.dart';
import 'package:cred_management/services/database_helper.dart';
import 'package:cred_management/widget/student_card.dart';
import 'package:flutter/material.dart';

class StudentList extends StatefulWidget {
  String department;
  StudentList({Key? key, required this.department}) : super(key: key);

  @override
  State<StudentList> createState() => _StudentListState(department);
}

class _StudentListState extends State<StudentList> {
  final String department;

  _StudentListState(this.department);

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
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: FutureBuilder<List<Student>?>(
            future: DatabaseHelper.instance.getAllStudent(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Student>?> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              } else if (snapshot.hasData) {
                if (snapshot.data != null) {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) => snapshot
                              .data![index].department
                              .contains(department)
                          ? StudentCard(
                              student: snapshot.data![index],
                              onTap: () async {
                                await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => StudentDetails(
                                              student: snapshot.data![index],
                                              appBarTitle: 'UPDATE STUDENT',
                                            )));
                                setState(() {});
                              },
                              onLongPress: () async {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: const Text(
                                            'Are your sure you want to delete this?'),
                                        actions: [
                                          ElevatedButton(
                                            child: const Text('YES'),
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        Colors.red)),
                                            onPressed: () async {
                                              await DatabaseHelper.instance
                                                  .deleteStudent(
                                                      snapshot.data![index]);
                                              Navigator.pop(context);
                                              setState(() {});
                                            },
                                          ),
                                          ElevatedButton(
                                              child: const Text('NO'),
                                              style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                          Colors.green)),
                                              onPressed: () =>
                                                  Navigator.pop(context))
                                        ],
                                      );
                                    });
                              },
                            )
                          : const Center(
                              child: Text('NO AVAILABLE STUDENTS'),
                            ));
                }
              }
              return const Center(
                child: Text('NO AVAILABLE STUDENTS'),
              );
            }),
      ),
    );
  }
}
