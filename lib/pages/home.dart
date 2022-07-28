import 'package:cred_management/pages/search_student.dart';
import 'package:cred_management/pages/student_details.dart';
import 'package:cred_management/pages/student_list.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

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
          padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () async {
                        await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => StudentDetails(
                                    appBarTitle: 'Add New Student')));
                      },
                      child: const Text(
                        'ADD STUDENT',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.lightBlue),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SearchStudent()));
                      },
                      child: const Text(
                        'SEARCH STUDENT',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.lightBlue),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    StudentList(department: 'Education')));
                      },
                      child: const Text(
                        'COLLEGE OF EDUCATION',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.lightBlue),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    StudentList(department: 'Nursing')));
                      },
                      child: const Text(
                        'COLLEGE OF NURSING',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.lightBlue),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => StudentList(
                                    department: 'Computer Studies')));
                      },
                      child: const Text(
                        'COLLEGE OF COMPUTER STUDIES',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.lightBlue),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => StudentList(
                                    department: 'Arts and Sciences')));
                      },
                      child: const Text(
                        'COLLEGE OF ARTS AND SCIENCES',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.lightBlue),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => StudentList(
                                    department: 'Business and Accountancy')));
                      },
                      child: const Text(
                        'COLLEGE OF BUSINESS AND ACCOUNTANCY',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.lightBlue),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => StudentList(
                                    department: 'Criminal Justice Education')));
                      },
                      child: const Text(
                        'COLLEGE OF CRIMINAL JUSTICE EDUCATION',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.lightBlue),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => StudentList(
                                    department:
                                        'Engineering and Architecture')));
                      },
                      child: const Text(
                        'COLLEGE OF ENGINEERING AND ARCHITECTURE',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.lightBlue),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
