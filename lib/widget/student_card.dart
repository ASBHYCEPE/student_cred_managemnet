import 'package:cred_management/models/student.dart';
import 'package:flutter/material.dart';

class StudentCard extends StatelessWidget {
  final Student student;
  final VoidCallback onTap;
  final VoidCallback onLongPress;
  const StudentCard({
    Key? key,
    required this.onLongPress,
    required this.onTap,
    required this.student,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[300],
      child: ListTile(
        onTap: onTap,
        onLongPress: onLongPress,
        title: Text(
          student.firstName + ' ' + student.lastName,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(student.course),
      ),
    );
  }
}
