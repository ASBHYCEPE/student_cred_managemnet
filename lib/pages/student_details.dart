import 'package:flutter/material.dart';

class StudentDetails extends StatefulWidget {
  final String appBarTitle;
  StudentDetails({Key? key, required this.appBarTitle}) : super(key: key);

  @override
  State<StudentDetails> createState() =>
      _StudentDetailsState(appBarTitle: appBarTitle);
}

class _StudentDetailsState extends State<StudentDetails> {
  final String appBarTitle;

  _StudentDetailsState({required this.appBarTitle});
  @override
  Widget build(BuildContext context) {
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
              decoration: const InputDecoration(labelText: 'Student ID'),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(children: <Widget>[
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(labelText: 'First Name'),
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(labelText: 'Last Name'),
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(labelText: 'Middle Name'),
                ),
              ),
            ]),
            const SizedBox(
              height: 10.0,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Admission Year'),
            ),
          ],
        ),
      ),
    );
  }
}
